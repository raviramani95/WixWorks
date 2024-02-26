using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading;
using System.Xml.Linq;
using WixToolset.Dtf.WindowsInstaller;
using Newtonsoft.Json.Linq;
using Microsoft.Web.Administration;
using System.Windows.Forms;

namespace CustomAction
{
    public class CustomActions
    {
        #region Properties
        // Registry key
        const string AUTOROSTERINGKEY = @"SOFTWARE\Advanced\AutoRostering";

        // Backup location
        const string BACKUP_LOCATION = @"C:\AutoRosteringBackup\FileBackup";
        //DBBackup Location
        const string DBBACKUP_LOCATION = @"C:\AutoRosteringBackup\DBBackup";

        // Backup files 
        const string APP_SETTINGS = @"api\appsettings.json";
        const string APP_SETTINGS_DEVELOPMENT = @"api\appsettings.Development.json";
        const string WEB_CONFIG = @"api\web.config";
        const string UI_CONFIG = @"assets\config.json";

        // Default value
        const string DEFAULT_APP_POOL = "AutoRostering";
        const string DEFAULT_VIRTUAL_DIR = "AutoRostering";

        // Log folder
        const string LOG_FOLDER = @"api\Logs";

        #endregion
        //Note: to debug custom action method. Add this line : "System.Diagnostics.Debugger.Launch();" at the place of first line of the method.

        #region Custom Actions - Registry read/write

        static string ReadRegistryKey(string aKey, string aName, string aDefaultValue)
        {
            // Get key
            RegistryKey baseKey = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry64);
            RegistryKey lKey = baseKey.OpenSubKey(aKey);

            // Get value
            string lValue = lKey == null ? aDefaultValue : lKey.GetValue(aName, aDefaultValue).ToString();

            // Ensure we have a value
            if (string.IsNullOrEmpty(lValue))
            {
                lValue = aDefaultValue;
            }

            return lValue;
        }

        static void WriteRegistryKey(string aKey, string aName, string aValue)
        {
            RegistryKey lKey = Registry.LocalMachine.CreateSubKey(aKey);
            lKey.SetValue(aName, aValue);
        }

        /// <summary>
        /// Read Auto Rostering registry values.
        /// The current WiX build scripts do not read/write all registry values so we do it manually here and populate the WiX properties.
        /// </summary>
        /// <param name="aSession"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult ReadAutoRosteringRegistry(Session aSession)
        {
            try
            {
                ReadAppSettingFile(aSession);

                // Read registry 
                string websiteHeader = ReadRegistryKey(AUTOROSTERINGKEY, "WebsiteHeader", string.Empty);
                string databaseUser = ReadRegistryKey(AUTOROSTERINGKEY, "DatabaseUser", string.Empty);
                string databaseServer = ReadRegistryKey(AUTOROSTERINGKEY, "DatabaseServer", string.Empty);
                string databaseName = ReadRegistryKey(AUTOROSTERINGKEY, "DatabaseName", string.Empty);
                string installedVersion = ReadRegistryKey(AUTOROSTERINGKEY, "Version", string.Empty);
                string installFolder = ReadRegistryKey(AUTOROSTERINGKEY, "InstallDirPath", string.Empty);
                string virtualDirectory = ReadRegistryKey(AUTOROSTERINGKEY, "VirtualDirectory", string.Empty);
                string externalUrl = ReadRegistryKey(AUTOROSTERINGKEY, "ExternalUrl", string.Empty);
                string applicationPool = ReadRegistryKey(AUTOROSTERINGKEY, "ApplicationPool", string.Empty);

                // Write session property value based on registry value if it's null then set default value
                aSession["INSTALLED_VERSION"] = installedVersion;
                aSession["WEBSITE_IP"] = "*";
                aSession["WEBSITE_PORT"] = "443";
                aSession["WEBSITE_NAME"] = "Default Web Site";
                aSession["VIRTUAL_DIRECTORY"] = string.IsNullOrEmpty(virtualDirectory) ? DEFAULT_VIRTUAL_DIR : virtualDirectory;
                aSession["APPLICATION_POOL"] = string.IsNullOrEmpty(applicationPool) ? DEFAULT_APP_POOL : applicationPool;
                aSession["EXTERNAL_URL"] = externalUrl;
                aSession["WEBSITE_HEADER"] = websiteHeader;
                aSession["DB_USER"] = databaseUser;
                aSession["DB_SERVER"] = databaseServer;
                aSession["DB_DATABASE"] = databaseName;

                if (!string.IsNullOrEmpty(installFolder))
                    aSession["INSTALLFOLDER"] = installFolder;

                if (applicationPool == "DefaultAppPool")
                {
                    aSession["USE_DEFAULT_APP_POOL"] = "1";
                    aSession["APPLICATION_POOL"] = "";
                }

                return ActionResult.Success;
            }
            catch (Exception ex)
            {
                HandleException(aSession, ex);
                return ActionResult.Failure;
            }
        }

        /// <summary>
        /// Write Auto Rostering registry values
        /// </summary>
        /// <param name="aSession"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult WriteAutorosteringRegistry(Session aSession)
        {
            try
            {
                string lValue = aSession["IMPERSONATED_PASSWORD"];
                // Write
                WriteRegistryKey(AUTOROSTERINGKEY, "Any Value", lValue);

                return ActionResult.Success;
            }
            catch (Exception ex)
            {
                HandleException(aSession, ex);
                return ActionResult.Failure;
            }
        }
        #endregion

        #region Custom Action
        #region Update application files

        [CustomAction]
        public static ActionResult ReadAppSettingFile(Session session)
        {
            try
            {
                string targetDirPath = ReadRegistryKey(AUTOROSTERINGKEY, "InstallDirPath", string.Empty);
                if (!string.IsNullOrEmpty(targetDirPath))
                {
                    string appSetingfilePath = Path.Combine(targetDirPath, "api\\appsettings.json");
                    string appSettingsJson = File.ReadAllText(appSetingfilePath);
                    JObject appSettings = JObject.Parse(appSettingsJson);

                    string configuration = appSettings["ConnectionString"]["ESolveDEV"]?.ToString();
                    if (!string.IsNullOrEmpty(configuration))
                    {
                        var databaseConfigurations = configuration.Split(';');

                        foreach (var i in databaseConfigurations)
                        {
                            var value = i.Split('=');
                            switch (value[0])
                            {
                                case "Server":
                                    session["DB_USER"] = value[1];
                                    break;
                                case "Database":
                                    session["DB_DATABASE"] = value[1];
                                    break;
                                case "User Id":
                                    session["DB_USER"] = value[1];
                                    break;
                                case "Password":
                                    session["DB_PASSWORD"] = value[1];
                                    break;

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }

            return ActionResult.Success;
        }
        /// <summary>
        /// Update application file : appSetings.json, config.json
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult UpdateApplicationFiles(Session session)
        {
            #region CustomActionData
            string targetDirPath = session.CustomActionData["INSTALLFOLDER"];
            string dbServer = session.CustomActionData["DB_SERVER"];
            string dbName = session.CustomActionData["DB_DATABASE"];
            string dbUser = session.CustomActionData["DB_USER"];
            string dbPassword = session.CustomActionData["DB_PASSWORD"];
            string hostName = session.CustomActionData["WEBSITE_HEADER"];
            string virtualDir = session.CustomActionData["VIRTUAL_DIRECTORY"];
            #endregion

            try
            {
                ActionStart("Configuring the UI and API Settings", session);
                Thread.Sleep(2000);

                #region Update AppSettings file
                string appSetingfilePath = Path.Combine(targetDirPath, "api\\appsettings.json");

                string connectionString = $"Server={dbServer};Database={dbName};User Id={dbUser};Password={dbPassword};MultipleActiveResultSets=true;TrustServerCertificate=True;Integrated Security=False;";

                string appSettingsJson = File.ReadAllText(appSetingfilePath);
                JObject appSettings = JObject.Parse(appSettingsJson);

                // Update Connection String
                appSettings["ConnectionString"]["ESolveDEV"] = connectionString;

                // Update Application address and API address
                appSettings["ApplicationAddress"] = $"https://{hostName}/{virtualDir}";
                appSettings["APIAddress"] = $"https://{hostName}/{virtualDir}/api";

                // Generate 63 random alpha-numeric characters(a - z, A - Z, 0 - 9) and
                // Update Secret and ClientID
                appSettings["AppSettings"]["Secret"] = GetAlphaNumericString() + GetAlphaNumericString();
                appSettings["AppSettings"]["ClientID"] = GetAlphaNumericString();


                string modifiedAppSettingJson = appSettings.ToString(Newtonsoft.Json.Formatting.Indented);

                File.WriteAllText(appSetingfilePath, modifiedAppSettingJson);
                #endregion

                #region Update Config file
                string configfilePath = Path.Combine(targetDirPath, "assets\\config.json");

                string configJson = File.ReadAllText(configfilePath);

                JObject config = JObject.Parse(configJson);

                config["API_URL"] = $"https://{hostName}/{virtualDir}/api/";

                string modifiedConfigJson = config.ToString(Newtonsoft.Json.Formatting.Indented);

                File.WriteAllText(configfilePath, modifiedConfigJson);
                #endregion

                ActionStart("Configuring the IIS Settings", session);
                Thread.Sleep(2000);

                return ActionResult.Success;
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
        }
        #endregion

        #region Install Options page CA

        /// <summary>
        /// setup Website Property
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult WebsiteSetup(Session session)
        {
            try
            {
                string externalUrl = session["EXTERNAL_URL"];
                if (!string.IsNullOrEmpty(externalUrl))
                {
                    session["WEBSITE_HEADER"] = externalUrl;
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }

        [CustomAction]
        public static ActionResult SetIisOptions(Session session)
        {
            string appPool = session["APPLICATION_POOL"];
            string isDefaultAppPool = session["USE_DEFAULT_APP_POOL"];
            string virtualDir = session["VIRTUAL_DIRECTORY"];

            session.Log("SetIisOptions custom action start...");
            session.Log($"Properties :- Application pool : {appPool}, Is DefaultAppPool checked : {isDefaultAppPool}, Virtual Dir : {virtualDir}");

            try
            {
                if (!string.IsNullOrEmpty(isDefaultAppPool) && isDefaultAppPool == "1")
                {
                    session["APPLICATION_POOL"] = "DefaultAppPool";
                }
                else if (string.IsNullOrEmpty(isDefaultAppPool) && string.IsNullOrEmpty(appPool))
                {
                    appPool = ReadRegistryKey(AUTOROSTERINGKEY, "ApplicationPool", string.Empty);
                    session["APPLICATION_POOL"] = string.IsNullOrEmpty(appPool) ? DEFAULT_APP_POOL : appPool;
                }
                else if (string.IsNullOrEmpty(virtualDir))
                {
                    virtualDir = ReadRegistryKey(AUTOROSTERINGKEY, "VirtualDirectory", string.Empty);
                    session["VIRTUAL_DIRECTORY"] = string.IsNullOrEmpty(virtualDir) ? DEFAULT_VIRTUAL_DIR : virtualDir;
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            session.Log($"Current Properties :- Application pool : {session["APPLICATION_POOL"]}, Virtual Dir : {session["VIRTUAL_DIRECTORY"]}");
            session.Log("SetIisOptions custom action end...");
            return ActionResult.Success;
        }
        #endregion

        #region UnInstall CA 
        /// <summary>
        /// Setup the properties for uninstall msi
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult SetPropertyForUninstall(Session session)
        {
            string websiteName = session["WEBSITE_NAME"];
            string appPool = session["APPLICATION_POOL"];
            string virtualDirectory = session["VIRTUAL_DIRECTORY"];
            string installFolder = session["INSTALLFOLDER"];

            session.Log("SetPropertyForUninstall custom action start...");
            session.Log($"Properties :- WebSite : {websiteName}, AppPool : {appPool}, VirtualDir : {virtualDirectory}, InstallFolder : {installFolder}");

            try
            {
                if (String.IsNullOrEmpty(websiteName))
                {
                    session["WEBSITE_NAME"] = ReadRegistryKey(AUTOROSTERINGKEY, "WebsiteName", string.Empty);
                }
                if (String.IsNullOrEmpty(appPool))
                {
                    session["APPLICATION_POOL"] = ReadRegistryKey(AUTOROSTERINGKEY, "AppPool", string.Empty);
                }
                if (String.IsNullOrEmpty(virtualDirectory))
                {
                    session["VIRTUAL_DIRECTORY"] = ReadRegistryKey(AUTOROSTERINGKEY, "VirtualDirectory", string.Empty);
                }
                if (String.IsNullOrEmpty(installFolder))
                {
                    session["INSTALLFOLDER"] = ReadRegistryKey(AUTOROSTERINGKEY, "InstallDirPath", string.Empty);
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            session.Log($"Properties :- WebSite : {session["WEBSITE_NAME"]}, AppPool : {session["APPLICATION_POOL"]}, VirtualDir : {session["VIRTUAL_DIRECTORY"]}, InstallFolder : {session["INSTALLFOLDER"]}");
            session.Log("SetPropertyForUninstall custom action end...");
            return ActionResult.Success;
        }

        /// <summary>
        /// Remove installed directory and Published IIS website on UnInstall application
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult RunOnUninsatll(Session session)
        {
            string websiteName = session.CustomActionData["WEBSITE_NAME"];
            string appPoolName = session.CustomActionData["APPLICATION_POOL"];
            string installedDir = session.CustomActionData["INSTALLFOLDER"];

            try
            {
                // remove virtual directory and associated appPool
                using (ServerManager serverManager = new ServerManager())
                {
                    Microsoft.Web.Administration.Site site = serverManager.Sites.FirstOrDefault(s =>
                       s.Name.Equals(websiteName, StringComparison.OrdinalIgnoreCase));

                    if (site != null && !string.IsNullOrEmpty(appPoolName) && appPoolName != "DefaultAppPool")
                    {
                        // Find the application pool by name
                        ApplicationPool appPool = serverManager.ApplicationPools.FirstOrDefault(ap =>
                                ap.Name.Equals(appPoolName, StringComparison.OrdinalIgnoreCase));

                        try
                        {
                            if (appPool != null)
                            {
                                serverManager.ApplicationPools.Remove(appPool);
                                serverManager.CommitChanges();
                            }
                        }
                        catch
                        {
                            //it used by another application
                        }
                    }
                }

                // remove install dir if it exists
                if (Directory.Exists(installedDir))
                {
                    Directory.Delete(installedDir, true);
                }
            }
            catch (Exception ex)
            {
                //
            }
            return ActionResult.Success;
        }
        #endregion

        #region Backup & Restore CA
        /// <summary>
        /// Backup files when upgrade version found
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult BackupFiles(Session session)
        {
            try
            {
                ActionStart("Acquiring application files", session);
                Thread.Sleep(2000);

                string installedDir = session.CustomActionData["INSTALLFOLDER"];
                string backupLocation = BACKUP_LOCATION;

                if (Directory.Exists(installedDir))
                {
                    string[] filesToBackup = new string[]
                    {
                        Path.Combine(installedDir, APP_SETTINGS),
                        Path.Combine(installedDir, APP_SETTINGS_DEVELOPMENT),
                        Path.Combine(installedDir, WEB_CONFIG),
                        Path.Combine(installedDir, UI_CONFIG)
                    };

                    if (File.Exists(backupLocation))
                        Directory.Delete(backupLocation, true);

                    Directory.CreateDirectory(backupLocation);

                    foreach (string filePath in filesToBackup)
                    {
                        if (File.Exists(filePath))
                        {
                            string fileName = Path.GetFileName(filePath);
                            string backupFilePath = Path.Combine(backupLocation, fileName);
                            File.Copy(filePath, backupFilePath, true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }

            return ActionResult.Success;
        }

        /// <summary>
        /// Restore files when upgrade done
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult RestoreFiles(Session session)
        {
            try
            {
                string installedDir = session.CustomActionData["INSTALLFOLDER"];
                string backupLocation = BACKUP_LOCATION;

                if (Directory.Exists(backupLocation))
                {
                    string[] filesToRestore = new string[]
                    {
                        Path.Combine(backupLocation, Path.GetFileName(APP_SETTINGS)),
                        Path.Combine(backupLocation, Path.GetFileName(APP_SETTINGS_DEVELOPMENT)),
                        Path.Combine(backupLocation, Path.GetFileName(WEB_CONFIG)),
                        Path.Combine(backupLocation, Path.GetFileName(UI_CONFIG))
                    };

                    foreach (string filePath in filesToRestore)
                    {
                        if (File.Exists(filePath))
                        {
                            string restoreFileName = Path.GetFileName(filePath);
                            string restoreFilePath = string.Empty;

                            if (restoreFileName == "config.json")
                            {
                                restoreFilePath = Path.Combine(installedDir, Path.Combine(@"assets\", restoreFileName));
                            }
                            else
                            {
                                restoreFilePath = Path.Combine(installedDir, Path.Combine(@"api\", restoreFileName));
                            }
                            File.Copy(filePath, restoreFilePath, true);
                        }
                    }
                    Directory.Delete(backupLocation, true);
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }

            return ActionResult.Success;
        }
        #endregion

        #region Success dialog CA

        /// <summary>
        /// Update the successful dialog properties
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult UpdateSuccessDlgProperties(Session session)
        {
            try
            {
                string installdir = session["INSTALLFOLDER"];

                session["INSTALL_LOG_FOLDER"] = Path.Combine(installdir + LOG_FOLDER);
                session["INSTANCE_URL"] = "https://" + session["WEBSITE_HEADER"] + ":" + session["WEBSITE_PORT"] + "/" + session["VIRTUAL_DIRECTORY"];
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }

        /// <summary>
        /// Copy Instance URL
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult CopyUrl(Session session)
        {
            try
            {
                string instanceURL = session["INSTANCE_URL"];
                Thread thread = new Thread(() => Clipboard.SetText(instanceURL));
                thread.SetApartmentState(ApartmentState.STA); //Set the thread to STA
                thread.Start();
                thread.Join();
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }

        /// <summary>
        /// Open install folder
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult OpenFolder(Session session)
        {
            try
            {
                string installFolderPath = session["INSTALLFOLDER"];
                if (Directory.Exists(installFolderPath))
                {
                    installFolderPath = installFolderPath.Substring(0, installFolderPath.Length - 1);
                    System.Diagnostics.Process.Start(installFolderPath);
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }

        /// <summary>
        /// Open install log folder
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult OpenLogFolder(Session session)
        {
            try
            {
                string installLogFolderPath = session["INSTALL_LOG_FOLDER"];
                if (Directory.Exists(installLogFolderPath))
                {
                    System.Diagnostics.Process.Start(installLogFolderPath);
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }

        [CustomAction]
        public static ActionResult OpenDbBackupFolder(Session session)
        {
            try
            {
                string dbBackupFolderPath = session["DBBACKUPPATH"];
                if (Directory.Exists(dbBackupFolderPath))
                {
                    System.Diagnostics.Process.Start(dbBackupFolderPath);
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }

        /// <summary>
        /// Open Link on Browser
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        [CustomAction]
        public static ActionResult OpenConnectNowUrl(Session session)
        {
            try
            {
                string website = session["INSTANCE_URL"];
                System.Diagnostics.Process.Start(website);
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }

        [CustomAction]
        public static ActionResult BackupDatabase(Session session)
        {
            try
            {
                string dbName = session.CustomActionData["DB_DATABASE"];
                string installedVersion = ReadRegistryKey(AUTOROSTERINGKEY, "Version", string.Empty);

                if (!Directory.Exists(DBBACKUP_LOCATION))
                    Directory.CreateDirectory(DBBACKUP_LOCATION);

                string backupFileName = "AR_v" + session.CustomActionData["INSTALLED_VERSION"] + dbName + DateTime.Now.ToString("yyyyMMddhhmm") + ".bak";

                string backupPath = DBBACKUP_LOCATION + "\\" + backupFileName;

                bool isDatabaseExists = CheckIfDatabaseExist(GetConnectionString(session, "master"), dbName);
                if (isDatabaseExists)
                {
                    using (SqlConnection connection = new SqlConnection(GetConnectionString(session, null)))
                    {
                        connection.Open();
                        string query = $"BACKUP DATABASE " + dbName + " TO DISK='" + backupPath + "' ";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                        session.CustomActionData["DBBACKUPPATH"] = backupPath;
                    }
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }

            return ActionResult.Success;
        }

        [CustomAction]
        public static ActionResult TestDatabaseConnection(Session session)
        {
            string dbServer = session["DB_SERVER"];
            string dbName = session["DB_DATABASE"];
            string dbUser = session["DB_USER"];
            string dbPassword = session["DB_PASSWORD"];
            string databaseNameFromRegistry = ReadRegistryKey(AUTOROSTERINGKEY, "DatabaseName", string.Empty);

            dbName = string.IsNullOrEmpty(databaseNameFromRegistry) ? "master" : dbName;

            try
            {
                string connectionString = $"Server={dbServer};Database={dbName};User Id={dbUser};Password={dbPassword};";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    if (connection.State == ConnectionState.Open)
                        MessageBox.Show("Database connection test successful.");
                    else
                        MessageBox.Show("Failed to connect to database.");
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }
            return ActionResult.Success;
        }


        #endregion

        #region ASSO Admin User
        [CustomAction]
        public static ActionResult AddSuperAdminUserDetails(Session session)
        {
            string organisationRef = session.CustomActionData["ORG_REF"];
            string emailAddress = session.CustomActionData["EMAIL_ID"];
            string advancedId = session.CustomActionData["ADVANCED_ID"];
            string dbName = session.CustomActionData["DB_DATABASE"];

            try
            {
                bool isDatabaseExists = CheckIfDatabaseExist(GetConnectionString(session, "master"), dbName);
                if (isDatabaseExists)
                {
                    using (SqlConnection connection = new SqlConnection(GetConnectionString(session, null)))
                    {
                        connection.Open();
                        string query = $"exec spASSOConfigurations @Email = '" + emailAddress + "', @AdvancedId = '" + advancedId + "', @OrganisationReference = '" + organisationRef + "'";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                HandleException(session, ex);
                return ActionResult.Failure;
            }

            return ActionResult.Success;
        }

        #endregion

        #endregion

        #region Helpers
        private static void ActionStart(string message, Session session)
        {
            using (Record r = new Record(3))
            {
                r.SetString(1, "ProgressBarText");
                r.SetString(2, message);
                session.Message(InstallMessage.ActionStart, r);
            }
        }

        private static string GetAlphaNumericString()
        {
            Random random = new Random();
            const string chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

            return new string(Enumerable.Repeat(chars, 63)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private static void RemoveBackupFolder()
        {
            try
            {
                if (Directory.Exists(BACKUP_LOCATION))
                    Directory.Delete(BACKUP_LOCATION, true);
            }
            catch
            {
                //
            }
        }

        private static bool CheckIfDatabaseExist(string connectionString, string dbName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string queryToCheckDatabaseExists = $"SELECT COUNT(*) FROM sys.databases where name = '" + dbName + "'";

                using (SqlCommand command = new SqlCommand(queryToCheckDatabaseExists, connection))
                {
                    int tableCount = (int)command.ExecuteScalar();
                    return tableCount > 0;
                }
            }
        }

        private static string GetConnectionString(Session session, string databaseName)
        {
            string dbServer = session.CustomActionData["DB_SERVER"];
            string dbName = !string.IsNullOrEmpty(databaseName) ? databaseName : session.CustomActionData["DB_DATABASE"];
            string dbUser = session.CustomActionData["DB_USER"];
            string dbPassword = session.CustomActionData["DB_PASSWORD"];

            string connectionString = $"Server={dbServer};Database={dbName};User Id={dbUser};Password={dbPassword};MultipleActiveResultSets=true;TrustServerCertificate=True;Integrated Security=False;";
            return connectionString;
        }
        #endregion

        #region Handle Exception
        /// <summary>
        /// Standard method for handling exceptions generated by a custom action
        /// </summary>
        static void HandleException(Session session, Exception ex)
        {
            RemoveBackupFolder();
            session.Log(ex.Message);
            session.Log(ex.StackTrace);

            System.Windows.Forms.MessageBox.Show(
                "An unexpected error has occured:" +
                Environment.NewLine +
                "\t" + ex.Message +
                Environment.NewLine +
                Environment.NewLine +
                "Running the install with a log file may provide more details about what went wrong." +
                Environment.NewLine +
                "Example: msiexec /i AutoRostering.msi /l*v log.log");

            throw ex;
        }
        #endregion
    }
}
