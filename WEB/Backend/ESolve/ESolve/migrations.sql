IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAbsenceCodes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Color] nvarchar(9) NOT NULL,
        [CountsForReconciliation] bit NOT NULL,
        [CountsForRefPeriodAbs] bit NOT NULL,
        CONSTRAINT [PK_tblAbsenceCodes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAbsencePermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [AbsenceCalendar] bit NULL,
        [GenerateRequests] bit NULL,
        CONSTRAINT [PK_tblAbsencePermissions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAbsencePreferences] (
        [Id] bigint NOT NULL IDENTITY,
        [DeadlineDays] int NOT NULL,
        CONSTRAINT [PK_tblAbsencePreferences] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAbsenceStatuses] (
        [Id] bigint NOT NULL IDENTITY,
        [Status] nvarchar(max) NOT NULL,
        [Color] nvarchar(9) NOT NULL,
        CONSTRAINT [PK_tblAbsenceStatuses] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAgencies] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(150) NOT NULL,
        CONSTRAINT [PK_tblAgencies] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAgencyReasonsToCover] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(150) NOT NULL,
        CONSTRAINT [PK_tblAgencyReasonsToCover] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAutoSolveTime] (
        [Id] bigint NOT NULL IDENTITY,
        [Time] int NOT NULL,
        CONSTRAINT [PK_tblAutoSolveTime] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblClasses] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblClasses] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblCompanies] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(200) NOT NULL,
        [HeaderBar] nvarchar(max) NULL,
        [NavigationBar] nvarchar(max) NULL,
        [Logo] varbinary(max) NULL,
        CONSTRAINT [PK_tblCompanies] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintRules] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_tblConstraintRules] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblCostCodes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblCostCodes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblCustomDataTypes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblCustomDataTypes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblDepartments] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblDepartments] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblDivsions] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblDivsions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmailSettings] (
        [Id] bigint NOT NULL IDENTITY,
        [SmtpServer] nvarchar(max) NOT NULL,
        [SmtpPort] int NOT NULL,
        [SmtpAddress] nvarchar(max) NOT NULL,
        [SmtpPassword] nvarchar(max) NULL,
        CONSTRAINT [PK_tblEmailSettings] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeePermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [EmployeeAvailability] bit NULL,
        [EmployeeAbsenceAuthorisation] bit NULL,
        [EmployeeDetails] bit NULL,
        [EmployeeDetailsMaintenance] bit NULL,
        CONSTRAINT [PK_tblEmployeePermissions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeeTile] (
        [Id] bigint NOT NULL IDENTITY,
        [EmployeeNumber] bit NOT NULL,
        [Gender] bit NOT NULL,
        [Location] bit NOT NULL,
        [Department] bit NOT NULL,
        [CostCode] bit NOT NULL,
        [Division] bit NOT NULL,
        [JobTitle] bit NOT NULL,
        [Team] bit NOT NULL,
        [Class] bit NOT NULL,
        [JobType] bit NOT NULL,
        [TargetRuleGroup] bit NOT NULL,
        [WorkRules] bit NOT NULL,
        [Manager] bit NOT NULL,
        [StartDate] bit NOT NULL,
        [LeaveDate] bit NOT NULL,
        [Address2] bit NOT NULL,
        [Address1] bit NOT NULL,
        [Address3] bit NOT NULL,
        [Address4] bit NOT NULL,
        [DateOfBirth] bit NOT NULL,
        [TelephoneNumber] bit NOT NULL,
        [MobileNumber] bit NOT NULL,
        [PayRate] bit NOT NULL,
        [MaxHours1] bit NOT NULL,
        [MaxHours2] bit NOT NULL,
        [MaxHours3] bit NOT NULL,
        [MaxHours4] bit NOT NULL,
        [MaxHours5] bit NOT NULL,
        [AllowedTrades] bit NOT NULL,
        [Availability] bit NOT NULL,
        [Email] bit NOT NULL,
        [ScheduledHours] bit NOT NULL,
        [AdditionalInfo] bit NOT NULL,
        CONSTRAINT [PK_tblEmployeeTile] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblGDPR] (
        [Id] bigint NOT NULL IDENTITY,
        [Period] nvarchar(max) NULL,
        [Count] bigint NULL,
        CONSTRAINT [PK_tblGDPR] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblGenders] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblGenders] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblImageSizes] (
        [Id] bigint NOT NULL IDENTITY,
        [Size] nvarchar(10) NOT NULL,
        [Width] int NOT NULL,
        [Height] int NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblImageSizes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobOfferStatuses] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblJobOfferStatuses] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobsLocked] (
        [Id] bigint NOT NULL IDENTITY,
        [JobAvailabilityID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        [JobStartDate] datetime2 NOT NULL,
        [JobEndDateTime] datetime2 NOT NULL,
        [IsCompletelyValid] bit NOT NULL,
        [UserID] bigint NOT NULL,
        CONSTRAINT [PK_tblJobsLocked] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobStatuses] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(100) NOT NULL,
        [PrimaryColor] nvarchar(9) NULL,
        [SecondaryColor] nvarchar(9) NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblJobStatuses] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobTitles] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblJobTitles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLicences] (
        [Id] bigint NOT NULL IDENTITY,
        [InstallationKey] nvarchar(3000) NULL,
        [ComnpanyName] nvarchar(3000) NULL,
        [LicenceKey] nvarchar(3000) NULL,
        [CompanyHeadCount] int NOT NULL,
        CONSTRAINT [PK_tblLicences] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLinkedEmployeeRights] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblLinkedEmployeeRights] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLocales] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(20) NOT NULL,
        [Value] nvarchar(20) NOT NULL,
        CONSTRAINT [PK_tblLocales] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLocations] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(150) NOT NULL,
        CONSTRAINT [PK_tblLocations] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblNotificationTypes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblNotificationTypes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblOrganisationFields] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblOrganisationFields] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblPermissionOptions] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblPermissionOptions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblPermissionTypes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblPermissionTypes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblRankingTypes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [ReverseOrder] bit NOT NULL,
        [RestrictedToJobTypeID] bit NOT NULL,
        [DateRange] bit NOT NULL,
        [Offset] bit NOT NULL,
        [Amount] bit NOT NULL,
        [BaseDate] bit NOT NULL,
        [BaseDateRange] bit NOT NULL,
        [DayOfWeek] bit NOT NULL,
        [CountOvernights] bit NOT NULL,
        [JobStartFrom] bit NOT NULL,
        [JobStartTo] bit NOT NULL,
        [JobEndFrom] bit NOT NULL,
        [JobEndTo] bit NOT NULL,
        [ComparisonMode] bit NOT NULL,
        [Operator] bit NOT NULL,
        [EmployeeField] bit NOT NULL,
        [ComparisonValue] bit NOT NULL,
        [CustomDataID] bit NOT NULL,
        CONSTRAINT [PK_tblRankingTypes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblReportGroups] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblReportGroups] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblReportPermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [Reports] bit NULL,
        [ScheduleReport] bit NULL,
        [ScheduleSummaryReport] bit NULL,
        [ScheduleEmployeeBreakdownReport] bit NULL,
        CONSTRAINT [PK_tblReportPermissions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblReportTypes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblReportTypes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSchedulePermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [AccessExistingSchedules] bit NULL,
        [CreateNewSchedules] bit NULL,
        [DeleteExistingSchedules] bit NULL,
        [ManageTemplates] bit NULL,
        [AssignAgency] bit NULL,
        [ScheduleConstraintConfiguration] bit NULL,
        [AssignFromUnavailable] bit NULL,
        [TemporaryConstraintDisabling] bit NULL,
        [ScheduleRankingConfiguration] bit NULL,
        [ScheduleApprovalAndSync] bit NULL,
        [ChangeApprovedSchedules] bit NULL,
        [ViewBudgets] bit NULL,
        [ViewSchedule] bit NULL,
        [TradeBoard] bit NULL,
        [JobOffers] bit NULL,
        [SetAvailability] bit NULL,
        [UseShifts] bit NULL,
        [LoneWorkerAlerts] bit NULL,
        [AttendanceConfirmation] bit NULL,
        [JobTypeMaintenance] bit NULL,
        CONSTRAINT [PK_tblSchedulePermissions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblScheduleRights] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblScheduleRights] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSchedules] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        CONSTRAINT [PK_tblSchedules] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSecurity] (
        [Id] bigint NOT NULL IDENTITY,
        [MinimumLength] int NOT NULL,
        [MinimumUpperCharacters] int NOT NULL,
        [MinimumSpecialCharacters] int NOT NULL,
        [MinimumNumericCharacters] int NOT NULL,
        [DaysBeforePasswordExpires] int NULL,
        [TimeoutMinutes] int NOT NULL,
        CONSTRAINT [PK_tblSecurity] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblShiftsGroup] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_tblShiftsGroup] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSkillCodes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblSkillCodes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSpecialDateTypes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblSpecialDateTypes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSuperAdmins] (
        [Id] bigint NOT NULL IDENTITY,
        [Username] nvarchar(max) NULL,
        [Email] nvarchar(max) NULL,
        [Password] nvarchar(max) NULL,
        [IsFirstLogin] bit NOT NULL,
        CONSTRAINT [PK_tblSuperAdmins] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSyncSettings] (
        [Id] bigint NOT NULL IDENTITY,
        [Message] nvarchar(50) NOT NULL,
        [DisplaySyncButton] bit NOT NULL,
        CONSTRAINT [PK_tblSyncSettings] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSyncStatuses] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(10) NOT NULL,
        CONSTRAINT [PK_tblSyncStatuses] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSystemPermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [TargetRules] bit NULL,
        [EmployeeRosters] bit NULL,
        [SkillsMatrix] bit NULL,
        [CreateSkillCodes] bit NULL,
        [WorkRules] bit NULL,
        [ScheduleFormulas] bit NULL,
        [GDPRDataDelete] bit NULL,
        [BudgetMaintenance] bit NULL,
        [UserManagement] bit NULL,
        [DataIntegrations] bit NULL,
        [SystemLicence] bit NULL,
        [SystemPreferences] bit NULL,
        [EmployeeDetails] bit NULL,
        [ChangePassword] bit NULL,
        CONSTRAINT [PK_tblSystemPermissions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTargetRuleConfigs] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [IsMinimumTargetHours] bit NOT NULL,
        [IsMinimumTargetPay] bit NOT NULL,
        [IsMinimumDaysOfWeek] bit NOT NULL,
        [IsMinimumJobTypes] bit NOT NULL,
        [IsMinimumJobTypesConsecutivly] bit NOT NULL,
        [IsMinimumJobTimes] bit NOT NULL,
        [IsEmployeeRoster] bit NOT NULL,
        CONSTRAINT [PK_tblTargetRuleConfigs] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTargetRuleGroups] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblTargetRuleGroups] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTeams] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblTeams] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateConstraintRules] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_tblTemplateConstraintRules] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplates] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Created] datetime2 NOT NULL,
        [LastModified] datetime2 NULL,
        [LastPublished] datetime2 NULL,
        [InUse] bit NOT NULL,
        [HideFrom] datetime2 NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        CONSTRAINT [PK_tblTemplates] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTimeUnits] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblTimeUnits] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUnlockedRanges] (
        [Id] bigint NOT NULL IDENTITY,
        [UserID] bigint NOT NULL,
        [StartPeriod] datetime2 NOT NULL,
        [EndPeriod] datetime2 NOT NULL,
        CONSTRAINT [PK_tblUnlockedRanges] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblWorkRules] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblWorkRules] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [CustomDataTypeID] bigint NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_tblCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblCustomDatas_tblCustomDataTypes_CustomDataTypeID] FOREIGN KEY ([CustomDataTypeID]) REFERENCES [tblCustomDataTypes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblScheduleDatePreferences] (
        [Id] bigint NOT NULL IDENTITY,
        [StartDayOfWeek] nvarchar(12) NOT NULL,
        [PayPeriodStartDate] datetime2 NULL,
        [PayPeriodNumberOfDays] int NULL,
        [IsMonthlyPayPeriod] bit NOT NULL,
        [ScheduleInitialDateRange] nvarchar(20) NOT NULL,
        [LocalesID] bigint NOT NULL,
        CONSTRAINT [PK_tblScheduleDatePreferences] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblScheduleDatePreferences_tblLocales_LocalesID] FOREIGN KEY ([LocalesID]) REFERENCES [tblLocales] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraints] (
        [Id] bigint NOT NULL IDENTITY,
        [ConstraintRuleID] bigint NOT NULL,
        [ScheduleID] bigint NOT NULL,
        [ConstraintName] nvarchar(50) NOT NULL,
        [IsConstraintActive] bit NOT NULL,
        CONSTRAINT [PK_tblConstraints] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraints_tblConstraintRules_ConstraintRuleID] FOREIGN KEY ([ConstraintRuleID]) REFERENCES [tblConstraintRules] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraints_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblScheduleMaxAndMinJobDate] (
        [Id] bigint NOT NULL IDENTITY,
        [ScheduleID] bigint NOT NULL,
        [MinJobDate] datetime2 NOT NULL,
        [MaxJobDate] datetime2 NOT NULL,
        CONSTRAINT [PK_tblScheduleMaxAndMinJobDate] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblScheduleMaxAndMinJobDate_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblShifts] (
        [Id] bigint NOT NULL IDENTITY,
        [Code] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        [StartTime] nvarchar(max) NULL,
        [EndTime] nvarchar(max) NULL,
        [NumberOfDays] int NOT NULL,
        [Hours] nvarchar(max) NULL,
        [Hours1] nvarchar(max) NULL,
        [Hours2] nvarchar(max) NULL,
        [Hours3] nvarchar(max) NULL,
        [Hours4] nvarchar(max) NULL,
        [Hours5] nvarchar(max) NULL,
        [Hours6] nvarchar(max) NULL,
        [ShiftsGroupId] bigint NULL,
        CONSTRAINT [PK_tblShifts] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblShifts_tblShiftsGroup_ShiftsGroupId] FOREIGN KEY ([ShiftsGroupId]) REFERENCES [tblShiftsGroup] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSpecialDates] (
        [Id] bigint NOT NULL IDENTITY,
        [Date] datetime2 NOT NULL,
        [SpecialDateTypeID] bigint NOT NULL,
        CONSTRAINT [PK_tblSpecialDates] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSpecialDates_tblSpecialDateTypes_SpecialDateTypeID] FOREIGN KEY ([SpecialDateTypeID]) REFERENCES [tblSpecialDateTypes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSync] (
        [Id] bigint NOT NULL IDENTITY,
        [SyncLastRun] datetime2 NOT NULL,
        [SyncSuccessful] nvarchar(10) NOT NULL,
        [ScheduleId] bigint NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [SyncStatusID] bigint NOT NULL,
        CONSTRAINT [PK_tblSync] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSync_tblSyncStatuses_SyncStatusID] FOREIGN KEY ([SyncStatusID]) REFERENCES [tblSyncStatuses] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblProfile] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [IsUserProfile] bit NOT NULL,
        [SchedulePermissionsID] bigint NOT NULL,
        [AbsencePermissionsID] bigint NULL,
        [SystemPermissionsID] bigint NOT NULL,
        [EmployeePermissionsID] bigint NULL,
        [ReportPermissionsID] bigint NULL,
        CONSTRAINT [PK_tblProfile] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblProfile_tblAbsencePermissions_AbsencePermissionsID] FOREIGN KEY ([AbsencePermissionsID]) REFERENCES [tblAbsencePermissions] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblProfile_tblEmployeePermissions_EmployeePermissionsID] FOREIGN KEY ([EmployeePermissionsID]) REFERENCES [tblEmployeePermissions] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblProfile_tblReportPermissions_ReportPermissionsID] FOREIGN KEY ([ReportPermissionsID]) REFERENCES [tblReportPermissions] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblProfile_tblSchedulePermissions_SchedulePermissionsID] FOREIGN KEY ([SchedulePermissionsID]) REFERENCES [tblSchedulePermissions] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblProfile_tblSystemPermissions_SystemPermissionsID] FOREIGN KEY ([SystemPermissionsID]) REFERENCES [tblSystemPermissions] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateSchedules] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [TemplateID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateSchedules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateSchedules_tblTemplates_TemplateID] FOREIGN KEY ([TemplateID]) REFERENCES [tblTemplates] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobTypes] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [TimeUnitValue] int NULL,
        [AllowedTrade] bit NOT NULL,
        [IsLengthOfServiceNonEssential] bit NOT NULL,
        [LoneWorkerJob] bit NOT NULL,
        [LoneWorkerRecurringIntervals] bigint NULL,
        [LoneWorkerResponseWindow] bigint NULL,
        [AttendanceConfirmation] bit NOT NULL,
        [AttendanceTimeBeforeStart] bigint NULL,
        [AttendanceResponseWindow] bigint NULL,
        [TimeUnitID] bigint NULL,
        CONSTRAINT [PK_tblJobTypes] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobTypes_tblTimeUnits_TimeUnitID] FOREIGN KEY ([TimeUnitID]) REFERENCES [tblTimeUnits] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblCustomDataLookups] (
        [Id] bigint NOT NULL IDENTITY,
        [CustomDataID] bigint NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_tblCustomDataLookups] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblCustomDataLookups_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintBaseDateRanges] (
        [Id] bigint NOT NULL IDENTITY,
        [ConstraintID] bigint NOT NULL,
        [BaseDate] datetime2 NOT NULL,
        [BaseDateRange] int NOT NULL,
        CONSTRAINT [PK_tblConstraintBaseDateRanges] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintBaseDateRanges_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NOT NULL,
        [Operator] nvarchar(max) NULL,
        [EmployeeField] nvarchar(max) NULL,
        CONSTRAINT [PK_tblConstraintCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintCustomDatas_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintCustomDatas_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintCustomRanges] (
        [Id] bigint NOT NULL IDENTITY,
        [ConstraintID] bigint NOT NULL,
        [Offset] int NOT NULL,
        [Amount] int NOT NULL,
        CONSTRAINT [PK_tblConstraintCustomRanges] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintCustomRanges_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintSetValues] (
        [Id] bigint NOT NULL IDENTITY,
        [ConstraintID] bigint NOT NULL,
        [Operator] nvarchar(max) NULL,
        [EmployeeField] nvarchar(max) NULL,
        [ComparisonValue] nvarchar(max) NULL,
        CONSTRAINT [PK_tblConstraintSetValues] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintSetValues_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblScheduleSyncRequestResults] (
        [Id] bigint NOT NULL IDENTITY,
        [Status] nvarchar(max) NULL,
        [SyncID] bigint NOT NULL,
        CONSTRAINT [PK_tblScheduleSyncRequestResults] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblScheduleSyncRequestResults_tblSync_SyncID] FOREIGN KEY ([SyncID]) REFERENCES [tblSync] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblPanelPermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [PermissionTypeID] bigint NOT NULL,
        [PermissionOptionID] bigint NOT NULL,
        [ProfileID] bigint NOT NULL,
        CONSTRAINT [PK_tblPanelPermissions] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblPanelPermissions_tblPermissionOptions_PermissionOptionID] FOREIGN KEY ([PermissionOptionID]) REFERENCES [tblPermissionOptions] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblPanelPermissions_tblPermissionTypes_PermissionTypeID] FOREIGN KEY ([PermissionTypeID]) REFERENCES [tblPermissionTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblPanelPermissions_tblProfile_ProfileID] FOREIGN KEY ([ProfileID]) REFERENCES [tblProfile] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateConstraints] (
        [Id] bigint NOT NULL IDENTITY,
        [TemplateConstraintName] nvarchar(50) NOT NULL,
        [IsTemplateConstraintActive] bit NOT NULL,
        [TemplateConstraintRuleID] bigint NOT NULL,
        [TemplateScheduleID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateConstraints] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateConstraints_tblTemplateConstraintRules_TemplateConstraintRuleID] FOREIGN KEY ([TemplateConstraintRuleID]) REFERENCES [tblTemplateConstraintRules] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblTemplateConstraints_tblTemplateSchedules_TemplateScheduleID] FOREIGN KEY ([TemplateScheduleID]) REFERENCES [tblTemplateSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateScheduleMaxAndMinJobDate] (
        [Id] bigint NOT NULL IDENTITY,
        [MinJobDate] datetime2 NOT NULL,
        [MaxJobDate] datetime2 NOT NULL,
        [TemplateScheduleID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateScheduleMaxAndMinJobDate] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateScheduleMaxAndMinJobDate_tblTemplateSchedules_TemplateScheduleID] FOREIGN KEY ([TemplateScheduleID]) REFERENCES [tblTemplateSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobTypeEssentialComparisonRules] (
        [Id] bigint NOT NULL IDENTITY,
        [ComparisonMode] nvarchar(max) NULL,
        [Operator] nvarchar(max) NULL,
        [EmployeeField] nvarchar(max) NULL,
        [TextValue] nvarchar(max) NULL,
        [NumberValue] float NULL,
        [JobTypeID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        CONSTRAINT [PK_tblJobTypeEssentialComparisonRules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobTypeEssentialComparisonRules_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblJobTypeEssentialComparisonRules_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobTypeEssentialSkills] (
        [SkillCodeID] bigint NOT NULL,
        [JobTypeID] bigint NOT NULL,
        [SkillGroup] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_tblJobTypeEssentialSkills] PRIMARY KEY ([JobTypeID], [SkillCodeID], [SkillGroup]),
        CONSTRAINT [FK_tblJobTypeEssentialSkills_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobTypeEssentialSkills_tblSkillCodes_SkillCodeID] FOREIGN KEY ([SkillCodeID]) REFERENCES [tblSkillCodes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobTypeNonEssentialComparisonRules] (
        [Id] bigint NOT NULL IDENTITY,
        [ComparisonMode] nvarchar(max) NULL,
        [Operator] nvarchar(max) NULL,
        [EmployeeField] nvarchar(max) NULL,
        [TextValue] nvarchar(max) NULL,
        [NumberValue] float NULL,
        [JobTypeID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        CONSTRAINT [PK_tblJobTypeNonEssentialComparisonRules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobTypeNonEssentialComparisonRules_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblJobTypeNonEssentialComparisonRules_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobTypeNonEssentialSkills] (
        [SkillCodeID] bigint NOT NULL,
        [JobTypeID] bigint NOT NULL,
        [SkillGroup] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_tblJobTypeNonEssentialSkills] PRIMARY KEY ([JobTypeID], [SkillCodeID], [SkillGroup]),
        CONSTRAINT [FK_tblJobTypeNonEssentialSkills_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobTypeNonEssentialSkills_tblSkillCodes_SkillCodeID] FOREIGN KEY ([SkillCodeID]) REFERENCES [tblSkillCodes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblRankingRules] (
        [Id] bigint NOT NULL IDENTITY,
        [ReverseOrder] bit NOT NULL,
        [DateRange] nvarchar(max) NULL,
        [Offset] float NULL,
        [Amount] float NULL,
        [BaseDate] datetime2 NULL,
        [BaseDateRange] int NULL,
        [DayOfWeek] nvarchar(max) NULL,
        [CountOvernights] bit NOT NULL,
        [JobStartFrom] time NULL,
        [JobStartTo] time NULL,
        [JobEndFrom] time NULL,
        [JobEndTo] time NULL,
        [ComparisonMode] nvarchar(max) NULL,
        [ComparisonValue] nvarchar(max) NULL,
        [Operator] nvarchar(max) NULL,
        [EmployeeField] nvarchar(max) NULL,
        [RestrictedToJobTypeID] bigint NULL,
        [CustomDataID] bigint NULL,
        CONSTRAINT [PK_tblRankingRules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblRankingRules_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblRankingRules_tblJobTypes_RestrictedToJobTypeID] FOREIGN KEY ([RestrictedToJobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTargetRules] (
        [Id] bigint NOT NULL IDENTITY,
        [MinimumTargetHours] time NULL,
        [PeriodType] nvarchar(max) NULL,
        [PeriodInDays] int NOT NULL,
        [MinimumTargetPay] float NULL,
        [DayOfWeek] nvarchar(max) NULL,
        [Amount] float NULL,
        [CountOvernights] bit NULL,
        [JobStartFrom] time NULL,
        [JobStartTo] time NULL,
        [JobEndFrom] time NULL,
        [JobEndTo] time NULL,
        [TargetRuleConfigID] bigint NULL,
        [RestrictedJobTypeID] bigint NULL,
        CONSTRAINT [PK_tblTargetRules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTargetRules_tblJobTypes_RestrictedJobTypeID] FOREIGN KEY ([RestrictedJobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTargetRules_tblTargetRuleConfigs_TargetRuleConfigID] FOREIGN KEY ([TargetRuleConfigID]) REFERENCES [tblTargetRuleConfigs] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblScheduleCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [ScheduleID] bigint NOT NULL,
        [CustomDataID] bigint NOT NULL,
        [CustomDataLookupID] bigint NULL,
        [Number] float NULL,
        [Text] nvarchar(max) NULL,
        CONSTRAINT [PK_tblScheduleCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblScheduleCustomDatas_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblScheduleCustomDatas_tblCustomDataLookups_CustomDataLookupID] FOREIGN KEY ([CustomDataLookupID]) REFERENCES [tblCustomDataLookups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblScheduleCustomDatas_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateScheduleCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [NumberValue] float NULL,
        [TextValue] nvarchar(max) NULL,
        [ManuallyUpdated] bit NOT NULL,
        [TemplateScheduleID] bigint NOT NULL,
        [CustomDataID] bigint NOT NULL,
        [CustomDataLookupID] bigint NULL,
        CONSTRAINT [PK_tblTemplateScheduleCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateScheduleCustomDatas_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblTemplateScheduleCustomDatas_tblCustomDataLookups_CustomDataLookupID] FOREIGN KEY ([CustomDataLookupID]) REFERENCES [tblCustomDataLookups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateScheduleCustomDatas_tblTemplateSchedules_TemplateScheduleID] FOREIGN KEY ([TemplateScheduleID]) REFERENCES [tblTemplateSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintDOWPs] (
        [Id] bigint NOT NULL IDENTITY,
        [IsPayPeriod] bit NOT NULL,
        [IsMonth] bit NOT NULL,
        [IsWeek] bit NOT NULL,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        [ConstraintSetValueID] bigint NULL,
        [ConstraintCustomDataID] bigint NULL,
        [ConstraintCustomRangeID] bigint NULL,
        [ConstraintBaseDateRangeID] bigint NULL,
        [StartDay] nvarchar(10) NULL,
        [NumberOfRestDays] int NOT NULL,
        [MustBeConsecutive] bit NOT NULL,
        CONSTRAINT [PK_tblConstraintDOWPs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintDOWPs_tblConstraintBaseDateRanges_ConstraintBaseDateRangeID] FOREIGN KEY ([ConstraintBaseDateRangeID]) REFERENCES [tblConstraintBaseDateRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintDOWPs_tblConstraintCustomDatas_ConstraintCustomDataID] FOREIGN KEY ([ConstraintCustomDataID]) REFERENCES [tblConstraintCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintDOWPs_tblConstraintCustomRanges_ConstraintCustomRangeID] FOREIGN KEY ([ConstraintCustomRangeID]) REFERENCES [tblConstraintCustomRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintDOWPs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintDOWPs_tblConstraintSetValues_ConstraintSetValueID] FOREIGN KEY ([ConstraintSetValueID]) REFERENCES [tblConstraintSetValues] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintDOWPs_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintMNODOTWs] (
        [Id] bigint NOT NULL IDENTITY,
        [IsPayPeriod] bit NOT NULL,
        [IsMonth] bit NOT NULL,
        [IsWeek] bit NOT NULL,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        [ConstraintSetValueID] bigint NULL,
        [ConstraintCustomDataID] bigint NULL,
        [ConstraintCustomRangeID] bigint NULL,
        [ConstraintBaseDateRangeID] bigint NULL,
        [DayOfWeek] nvarchar(max) NULL,
        [MaxCount] int NOT NULL,
        [CountOvernights] bit NOT NULL,
        CONSTRAINT [PK_tblConstraintMNODOTWs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintMNODOTWs_tblConstraintBaseDateRanges_ConstraintBaseDateRangeID] FOREIGN KEY ([ConstraintBaseDateRangeID]) REFERENCES [tblConstraintBaseDateRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNODOTWs_tblConstraintCustomDatas_ConstraintCustomDataID] FOREIGN KEY ([ConstraintCustomDataID]) REFERENCES [tblConstraintCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNODOTWs_tblConstraintCustomRanges_ConstraintCustomRangeID] FOREIGN KEY ([ConstraintCustomRangeID]) REFERENCES [tblConstraintCustomRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNODOTWs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintMNODOTWs_tblConstraintSetValues_ConstraintSetValueID] FOREIGN KEY ([ConstraintSetValueID]) REFERENCES [tblConstraintSetValues] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNODOTWs_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintMNOHs] (
        [Id] bigint NOT NULL IDENTITY,
        [IsPayPeriod] bit NOT NULL,
        [IsMonth] bit NOT NULL,
        [IsWeek] bit NOT NULL,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        [ConstraintSetValueID] bigint NULL,
        [ConstraintCustomDataID] bigint NULL,
        [ConstraintCustomRangeID] bigint NULL,
        [ConstraintBaseDateRangeID] bigint NULL,
        [SetValue] float NULL,
        [MaxHoursField] nvarchar(max) NULL,
        CONSTRAINT [PK_tblConstraintMNOHs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintMNOHs_tblConstraintBaseDateRanges_ConstraintBaseDateRangeID] FOREIGN KEY ([ConstraintBaseDateRangeID]) REFERENCES [tblConstraintBaseDateRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOHs_tblConstraintCustomDatas_ConstraintCustomDataID] FOREIGN KEY ([ConstraintCustomDataID]) REFERENCES [tblConstraintCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOHs_tblConstraintCustomRanges_ConstraintCustomRangeID] FOREIGN KEY ([ConstraintCustomRangeID]) REFERENCES [tblConstraintCustomRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOHs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintMNOHs_tblConstraintSetValues_ConstraintSetValueID] FOREIGN KEY ([ConstraintSetValueID]) REFERENCES [tblConstraintSetValues] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOHs_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintMNOJTCs] (
        [Id] bigint NOT NULL IDENTITY,
        [MaximalCount] int NOT NULL,
        [RestDays] int NOT NULL,
        [IncludeAllJobTypes] bit NOT NULL,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        [ConstraintSetValueID] bigint NULL,
        [ConstraintCustomDataID] bigint NULL,
        [JobTypeID] bigint NOT NULL,
        CONSTRAINT [PK_tblConstraintMNOJTCs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintMNOJTCs_tblConstraintCustomDatas_ConstraintCustomDataID] FOREIGN KEY ([ConstraintCustomDataID]) REFERENCES [tblConstraintCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTCs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintMNOJTCs_tblConstraintSetValues_ConstraintSetValueID] FOREIGN KEY ([ConstraintSetValueID]) REFERENCES [tblConstraintSetValues] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTCs_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTCs_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintMNOJTs] (
        [Id] bigint NOT NULL IDENTITY,
        [IsPayPeriod] bit NOT NULL,
        [IsMonth] bit NOT NULL,
        [IsWeek] bit NOT NULL,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        [ConstraintSetValueID] bigint NULL,
        [ConstraintCustomDataID] bigint NULL,
        [ConstraintCustomRangeID] bigint NULL,
        [ConstraintBaseDateRangeID] bigint NULL,
        [MaxCount] int NOT NULL,
        [JobTypeID] bigint NOT NULL,
        CONSTRAINT [PK_tblConstraintMNOJTs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintMNOJTs_tblConstraintBaseDateRanges_ConstraintBaseDateRangeID] FOREIGN KEY ([ConstraintBaseDateRangeID]) REFERENCES [tblConstraintBaseDateRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTs_tblConstraintCustomDatas_ConstraintCustomDataID] FOREIGN KEY ([ConstraintCustomDataID]) REFERENCES [tblConstraintCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTs_tblConstraintCustomRanges_ConstraintCustomRangeID] FOREIGN KEY ([ConstraintCustomRangeID]) REFERENCES [tblConstraintCustomRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintMNOJTs_tblConstraintSetValues_ConstraintSetValueID] FOREIGN KEY ([ConstraintSetValueID]) REFERENCES [tblConstraintSetValues] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTs_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTs_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintSSs] (
        [Id] bigint NOT NULL IDENTITY,
        [MinimumRestPeriod] float NOT NULL,
        [MaximumGap] float NOT NULL,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        [ConstraintSetValueID] bigint NULL,
        [ConstraintCustomDataID] bigint NULL,
        CONSTRAINT [PK_tblConstraintSSs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintSSs_tblConstraintCustomDatas_ConstraintCustomDataID] FOREIGN KEY ([ConstraintCustomDataID]) REFERENCES [tblConstraintCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintSSs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintSSs_tblConstraintSetValues_ConstraintSetValueID] FOREIGN KEY ([ConstraintSetValueID]) REFERENCES [tblConstraintSetValues] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintSSs_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblScheduleAssigmentsResults] (
        [Id] bigint NOT NULL IDENTITY,
        [Status] nvarchar(max) NULL,
        [Message] nvarchar(max) NULL,
        [ScheduleName] nvarchar(max) NULL,
        [EmployeeName] nvarchar(max) NULL,
        [JobStartDateTime] datetime2 NULL,
        [JobEndDateTime] datetime2 NULL,
        [EmployeeNumber] nvarchar(max) NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        [ScheduleSyncRequestResultID] bigint NOT NULL,
        CONSTRAINT [PK_tblScheduleAssigmentsResults] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblScheduleAssigmentsResults_tblScheduleSyncRequestResults_ScheduleSyncRequestResultID] FOREIGN KEY ([ScheduleSyncRequestResultID]) REFERENCES [tblScheduleSyncRequestResults] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateConstraintSetValues] (
        [Id] bigint NOT NULL IDENTITY,
        [Operator] nvarchar(max) NULL,
        [EmployeeField] nvarchar(max) NULL,
        [ComparisonValue] nvarchar(max) NULL,
        [TemplateConstraintID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateConstraintSetValues] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateConstraintSetValues_tblTemplateConstraints_TemplateConstraintID] FOREIGN KEY ([TemplateConstraintID]) REFERENCES [tblTemplateConstraints] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAbsenceRequests] (
        [Id] bigint NOT NULL IDENTITY,
        [EmployeeAbsenceID] bigint NULL,
        [AbsenceStatusID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [UserID] bigint NULL,
        [AbsenceCodeID] bigint NOT NULL,
        [Action] int NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [NumberOfHours] bigint NOT NULL,
        [ManuallyEdited] bit NOT NULL,
        [EmployeeComment] nvarchar(1000) NULL,
        [ManagerComment] nvarchar(1000) NULL,
        [DeletePending] bit NOT NULL,
        CONSTRAINT [PK_tblAbsenceRequests] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblAbsenceRequests_tblAbsenceCodes_AbsenceCodeID] FOREIGN KEY ([AbsenceCodeID]) REFERENCES [tblAbsenceCodes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblAbsenceRequests_tblAbsenceStatuses_AbsenceStatusID] FOREIGN KEY ([AbsenceStatusID]) REFERENCES [tblAbsenceStatuses] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeeAbsences] (
        [Id] bigint NOT NULL IDENTITY,
        [AbsenceCodeID] bigint NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [NumberOfHours] bigint NOT NULL,
        [ManuallyEdited] bit NOT NULL,
        [EmployeeComment] nvarchar(1000) NULL,
        [ManagerComment] nvarchar(1000) NULL,
        [EmployeeID] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeeAbsences] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeeAbsences_tblAbsenceCodes_AbsenceCodeID] FOREIGN KEY ([AbsenceCodeID]) REFERENCES [tblAbsenceCodes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUserAbsences] (
        [Id] bigint NOT NULL IDENTITY,
        [AbsenceCodeID] bigint NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [NumberOfHours] bigint NOT NULL,
        [ManuallyEdited] bit NOT NULL,
        [EmployeeComment] nvarchar(1000) NULL,
        [ManagerComment] nvarchar(1000) NULL,
        [UserID] bigint NOT NULL,
        CONSTRAINT [PK_tblUserAbsences] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUserAbsences_tblAbsenceCodes_AbsenceCodeID] FOREIGN KEY ([AbsenceCodeID]) REFERENCES [tblAbsenceCodes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeeNotifications] (
        [Id] bigint NOT NULL IDENTITY,
        [Title] nvarchar(50) NOT NULL,
        [Content] nvarchar(1000) NOT NULL,
        [Link] nvarchar(500) NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [AbsenceRequestID] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeeNotifications] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeeNotifications_tblAbsenceRequests_AbsenceRequestID] FOREIGN KEY ([AbsenceRequestID]) REFERENCES [tblAbsenceRequests] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLinkInfo] (
        [Id] bigint NOT NULL IDENTITY,
        [StartDateTime] datetime2 NOT NULL,
        [EndDateTime] datetime2 NOT NULL,
        [LoneWorkerAction] bit NOT NULL,
        [AttendanceConfirmationAction] bit NOT NULL,
        [CurrentView] nvarchar(max) NULL,
        [SubGroupId] bigint NULL,
        [ScheduleId] bigint NULL,
        [UserId] bigint NULL,
        [EmployeeId] bigint NULL,
        [AbsenceRequestID] bigint NULL,
        [JobID] bigint NULL,
        CONSTRAINT [PK_tblLinkInfo] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblLinkInfo_tblAbsenceRequests_AbsenceRequestID] FOREIGN KEY ([AbsenceRequestID]) REFERENCES [tblAbsenceRequests] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblLinkInfo_tblSchedules_ScheduleId] FOREIGN KEY ([ScheduleId]) REFERENCES [tblSchedules] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUserNotifications] (
        [Id] bigint NOT NULL IDENTITY,
        [Title] nvarchar(50) NOT NULL,
        [Content] nvarchar(1000) NOT NULL,
        [Link] nvarchar(500) NOT NULL,
        [UserID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [AbsenceRequestID] bigint NULL,
        CONSTRAINT [PK_tblUserNotifications] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUserNotifications_tblAbsenceRequests_AbsenceRequestID] FOREIGN KEY ([AbsenceRequestID]) REFERENCES [tblAbsenceRequests] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAgencyJobAssignments] (
        [Id] bigint NOT NULL IDENTITY,
        [AgencyID] bigint NOT NULL,
        [AgencyReasonForCoverID] bigint NOT NULL,
        [AgencyWorker] nvarchar(100) NOT NULL,
        [JobID] bigint NOT NULL,
        CONSTRAINT [PK_tblAgencyJobAssignments] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblAgencyJobAssignments_tblAgencies_AgencyID] FOREIGN KEY ([AgencyID]) REFERENCES [tblAgencies] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblAgencyJobAssignments_tblAgencyReasonsToCover_AgencyReasonForCoverID] FOREIGN KEY ([AgencyReasonForCoverID]) REFERENCES [tblAgencyReasonsToCover] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAgencyTemplateJobAssignments] (
        [Id] bigint NOT NULL IDENTITY,
        [AgencyID] bigint NOT NULL,
        [AgencyReasonForCoverID] bigint NOT NULL,
        [AgencyWorker] nvarchar(100) NOT NULL,
        [TemplateJobID] bigint NOT NULL,
        CONSTRAINT [PK_tblAgencyTemplateJobAssignments] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblAgencyTemplateJobAssignments_tblAgencies_AgencyID] FOREIGN KEY ([AgencyID]) REFERENCES [tblAgencies] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblAgencyTemplateJobAssignments_tblAgencyReasonsToCover_AgencyReasonForCoverID] FOREIGN KEY ([AgencyReasonForCoverID]) REFERENCES [tblAgencyReasonsToCover] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployees] (
        [Id] bigint NOT NULL IDENTITY,
        [Firstname] nvarchar(50) NOT NULL,
        [Surname] nvarchar(50) NOT NULL,
        [Username] nvarchar(50) NOT NULL,
        [Password] nvarchar(256) NULL,
        [Email] nvarchar(50) NOT NULL,
        [TelephoneNumber] nvarchar(max) NULL,
        [MobileNumber] nvarchar(max) NULL,
        [IsTemporaryPassword] bit NULL,
        [DatePasswordModified] datetime2 NULL,
        [IsAccessEmailSent] bit NULL,
        [OldPassword] nvarchar(256) NULL,
        [Role] nvarchar(max) NULL,
        [ConnectionId] nvarchar(max) NULL,
        [IsLoggedOut] bit NOT NULL,
        [ProfileID] bigint NULL,
        [EmployeeNumber] nvarchar(50) NULL,
        [GenderID] bigint NULL,
        [LocationID] bigint NULL,
        [DepartmentID] bigint NULL,
        [CostCodeID] bigint NULL,
        [DivisionID] bigint NULL,
        [JobTitleID] bigint NULL,
        [TeamID] bigint NULL,
        [ClassID] bigint NULL,
        [JobTypeID] bigint NULL,
        [TargetRuleGroupID] bigint NULL,
        [WorkRulesID] bigint NULL,
        [NotificationTypeID] bigint NOT NULL,
        [ManagerID] bigint NULL,
        [StartDate] datetime2 NOT NULL,
        [LeaveDate] datetime2 NULL,
        [Address2] nvarchar(150) NULL,
        [Address1] nvarchar(150) NULL,
        [Address3] nvarchar(150) NULL,
        [Address4] nvarchar(150) NULL,
        [DateOfBirth] datetime2 NULL,
        [PayRate] int NULL,
        [MaxHours1] int NULL,
        [MaxHours2] int NULL,
        [MaxHours3] int NULL,
        [MaxHours4] int NULL,
        [MaxHours5] int NULL,
        [AllowedTrade] bit NOT NULL,
        [Availability] bit NOT NULL,
        CONSTRAINT [PK_tblEmployees] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployees_tblClasses_ClassID] FOREIGN KEY ([ClassID]) REFERENCES [tblClasses] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblCostCodes_CostCodeID] FOREIGN KEY ([CostCodeID]) REFERENCES [tblCostCodes] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblDepartments_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [tblDepartments] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblDivsions_DivisionID] FOREIGN KEY ([DivisionID]) REFERENCES [tblDivsions] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblGenders_GenderID] FOREIGN KEY ([GenderID]) REFERENCES [tblGenders] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblJobTitles_JobTitleID] FOREIGN KEY ([JobTitleID]) REFERENCES [tblJobTitles] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblLocations_LocationID] FOREIGN KEY ([LocationID]) REFERENCES [tblLocations] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblNotificationTypes_NotificationTypeID] FOREIGN KEY ([NotificationTypeID]) REFERENCES [tblNotificationTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblEmployees_tblProfile_ProfileID] FOREIGN KEY ([ProfileID]) REFERENCES [tblProfile] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblTargetRuleGroups_TargetRuleGroupID] FOREIGN KEY ([TargetRuleGroupID]) REFERENCES [tblTargetRuleGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblTeams_TeamID] FOREIGN KEY ([TeamID]) REFERENCES [tblTeams] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblEmployees_tblWorkRules_WorkRulesID] FOREIGN KEY ([WorkRulesID]) REFERENCES [tblWorkRules] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintEMNWWAEs] (
        [Id] bigint NOT NULL IDENTITY,
        [ConstraintID] bigint NOT NULL,
        [EmployeeAID] bigint NOT NULL,
        [EmployeeBID] bigint NOT NULL,
        [ReferenceArea] nvarchar(max) NULL,
        CONSTRAINT [PK_tblConstraintEMNWWAEs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintEMNWWAEs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintEMNWWAEs_tblEmployees_EmployeeAID] FOREIGN KEY ([EmployeeAID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintEMNWWAEs_tblEmployees_EmployeeBID] FOREIGN KEY ([EmployeeBID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblConstraintEMWWAEs] (
        [Id] bigint NOT NULL IDENTITY,
        [ConstraintID] bigint NOT NULL,
        [EmployeeAID] bigint NOT NULL,
        [EmployeeBID] bigint NOT NULL,
        [ReferenceArea] nvarchar(max) NULL,
        CONSTRAINT [PK_tblConstraintEMWWAEs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintEMWWAEs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintEMWWAEs_tblEmployees_EmployeeAID] FOREIGN KEY ([EmployeeAID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintEMWWAEs_tblEmployees_EmployeeBID] FOREIGN KEY ([EmployeeBID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblRankings] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Active] bit NOT NULL,
        [RankingOrder] int NOT NULL,
        [RankingRuleID] bigint NULL,
        [RankingTypeID] bigint NOT NULL,
        [ScheduleID] bigint NOT NULL,
        [EmployeeID] bigint NULL,
        CONSTRAINT [PK_tblRankings] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblRankings_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblRankings_tblRankingRules_RankingRuleID] FOREIGN KEY ([RankingRuleID]) REFERENCES [tblRankingRules] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblRankings_tblRankingTypes_RankingTypeID] FOREIGN KEY ([RankingTypeID]) REFERENCES [tblRankingTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblRankings_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSkillMatrices] (
        [Id] bigint NOT NULL IDENTITY,
        [Value] bit NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [SkillCodeID] bigint NOT NULL,
        CONSTRAINT [PK_tblSkillMatrices] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSkillMatrices_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblSkillMatrices_tblSkillCodes_SkillCodeID] FOREIGN KEY ([SkillCodeID]) REFERENCES [tblSkillCodes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateConstraintEMNWWAEs] (
        [Id] bigint NOT NULL IDENTITY,
        [ReferenceArea] nvarchar(max) NULL,
        [TemplateConstraintID] bigint NOT NULL,
        [EmployeeAID] bigint NOT NULL,
        [EmployeeBID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateConstraintEMNWWAEs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateConstraintEMNWWAEs_tblEmployees_EmployeeAID] FOREIGN KEY ([EmployeeAID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateConstraintEMNWWAEs_tblEmployees_EmployeeBID] FOREIGN KEY ([EmployeeBID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateConstraintEMNWWAEs_tblTemplateConstraints_TemplateConstraintID] FOREIGN KEY ([TemplateConstraintID]) REFERENCES [tblTemplateConstraints] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateConstraintEMWWAEs] (
        [Id] bigint NOT NULL IDENTITY,
        [ReferenceArea] nvarchar(max) NULL,
        [TemplateConstraintID] bigint NOT NULL,
        [EmployeeAID] bigint NOT NULL,
        [EmployeeBID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateConstraintEMWWAEs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateConstraintEMWWAEs_tblEmployees_EmployeeAID] FOREIGN KEY ([EmployeeAID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateConstraintEMWWAEs_tblEmployees_EmployeeBID] FOREIGN KEY ([EmployeeBID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateConstraintEMWWAEs_tblTemplateConstraints_TemplateConstraintID] FOREIGN KEY ([TemplateConstraintID]) REFERENCES [tblTemplateConstraints] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUsers] (
        [Id] bigint NOT NULL IDENTITY,
        [Firstname] nvarchar(50) NOT NULL,
        [Surname] nvarchar(50) NOT NULL,
        [Username] nvarchar(50) NOT NULL,
        [Password] nvarchar(256) NULL,
        [Email] nvarchar(50) NOT NULL,
        [TelephoneNumber] nvarchar(max) NULL,
        [MobileNumber] nvarchar(max) NULL,
        [IsTemporaryPassword] bit NULL,
        [DatePasswordModified] datetime2 NULL,
        [IsAccessEmailSent] bit NULL,
        [OldPassword] nvarchar(256) NULL,
        [Role] nvarchar(max) NULL,
        [ConnectionId] nvarchar(max) NULL,
        [IsLoggedOut] bit NOT NULL,
        [ProfileID] bigint NULL,
        [ApiKey1] nvarchar(max) NULL,
        [ApiKey2] nvarchar(max) NULL,
        [AccessAllEmployees] bit NOT NULL,
        [LinkedEmployeeID] bigint NULL,
        [LinkedEmployeeRightID] bigint NULL,
        CONSTRAINT [PK_tblUsers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUsers_tblEmployees_LinkedEmployeeID] FOREIGN KEY ([LinkedEmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUsers_tblLinkedEmployeeRights_LinkedEmployeeRightID] FOREIGN KEY ([LinkedEmployeeRightID]) REFERENCES [tblLinkedEmployeeRights] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUsers_tblProfile_ProfileID] FOREIGN KEY ([ProfileID]) REFERENCES [tblProfile] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblPushNotification] (
        [Id] bigint NOT NULL IDENTITY,
        [NotificationTitle] nvarchar(max) NULL,
        [NotificationContent] nvarchar(max) NULL,
        [ActionRequired] bit NOT NULL,
        [IsReaded] bit NOT NULL,
        [DateCreated] datetime2 NOT NULL,
        [LoneWorkerCheckedIn] bit NULL,
        [AttendanceResponded] bit NULL,
        [LinkTo] nvarchar(max) NULL,
        [Color] nvarchar(max) NULL,
        [UserId] bigint NULL,
        [EmployeeId] bigint NULL,
        [LinkInfoId] bigint NULL,
        CONSTRAINT [PK_tblPushNotification] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblPushNotification_tblEmployees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblPushNotification_tblLinkInfo_LinkInfoId] FOREIGN KEY ([LinkInfoId]) REFERENCES [tblLinkInfo] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblPushNotification_tblUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSchedulePreferences] (
        [Id] bigint NOT NULL IDENTITY,
        [MaxNumberOfSubGroups] int NULL,
        [TradeDeadlineValue] float NOT NULL,
        [AutoAssignmentsForJobOffers] bit NOT NULL,
        [AcceptedAutoAssignmentsDeadlineForJobOffers] decimal(18,2) NULL,
        [LoneWorkerAdmin1ID] bigint NULL,
        [LoneWorkerAdmin2ID] bigint NULL,
        CONSTRAINT [PK_tblSchedulePreferences] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSchedulePreferences_tblUsers_LoneWorkerAdmin1ID] FOREIGN KEY ([LoneWorkerAdmin1ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSchedulePreferences_tblUsers_LoneWorkerAdmin2ID] FOREIGN KEY ([LoneWorkerAdmin2ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateSubGroups] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [SortOrder] int NULL,
        [HideFrom] datetime2 NOT NULL,
        [ScheduleID] bigint NOT NULL,
        [ParentGroupID] bigint NULL,
        [LoneWorkerManager1ID] bigint NULL,
        [LoneWorkerManager2ID] bigint NULL,
        [AttendanceManager1ID] bigint NULL,
        [AttendanceManager2ID] bigint NULL,
        CONSTRAINT [PK_tblTemplateSubGroups] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateSubGroups_tblUsers_AttendanceManager1ID] FOREIGN KEY ([AttendanceManager1ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateSubGroups_tblUsers_AttendanceManager2ID] FOREIGN KEY ([AttendanceManager2ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateSubGroups_tblUsers_LoneWorkerManager1ID] FOREIGN KEY ([LoneWorkerManager1ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateSubGroups_tblUsers_LoneWorkerManager2ID] FOREIGN KEY ([LoneWorkerManager2ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateSubGroups_tblTemplateSubGroups_ParentGroupID] FOREIGN KEY ([ParentGroupID]) REFERENCES [tblTemplateSubGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateSubGroups_tblTemplateSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblTemplateSchedules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUserEmployeePermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [UserID] bigint NOT NULL,
        [OrganisationFieldID] bigint NOT NULL,
        [LocationID] bigint NULL,
        [DepartmentID] bigint NULL,
        [CostCodeID] bigint NULL,
        [DivisionID] bigint NULL,
        [JobTitleID] bigint NULL,
        [ClassID] bigint NULL,
        [TeamID] bigint NULL,
        CONSTRAINT [PK_tblUserEmployeePermissions] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUserEmployeePermissions_tblClasses_ClassID] FOREIGN KEY ([ClassID]) REFERENCES [tblClasses] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblCostCodes_CostCodeID] FOREIGN KEY ([CostCodeID]) REFERENCES [tblCostCodes] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblDepartments_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [tblDepartments] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblDivsions_DivisionID] FOREIGN KEY ([DivisionID]) REFERENCES [tblDivsions] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblJobTitles_JobTitleID] FOREIGN KEY ([JobTitleID]) REFERENCES [tblJobTitles] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblLocations_LocationID] FOREIGN KEY ([LocationID]) REFERENCES [tblLocations] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblOrganisationFields_OrganisationFieldID] FOREIGN KEY ([OrganisationFieldID]) REFERENCES [tblOrganisationFields] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblTeams_TeamID] FOREIGN KEY ([TeamID]) REFERENCES [tblTeams] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserEmployeePermissions_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUserImages] (
        [Id] bigint NOT NULL IDENTITY,
        [Image] varbinary(max) NOT NULL,
        [ImageSizeID] bigint NOT NULL,
        [EmployeeID] bigint NULL,
        [UserID] bigint NULL,
        CONSTRAINT [PK_tblUserImages] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUserImages_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserImages_tblImageSizes_ImageSizeID] FOREIGN KEY ([ImageSizeID]) REFERENCES [tblImageSizes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUserImages_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUserShiftsPermission] (
        [Id] bigint NOT NULL IDENTITY,
        [UserId] bigint NOT NULL,
        [ShiftsGroupId] bigint NOT NULL,
        CONSTRAINT [PK_tblUserShiftsPermission] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUserShiftsPermission_tblShiftsGroup_ShiftsGroupId] FOREIGN KEY ([ShiftsGroupId]) REFERENCES [tblShiftsGroup] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUserShiftsPermission_tblUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [tblUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUserTemplatePermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [TemplateID] bigint NOT NULL,
        [ScheduleRightID] bigint NOT NULL,
        [UserID] bigint NOT NULL,
        CONSTRAINT [PK_tblUserTemplatePermissions] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUserTemplatePermissions_tblScheduleRights_ScheduleRightID] FOREIGN KEY ([ScheduleRightID]) REFERENCES [tblScheduleRights] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUserTemplatePermissions_tblTemplates_TemplateID] FOREIGN KEY ([TemplateID]) REFERENCES [tblTemplates] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUserTemplatePermissions_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSubGroups] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [SortOrder] int NULL,
        [HideFrom] datetime2 NOT NULL,
        [IsFromTemplate] bit NOT NULL,
        [ScheduleID] bigint NOT NULL,
        [ParentGroupID] bigint NULL,
        [LoneWorkerManager1ID] bigint NULL,
        [LoneWorkerManager2ID] bigint NULL,
        [AttendanceManager1ID] bigint NULL,
        [AttendanceManager2ID] bigint NULL,
        [TemplateSubGroupId] bigint NULL,
        CONSTRAINT [PK_tblSubGroups] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSubGroups_tblUsers_AttendanceManager1ID] FOREIGN KEY ([AttendanceManager1ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroups_tblUsers_AttendanceManager2ID] FOREIGN KEY ([AttendanceManager2ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroups_tblUsers_LoneWorkerManager1ID] FOREIGN KEY ([LoneWorkerManager1ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroups_tblUsers_LoneWorkerManager2ID] FOREIGN KEY ([LoneWorkerManager2ID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroups_tblSubGroups_ParentGroupID] FOREIGN KEY ([ParentGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroups_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblSubGroups_tblTemplateSubGroups_TemplateSubGroupId] FOREIGN KEY ([TemplateSubGroupId]) REFERENCES [tblTemplateSubGroups] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateSubGroupCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [Number] float NULL,
        [Text] nvarchar(max) NULL,
        [ManuallyUpdated] bit NOT NULL,
        [TemplateSubGroupID] bigint NOT NULL,
        [CustomDataID] bigint NOT NULL,
        [CustomDataLookupID] bigint NULL,
        CONSTRAINT [PK_tblTemplateSubGroupCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateSubGroupCustomDatas_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblTemplateSubGroupCustomDatas_tblCustomDataLookups_CustomDataLookupID] FOREIGN KEY ([CustomDataLookupID]) REFERENCES [tblCustomDataLookups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateSubGroupCustomDatas_tblTemplateSubGroups_TemplateSubGroupID] FOREIGN KEY ([TemplateSubGroupID]) REFERENCES [tblTemplateSubGroups] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblInsertedTemplates] (
        [Id] bigint NOT NULL IDENTITY,
        [TemplateID] bigint NOT NULL,
        [ScheduleID] bigint NOT NULL,
        [SubGroupID] bigint NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [Rotations] int NOT NULL,
        CONSTRAINT [PK_tblInsertedTemplates] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblInsertedTemplates_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblInsertedTemplates_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblInsertedTemplates_tblTemplates_TemplateID] FOREIGN KEY ([TemplateID]) REFERENCES [tblTemplates] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSubGroupCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [SubGroupID] bigint NOT NULL,
        [CustomDataID] bigint NOT NULL,
        [CustomDataLookupID] bigint NULL,
        [Number] float NULL,
        [Text] nvarchar(max) NULL,
        [ManuallyUpdated] bit NOT NULL,
        CONSTRAINT [PK_tblSubGroupCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSubGroupCustomDatas_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblSubGroupCustomDatas_tblCustomDataLookups_CustomDataLookupID] FOREIGN KEY ([CustomDataLookupID]) REFERENCES [tblCustomDataLookups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroupCustomDatas_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblSubGroupsApprovals] (
        [Id] bigint NOT NULL IDENTITY,
        [IsApproved] bit NOT NULL,
        [SubmitedDate] datetime2 NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [IsSchedule] bit NOT NULL,
        [Comment] nvarchar(max) NULL,
        [CurrentView] nvarchar(max) NULL,
        [IsVisible] bit NOT NULL,
        [IsReminded] bit NOT NULL,
        [ScheduleID] bigint NOT NULL,
        [SubGroupID] bigint NOT NULL,
        [UserId] bigint NULL,
        [ParentGroupID] bigint NULL,
        CONSTRAINT [PK_tblSubGroupsApprovals] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSubGroupsApprovals_tblSubGroupsApprovals_ParentGroupID] FOREIGN KEY ([ParentGroupID]) REFERENCES [tblSubGroupsApprovals] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroupsApprovals_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroupsApprovals_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSubGroupsApprovals_tblUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUnlockedSubGroups] (
        [Id] bigint NOT NULL IDENTITY,
        [UnlockedRangeID] bigint NOT NULL,
        [SubGroupID] bigint NOT NULL,
        CONSTRAINT [PK_tblUnlockedSubGroups] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUnlockedSubGroups_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUnlockedSubGroups_tblUnlockedRanges_UnlockedRangeID] FOREIGN KEY ([UnlockedRangeID]) REFERENCES [tblUnlockedRanges] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblUserSchedulePermissions] (
        [Id] bigint NOT NULL IDENTITY,
        [UserID] bigint NOT NULL,
        [ScheduleID] bigint NOT NULL,
        [SubGroupID] bigint NULL,
        [ScheduleRightID] bigint NOT NULL,
        CONSTRAINT [PK_tblUserSchedulePermissions] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblUserSchedulePermissions_tblSchedules_ScheduleID] FOREIGN KEY ([ScheduleID]) REFERENCES [tblSchedules] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUserSchedulePermissions_tblScheduleRights_ScheduleRightID] FOREIGN KEY ([ScheduleRightID]) REFERENCES [tblScheduleRights] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblUserSchedulePermissions_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblUserSchedulePermissions_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblInsertedSubGroups] (
        [Id] bigint NOT NULL IDENTITY,
        [InsertedTemplateID] bigint NOT NULL,
        [SubGroupID] bigint NULL,
        [ParentID] bigint NULL,
        [TemplateSubGroupID] bigint NULL,
        [TemplateSubGroupParentID] bigint NULL,
        [ShouldResetSubGroup] bit NOT NULL,
        CONSTRAINT [PK_tblInsertedSubGroups] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblInsertedSubGroups_tblInsertedTemplates_InsertedTemplateID] FOREIGN KEY ([InsertedTemplateID]) REFERENCES [tblInsertedTemplates] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblInsertedSubGroups_tblSubGroups_ParentID] FOREIGN KEY ([ParentID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblInsertedSubGroups_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblInsertedSubGroups_tblTemplateSubGroups_TemplateSubGroupID] FOREIGN KEY ([TemplateSubGroupID]) REFERENCES [tblTemplateSubGroups] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblBrokenRules] (
        [Id] bigint NOT NULL IDENTITY,
        [RuleName] nvarchar(50) NOT NULL,
        [MaxAllowed] bigint NULL,
        [NumberOfDays] int NULL,
        [DayOfWeek] nvarchar(20) NULL,
        [Skill] nvarchar(50) NULL,
        [LengthOfService] nvarchar(50) NULL,
        [ComparisonRuleFieldValue] nvarchar(50) NULL,
        [Operator] nvarchar(15) NULL,
        [EmployeeField] nvarchar(50) NULL,
        [EmployeeBFullName] nvarchar(50) NULL,
        [JobTypeName] nvarchar(50) NULL,
        [AbsenceCode] nvarchar(50) NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        [ConstraintID] bigint NULL,
        CONSTRAINT [PK_tblBrokenRules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblBrokenRules_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblBrokenRules_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeeConstraints] (
        [Id] bigint NOT NULL IDENTITY,
        [Value] bit NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        [ConstraintID] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeeConstraints] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeeConstraints_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblEmployeeConstraints_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [JobID] bigint NOT NULL,
        [CustomDataID] bigint NOT NULL,
        [CustomDataLookupID] bigint NULL,
        [Number] float NULL,
        [Text] nvarchar(max) NULL,
        [ManuallyUpdated] bit NOT NULL,
        CONSTRAINT [PK_tblJobCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobCustomDatas_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobCustomDatas_tblCustomDataLookups_CustomDataLookupID] FOREIGN KEY ([CustomDataLookupID]) REFERENCES [tblCustomDataLookups] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateJobCustomDatas] (
        [Id] bigint NOT NULL IDENTITY,
        [Number] float NULL,
        [Text] nvarchar(max) NULL,
        [ManualyUpdated] bit NOT NULL,
        [TemplateJobID] bigint NOT NULL,
        [CustomDataID] bigint NOT NULL,
        [CustomDataLookupID] bigint NULL,
        CONSTRAINT [PK_tblTemplateJobCustomDatas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateJobCustomDatas_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblTemplateJobCustomDatas_tblCustomDataLookups_CustomDataLookupID] FOREIGN KEY ([CustomDataLookupID]) REFERENCES [tblCustomDataLookups] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblAttendanceConfirmations] (
        [Id] bigint NOT NULL IDENTITY,
        [Date] datetime2 NOT NULL,
        [EmployeeNotificationDateTime] datetime2 NOT NULL,
        [Response] bit NULL,
        [ResponseTime] time NULL,
        [ManagerNotificationDateTime] datetime2 NULL,
        [ResponseWindow] datetime2 NULL,
        [DateOfAttendanceConfirmationItem] datetime2 NOT NULL,
        [ManagerFirstName] nvarchar(max) NULL,
        [ManagerLastName] nvarchar(max) NULL,
        [JobID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [UserId] bigint NULL,
        CONSTRAINT [PK_tblAttendanceConfirmations] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblAttendanceConfirmations_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblAttendanceConfirmations_tblUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeesOwnTradeOffers] (
        [Id] bigint NOT NULL IDENTITY,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeesOwnTradeOffers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeesOwnTradeOffers_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeesTradeOffers] (
        [Id] bigint NOT NULL IDENTITY,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        [EmployeeOwnTradeOfferID] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeesTradeOffers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeesTradeOffers_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblEmployeesTradeOffers_tblEmployeesOwnTradeOffers_EmployeeOwnTradeOfferID] FOREIGN KEY ([EmployeeOwnTradeOfferID]) REFERENCES [tblEmployeesOwnTradeOffers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblEmployeeSyncs] (
        [Id] bigint NOT NULL IDENTITY,
        [SyncID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeeSyncs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeeSyncs_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblEmployeeSyncs_tblSync_SyncID] FOREIGN KEY ([SyncID]) REFERENCES [tblSync] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobAvailabilities] (
        [Id] bigint NOT NULL IDENTITY,
        [IsAssigned] bit NOT NULL,
        [CompletelyValid] bit NOT NULL,
        [IsOverriden] bit NOT NULL,
        [SkillCode] bit NOT NULL,
        [LengthOfService] bit NOT NULL,
        [ComparisonRule] bit NOT NULL,
        [NotAlreadyAssigned] bit NOT NULL,
        [MaxNumberOfHours] bit NOT NULL,
        [MaxNoOfDaysOfTheWeek] bit NOT NULL,
        [SplitShifts] bit NOT NULL,
        [DaysOffWithinAPeriod] bit NOT NULL,
        [MNOJT] bit NOT NULL,
        [MNOJTC] bit NOT NULL,
        [EMNWWAE] bit NOT NULL,
        [EMWWAE] bit NOT NULL,
        [EmployeePlannedAbsence] bit NOT NULL,
        [IsApproved] bit NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        CONSTRAINT [PK_tblJobAvailabilities] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobAvailabilities_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblRecordsForTrade] (
        [Id] bigint NOT NULL IDENTITY,
        [OriginalAssignedEmployeeID] bigint NULL,
        [JobAvailabilityID] bigint NOT NULL,
        CONSTRAINT [PK_tblRecordsForTrade] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblRecordsForTrade_tblJobAvailabilities_JobAvailabilityID] FOREIGN KEY ([JobAvailabilityID]) REFERENCES [tblJobAvailabilities] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblRecordsForTrade_tblEmployees_OriginalAssignedEmployeeID] FOREIGN KEY ([OriginalAssignedEmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobOffers] (
        [Id] bigint NOT NULL IDENTITY,
        [JobID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [UserID] bigint NULL,
        [JobOfferStatusID] bigint NOT NULL,
        [JobOfferDate] datetime2 NOT NULL,
        CONSTRAINT [PK_tblJobOffers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobOffers_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobOffers_tblJobOfferStatuses_JobOfferStatusID] FOREIGN KEY ([JobOfferStatusID]) REFERENCES [tblJobOfferStatuses] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobOffers_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobOffersForAutoAssigments] (
        [Id] bigint NOT NULL IDENTITY,
        [JobID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        CONSTRAINT [PK_tblJobOffersForAutoAssigments] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobOffersForAutoAssigments_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLoneWorkerAlerts] (
        [Id] bigint NOT NULL IDENTITY,
        [AlertDateTime] datetime2 NOT NULL,
        [Notes] nvarchar(1000) NULL,
        [IsOpened] bit NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        CONSTRAINT [PK_tblLoneWorkerAlerts] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblLoneWorkerAlerts_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLoneWorkerCheckIns] (
        [Id] bigint NOT NULL IDENTITY,
        [TimeToSendConfirmation] datetime2 NOT NULL,
        [OrdinalNumberOfSending] int NOT NULL,
        [JobID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        CONSTRAINT [PK_tblLoneWorkerCheckIns] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblLoneWorkerCheckIns_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblLoneWorkerTransactionLogs] (
        [Id] bigint NOT NULL IDENTITY,
        [Date] datetime2 NOT NULL,
        [FirstNotificationDateTime] datetime2 NOT NULL,
        [SecondNotificationDateTime] datetime2 NULL,
        [EmployeeResponse] datetime2 NULL,
        [ManagerNotification] datetime2 NULL,
        [ManagerName] nvarchar(max) NULL,
        [AdminNotification] datetime2 NULL,
        [AdminName] nvarchar(max) NULL,
        [JobID] bigint NOT NULL,
        [EmployeeID] bigint NOT NULL,
        CONSTRAINT [PK_tblLoneWorkerTransactionLogs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblLoneWorkerTransactionLogs_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateBrokenRules] (
        [Id] bigint NOT NULL IDENTITY,
        [RuleName] nvarchar(50) NOT NULL,
        [Skill] nvarchar(50) NULL,
        [ComparisonRuleFieldValue] nvarchar(50) NULL,
        [Operator] nvarchar(15) NULL,
        [EmployeeField] nvarchar(50) NULL,
        [EmployeeBFullName] nvarchar(50) NULL,
        [JobTypeName] nvarchar(50) NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateBrokenRules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateBrokenRules_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateEmployeeConstraints] (
        [Id] bigint NOT NULL IDENTITY,
        [Value] bit NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [JobID] bigint NOT NULL,
        [ConstraintID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateEmployeeConstraints] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateEmployeeConstraints_tblTemplateConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblTemplateConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblTemplateEmployeeConstraints_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateJobAvailabilities] (
        [Id] bigint NOT NULL IDENTITY,
        [CompletelyValid] bit NOT NULL,
        [IsAssigned] bit NOT NULL,
        [IsOverriden] bit NOT NULL,
        [IsUnassigned] bit NOT NULL,
        [SkillCode] bit NOT NULL,
        [ComparisonRule] bit NOT NULL,
        [NotAlreadyAssigned] bit NOT NULL,
        [EmployeeID] bigint NOT NULL,
        [TemplateJobID] bigint NOT NULL,
        CONSTRAINT [PK_tblTemplateJobAvailabilities] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateJobAvailabilities_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblInsertedJobs] (
        [Id] bigint NOT NULL IDENTITY,
        [InsertedTemplateID] bigint NOT NULL,
        [JobID] bigint NULL,
        [JobStartDateTime] datetime2 NOT NULL,
        [JobEndDateTime] datetime2 NOT NULL,
        [TemplateJobID] bigint NULL,
        [ShouldUpdateJob] bit NOT NULL,
        CONSTRAINT [PK_tblInsertedJobs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblInsertedJobs_tblInsertedTemplates_InsertedTemplateID] FOREIGN KEY ([InsertedTemplateID]) REFERENCES [tblInsertedTemplates] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblTemplateJobs] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [JobStartDateTime] datetime2 NOT NULL,
        [JobEndDateTime] datetime2 NOT NULL,
        [Day] int NOT NULL,
        [Hours] bigint NOT NULL,
        [ManualEditedHours] bit NOT NULL,
        [Hours1] bigint NOT NULL,
        [ManualEditedHours1] bit NOT NULL,
        [Hours2] bigint NOT NULL,
        [ManualEditedHours2] bit NOT NULL,
        [Hours3] bigint NOT NULL,
        [ManualEditedHours3] bit NOT NULL,
        [Hours4] bigint NOT NULL,
        [ManualEditedHours4] bit NOT NULL,
        [Hours5] bigint NOT NULL,
        [ManualEditedHours5] bit NOT NULL,
        [Hours6] bigint NOT NULL,
        [ManualEditedHours6] bit NOT NULL,
        [Notes] nvarchar(1000) NULL,
        [NoOfEmployeesRequired] int NOT NULL,
        [AllowedTrade] bit NOT NULL,
        [IsConcurrent] bit NOT NULL,
        [ReferenceArea] nvarchar(50) NULL,
        [SortOrder] int NULL,
        [IsCriticalTask] bit NOT NULL,
        [Approved] bit NOT NULL,
        [NumberOfValidAssigned] int NOT NULL,
        [NumberOfInvalidAssigned] int NOT NULL,
        [LoneWorkerJob] bit NOT NULL,
        [ManuallyEditedLoneWorkerJob] bit NOT NULL,
        [LoneWorkerRecurringIntervals] bigint NULL,
        [ManuallyEditedReccuringIntervals] bit NOT NULL,
        [LoneWorkerResponseWindow] bigint NULL,
        [ManuallyEditedResponseWindow] bit NOT NULL,
        [AttendanceConfirmation] bit NOT NULL,
        [ManuallyEditedAttendanceConfirmation] bit NOT NULL,
        [AttendanceTimeBeforeStart] bigint NULL,
        [ManuallyEditedAttendanceTimeBeforeStart] bit NOT NULL,
        [AttendanceResponseWindow] bigint NULL,
        [ManuallyEditedAttendanceResponseWindow] bit NOT NULL,
        [TemplateSubGroupID] bigint NOT NULL,
        [JobTypeID] bigint NOT NULL,
        [JobStatusID] bigint NOT NULL,
        [OriginalJobID] bigint NULL,
        [ShiftID] bigint NULL,
        CONSTRAINT [PK_tblTemplateJobs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblTemplateJobs_tblJobStatuses_JobStatusID] FOREIGN KEY ([JobStatusID]) REFERENCES [tblJobStatuses] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblTemplateJobs_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblTemplateJobs_tblShifts_ShiftID] FOREIGN KEY ([ShiftID]) REFERENCES [tblShifts] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblTemplateJobs_tblTemplateSubGroups_TemplateSubGroupID] FOREIGN KEY ([TemplateSubGroupID]) REFERENCES [tblTemplateSubGroups] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE TABLE [tblJobs] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [JobStartDateTime] datetime2 NOT NULL,
        [JobEndDateTime] datetime2 NOT NULL,
        [Hours] bigint NOT NULL,
        [ManualEditedHours] bit NOT NULL,
        [Hours1] bigint NOT NULL,
        [ManualEditedHours1] bit NOT NULL,
        [Hours2] bigint NOT NULL,
        [ManualEditedHours2] bit NOT NULL,
        [Hours3] bigint NOT NULL,
        [ManualEditedHours3] bit NOT NULL,
        [Hours4] bigint NOT NULL,
        [ManualEditedHours4] bit NOT NULL,
        [Hours5] bigint NOT NULL,
        [ManualEditedHours5] bit NOT NULL,
        [Hours6] bigint NOT NULL,
        [ManualEditedHours6] bit NOT NULL,
        [Notes] nvarchar(1000) NULL,
        [NoOfEmployeesRequired] int NOT NULL,
        [AllowedTrade] bit NOT NULL,
        [ManualEditedAllowedTrade] bit NOT NULL,
        [IsConcurrent] bit NOT NULL,
        [ReferenceArea] nvarchar(50) NULL,
        [SortOrder] int NULL,
        [IsCriticalTask] bit NOT NULL,
        [Approved] bit NOT NULL,
        [NumberOfValidAssigned] int NOT NULL,
        [NumberOfInvalidAssigned] int NOT NULL,
        [LoneWorkerJob] bit NOT NULL,
        [ManuallyEditedLoneWorkerJob] bit NOT NULL,
        [LoneWorkerRecurringIntervals] bigint NULL,
        [ManuallyEditedReccuringIntervals] bit NOT NULL,
        [LoneWorkerResponseWindow] bigint NULL,
        [ManuallyEditedResponseWindow] bit NOT NULL,
        [AttendanceConfirmation] bit NOT NULL,
        [ManuallyEditedAttendanceConfirmation] bit NOT NULL,
        [AttendanceTimeBeforeStart] bigint NULL,
        [ManuallyEditedAttendanceTimeBeforeStart] bit NOT NULL,
        [AttendanceResponseWindow] bigint NULL,
        [ManuallyEditedAttendanceResponseWindow] bit NOT NULL,
        [SubGroupID] bigint NOT NULL,
        [JobTypeID] bigint NOT NULL,
        [JobStatusID] bigint NOT NULL,
        [ShiftID] bigint NULL,
        [TemplateJobId] bigint NULL,
        CONSTRAINT [PK_tblJobs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobs_tblJobStatuses_JobStatusID] FOREIGN KEY ([JobStatusID]) REFERENCES [tblJobStatuses] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobs_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobs_tblShifts_ShiftID] FOREIGN KEY ([ShiftID]) REFERENCES [tblShifts] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblJobs_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobs_tblTemplateJobs_TemplateJobId] FOREIGN KEY ([TemplateJobId]) REFERENCES [tblTemplateJobs] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Color', N'CountsForReconciliation', N'CountsForRefPeriodAbs', N'Name') AND [object_id] = OBJECT_ID(N'[tblAbsenceCodes]'))
        SET IDENTITY_INSERT [tblAbsenceCodes] ON;
    EXEC(N'INSERT INTO [tblAbsenceCodes] ([Id], [Color], [CountsForReconciliation], [CountsForRefPeriodAbs], [Name])
    VALUES (CAST(1 AS bigint), N''#ffff00'', CAST(0 AS bit), CAST(0 AS bit), N''Holiday'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Color', N'CountsForReconciliation', N'CountsForRefPeriodAbs', N'Name') AND [object_id] = OBJECT_ID(N'[tblAbsenceCodes]'))
        SET IDENTITY_INSERT [tblAbsenceCodes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DeadlineDays') AND [object_id] = OBJECT_ID(N'[tblAbsencePreferences]'))
        SET IDENTITY_INSERT [tblAbsencePreferences] ON;
    EXEC(N'INSERT INTO [tblAbsencePreferences] ([Id], [DeadlineDays])
    VALUES (CAST(1 AS bigint), 0)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DeadlineDays') AND [object_id] = OBJECT_ID(N'[tblAbsencePreferences]'))
        SET IDENTITY_INSERT [tblAbsencePreferences] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Color', N'Status') AND [object_id] = OBJECT_ID(N'[tblAbsenceStatuses]'))
        SET IDENTITY_INSERT [tblAbsenceStatuses] ON;
    EXEC(N'INSERT INTO [tblAbsenceStatuses] ([Id], [Color], [Status])
    VALUES (CAST(1 AS bigint), N''#42C003'', N''Approved''),
    (CAST(2 AS bigint), N''#EAB217'', N''Pending''),
    (CAST(3 AS bigint), N''#E51919'', N''Rejected'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Color', N'Status') AND [object_id] = OBJECT_ID(N'[tblAbsenceStatuses]'))
        SET IDENTITY_INSERT [tblAbsenceStatuses] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblConstraintRules]'))
        SET IDENTITY_INSERT [tblConstraintRules] ON;
    EXEC(N'INSERT INTO [tblConstraintRules] ([Id], [Name])
    VALUES (CAST(12 AS bigint), N''Employee Planned Absence''),
    (CAST(11 AS bigint), N''Days Off Within A Period''),
    (CAST(10 AS bigint), N''Split Shifts''),
    (CAST(9 AS bigint), N''Employee Field Value''),
    (CAST(8 AS bigint), N''Maximum Number Of Job Types Consecutively''),
    (CAST(7 AS bigint), N''Maximum Number Of Job Types''),
    (CAST(5 AS bigint), N''Employee Must Not Work With Another Employee''),
    (CAST(4 AS bigint), N''Maximum Number Of Days Of The Week''),
    (CAST(3 AS bigint), N''Employee Leaver Status''),
    (CAST(2 AS bigint), N''Maximum Number Of Hours''),
    (CAST(1 AS bigint), N''Not Already Assigned''),
    (CAST(6 AS bigint), N''Employee Must Work With Another Employee'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblConstraintRules]'))
        SET IDENTITY_INSERT [tblConstraintRules] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblCustomDataTypes]'))
        SET IDENTITY_INSERT [tblCustomDataTypes] ON;
    EXEC(N'INSERT INTO [tblCustomDataTypes] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Text''),
    (CAST(2 AS bigint), N''Number''),
    (CAST(3 AS bigint), N''Lookup'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblCustomDataTypes]'))
        SET IDENTITY_INSERT [tblCustomDataTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'SmtpAddress', N'SmtpPassword', N'SmtpPort', N'SmtpServer') AND [object_id] = OBJECT_ID(N'[tblEmailSettings]'))
        SET IDENTITY_INSERT [tblEmailSettings] ON;
    EXEC(N'INSERT INTO [tblEmailSettings] ([Id], [SmtpAddress], [SmtpPassword], [SmtpPort], [SmtpServer])
    VALUES (CAST(1 AS bigint), N''petar.petrovic.novi.sad.1992@gmail.com'', N''a2xhc2lrYUsx'', 587, N''smtp.gmail.com'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'SmtpAddress', N'SmtpPassword', N'SmtpPort', N'SmtpServer') AND [object_id] = OBJECT_ID(N'[tblEmailSettings]'))
        SET IDENTITY_INSERT [tblEmailSettings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AdditionalInfo', N'Address1', N'Address2', N'Address3', N'Address4', N'AllowedTrades', N'Availability', N'Class', N'CostCode', N'DateOfBirth', N'Department', N'Division', N'Email', N'EmployeeNumber', N'Gender', N'JobTitle', N'JobType', N'LeaveDate', N'Location', N'Manager', N'MaxHours1', N'MaxHours2', N'MaxHours3', N'MaxHours4', N'MaxHours5', N'MobileNumber', N'PayRate', N'ScheduledHours', N'StartDate', N'TargetRuleGroup', N'Team', N'TelephoneNumber', N'WorkRules') AND [object_id] = OBJECT_ID(N'[tblEmployeeTile]'))
        SET IDENTITY_INSERT [tblEmployeeTile] ON;
    EXEC(N'INSERT INTO [tblEmployeeTile] ([Id], [AdditionalInfo], [Address1], [Address2], [Address3], [Address4], [AllowedTrades], [Availability], [Class], [CostCode], [DateOfBirth], [Department], [Division], [Email], [EmployeeNumber], [Gender], [JobTitle], [JobType], [LeaveDate], [Location], [Manager], [MaxHours1], [MaxHours2], [MaxHours3], [MaxHours4], [MaxHours5], [MobileNumber], [PayRate], [ScheduledHours], [StartDate], [TargetRuleGroup], [Team], [TelephoneNumber], [WorkRules])
    VALUES (CAST(1 AS bigint), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit))');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AdditionalInfo', N'Address1', N'Address2', N'Address3', N'Address4', N'AllowedTrades', N'Availability', N'Class', N'CostCode', N'DateOfBirth', N'Department', N'Division', N'Email', N'EmployeeNumber', N'Gender', N'JobTitle', N'JobType', N'LeaveDate', N'Location', N'Manager', N'MaxHours1', N'MaxHours2', N'MaxHours3', N'MaxHours4', N'MaxHours5', N'MobileNumber', N'PayRate', N'ScheduledHours', N'StartDate', N'TargetRuleGroup', N'Team', N'TelephoneNumber', N'WorkRules') AND [object_id] = OBJECT_ID(N'[tblEmployeeTile]'))
        SET IDENTITY_INSERT [tblEmployeeTile] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Count', N'Period') AND [object_id] = OBJECT_ID(N'[tblGDPR]'))
        SET IDENTITY_INSERT [tblGDPR] ON;
    EXEC(N'INSERT INTO [tblGDPR] ([Id], [Count], [Period])
    VALUES (CAST(1 AS bigint), NULL, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Count', N'Period') AND [object_id] = OBJECT_ID(N'[tblGDPR]'))
        SET IDENTITY_INSERT [tblGDPR] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[tblGenders]'))
        SET IDENTITY_INSERT [tblGenders] ON;
    EXEC(N'INSERT INTO [tblGenders] ([Id], [Description], [Name])
    VALUES (CAST(3 AS bigint), N''Other'', N''Other''),
    (CAST(1 AS bigint), N''Female'', N''Female''),
    (CAST(2 AS bigint), N''Male'', N''Male'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[tblGenders]'))
        SET IDENTITY_INSERT [tblGenders] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Height', N'Size', N'Width') AND [object_id] = OBJECT_ID(N'[tblImageSizes]'))
        SET IDENTITY_INSERT [tblImageSizes] ON;
    EXEC(N'INSERT INTO [tblImageSizes] ([Id], [Description], [Height], [Size], [Width])
    VALUES (CAST(1 AS bigint), N''This size of picture is used for employee edit page.'', 200, N''L'', 200),
    (CAST(2 AS bigint), N''This size of picture is used for employee list on edit Job modal.'', 40, N''M'', 40),
    (CAST(3 AS bigint), N''This size of picture is used for employee list on edit Job modal.'', 30, N''S'', 30),
    (CAST(4 AS bigint), N''This size of image is used for preview employees on calendar.'', 20, N''XS'', 20)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Height', N'Size', N'Width') AND [object_id] = OBJECT_ID(N'[tblImageSizes]'))
        SET IDENTITY_INSERT [tblImageSizes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblJobOfferStatuses]'))
        SET IDENTITY_INSERT [tblJobOfferStatuses] ON;
    EXEC(N'INSERT INTO [tblJobOfferStatuses] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Pending''),
    (CAST(2 AS bigint), N''Accepted''),
    (CAST(3 AS bigint), N''Rejected'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblJobOfferStatuses]'))
        SET IDENTITY_INSERT [tblJobOfferStatuses] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblJobStatuses]'))
        SET IDENTITY_INSERT [tblJobStatuses] ON;
    EXEC(N'INSERT INTO [tblJobStatuses] ([Id], [Description], [Name], [PrimaryColor], [SecondaryColor])
    VALUES (CAST(3 AS bigint), N''This is a job where more than the required number of employees has been assigned to it.'', N''Too many employees assigned'', N''#0D60A6'', N''#0D60A6''),
    (CAST(7 AS bigint), N''This is a concurrent job.'', N''Concurrent job'', N''#808080'', N''#808080''),
    (CAST(6 AS bigint), N''This is a job where the correct required amount of employees have been assigned to the job but there are no additional employees that could be assigned, ie when fully assigned there is no spare capaAddress3 of employees.'', N''Correct number of employees assigned but no cover'', N''#157A80'', N''#157A80''),
    (CAST(5 AS bigint), N''This is a job where either no employees or some employees have been assigned and there are some employees that meet the criteria for assignment but not enough to fully assign the job.'', N''Insufficient employees to meet the requirement'', N''#F2A900'', N''#F2A900''),
    (CAST(2 AS bigint), N''This is a job where the correct required amount of employees have been assigned and there are still additional employees that could be assigned, ie it fully assigned and there is spare capaAddress3 of employees.'', N''Correct number of employees assigned'', N''#458045'', N''#458045''),
    (CAST(1 AS bigint), N''This is a job where no employees have been assigned and there are zero employees that meet the criteria for assignment.'', N''No available employees'', N''#E6727D'', N''#E6727D''),
    (CAST(4 AS bigint), N''This is a job where not all employees have been assigned (either none or some) and there are more than enough available employees than needed.'', N''Insufficient employees assigned'', N''#DC3545'', N''#DC3545'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblJobStatuses]'))
        SET IDENTITY_INSERT [tblJobStatuses] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AllowedTrade', N'AttendanceConfirmation', N'AttendanceResponseWindow', N'AttendanceTimeBeforeStart', N'IsLengthOfServiceNonEssential', N'LoneWorkerJob', N'LoneWorkerRecurringIntervals', N'LoneWorkerResponseWindow', N'Name', N'TimeUnitID', N'TimeUnitValue') AND [object_id] = OBJECT_ID(N'[tblJobTypes]'))
        SET IDENTITY_INSERT [tblJobTypes] ON;
    EXEC(N'INSERT INTO [tblJobTypes] ([Id], [AllowedTrade], [AttendanceConfirmation], [AttendanceResponseWindow], [AttendanceTimeBeforeStart], [IsLengthOfServiceNonEssential], [LoneWorkerJob], [LoneWorkerRecurringIntervals], [LoneWorkerResponseWindow], [Name], [TimeUnitID], [TimeUnitValue])
    VALUES (CAST(1 AS bigint), CAST(0 AS bit), CAST(0 AS bit), NULL, NULL, CAST(0 AS bit), CAST(0 AS bit), NULL, NULL, N''Job Type Removed'', NULL, NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AllowedTrade', N'AttendanceConfirmation', N'AttendanceResponseWindow', N'AttendanceTimeBeforeStart', N'IsLengthOfServiceNonEssential', N'LoneWorkerJob', N'LoneWorkerRecurringIntervals', N'LoneWorkerResponseWindow', N'Name', N'TimeUnitID', N'TimeUnitValue') AND [object_id] = OBJECT_ID(N'[tblJobTypes]'))
        SET IDENTITY_INSERT [tblJobTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblLinkedEmployeeRights]'))
        SET IDENTITY_INSERT [tblLinkedEmployeeRights] ON;
    EXEC(N'INSERT INTO [tblLinkedEmployeeRights] ([Id], [Name])
    VALUES (CAST(2 AS bigint), N''Read-only Access''),
    (CAST(1 AS bigint), N''Full Access''),
    (CAST(3 AS bigint), N''No Access'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblLinkedEmployeeRights]'))
        SET IDENTITY_INSERT [tblLinkedEmployeeRights] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name', N'Value') AND [object_id] = OBJECT_ID(N'[tblLocales]'))
        SET IDENTITY_INSERT [tblLocales] ON;
    EXEC(N'INSERT INTO [tblLocales] ([Id], [Name], [Value])
    VALUES (CAST(2 AS bigint), N''US MM/DD/YYYY'', N''en''),
    (CAST(1 AS bigint), N''UK DD/MM/YYYY'', N''en-gb'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name', N'Value') AND [object_id] = OBJECT_ID(N'[tblLocales]'))
        SET IDENTITY_INSERT [tblLocales] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblNotificationTypes]'))
        SET IDENTITY_INSERT [tblNotificationTypes] ON;
    EXEC(N'INSERT INTO [tblNotificationTypes] ([Id], [Name])
    VALUES (CAST(3 AS bigint), N''Push&Email''),
    (CAST(2 AS bigint), N''Email''),
    (CAST(1 AS bigint), N''Push'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblNotificationTypes]'))
        SET IDENTITY_INSERT [tblNotificationTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblOrganisationFields]'))
        SET IDENTITY_INSERT [tblOrganisationFields] ON;
    EXEC(N'INSERT INTO [tblOrganisationFields] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Location''),
    (CAST(2 AS bigint), N''Department''),
    (CAST(3 AS bigint), N''Cost code''),
    (CAST(4 AS bigint), N''Class''),
    (CAST(5 AS bigint), N''Division''),
    (CAST(6 AS bigint), N''Job title''),
    (CAST(7 AS bigint), N''Team'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblOrganisationFields]'))
        SET IDENTITY_INSERT [tblOrganisationFields] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionOptions]'))
        SET IDENTITY_INSERT [tblPermissionOptions] ON;
    EXEC(N'INSERT INTO [tblPermissionOptions] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Modify''),
    (CAST(2 AS bigint), N''Read-only'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionOptions]'))
        SET IDENTITY_INSERT [tblPermissionOptions] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] ON;
    EXEC(N'INSERT INTO [tblPermissionTypes] ([Id], [Name])
    VALUES (CAST(6 AS bigint), N''System''),
    (CAST(5 AS bigint), N''Skills''),
    (CAST(4 AS bigint), N''Schedule''),
    (CAST(2 AS bigint), N''Organisational''),
    (CAST(1 AS bigint), N''Personal''),
    (CAST(3 AS bigint), N''Pay'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Amount', N'BaseDate', N'BaseDateRange', N'ComparisonMode', N'ComparisonValue', N'CountOvernights', N'CustomDataID', N'DateRange', N'DayOfWeek', N'EmployeeField', N'JobEndFrom', N'JobEndTo', N'JobStartFrom', N'JobStartTo', N'Name', N'Offset', N'Operator', N'RestrictedToJobTypeID', N'ReverseOrder') AND [object_id] = OBJECT_ID(N'[tblRankingTypes]'))
        SET IDENTITY_INSERT [tblRankingTypes] ON;
    EXEC(N'INSERT INTO [tblRankingTypes] ([Id], [Amount], [BaseDate], [BaseDateRange], [ComparisonMode], [ComparisonValue], [CountOvernights], [CustomDataID], [DateRange], [DayOfWeek], [EmployeeField], [JobEndFrom], [JobEndTo], [JobStartFrom], [JobStartTo], [Name], [Offset], [Operator], [RestrictedToJobTypeID], [ReverseOrder])
    VALUES (CAST(1 AS bigint), CAST(1 AS bit), CAST(1 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N''Scheduled Hours'', CAST(1 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit)),
    (CAST(2 AS bigint), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N''Default job'', CAST(0 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit)),
    (CAST(3 AS bigint), CAST(1 AS bit), CAST(1 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N''Job Type Frequency'', CAST(1 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit)),
    (CAST(4 AS bigint), CAST(1 AS bit), CAST(1 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N''Day of week frequency'', CAST(1 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit)),
    (CAST(5 AS bigint), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N''Employee field value'', CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit), CAST(1 AS bit))');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Amount', N'BaseDate', N'BaseDateRange', N'ComparisonMode', N'ComparisonValue', N'CountOvernights', N'CustomDataID', N'DateRange', N'DayOfWeek', N'EmployeeField', N'JobEndFrom', N'JobEndTo', N'JobStartFrom', N'JobStartTo', N'Name', N'Offset', N'Operator', N'RestrictedToJobTypeID', N'ReverseOrder') AND [object_id] = OBJECT_ID(N'[tblRankingTypes]'))
        SET IDENTITY_INSERT [tblRankingTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblReportGroups]'))
        SET IDENTITY_INSERT [tblReportGroups] ON;
    EXEC(N'INSERT INTO [tblReportGroups] ([Id], [Name])
    VALUES (CAST(5 AS bigint), N''Employee''),
    (CAST(4 AS bigint), N''Job Start Time''),
    (CAST(3 AS bigint), N''Job type''),
    (CAST(2 AS bigint), N''Date''),
    (CAST(1 AS bigint), N''Schedule - Subgroup'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblReportGroups]'))
        SET IDENTITY_INSERT [tblReportGroups] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblReportTypes]'))
        SET IDENTITY_INSERT [tblReportTypes] ON;
    EXEC(N'INSERT INTO [tblReportTypes] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Schedule Detail Report''),
    (CAST(2 AS bigint), N''Schedule Summary Report''),
    (CAST(3 AS bigint), N''Schedule Employee Breakdown Report'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblReportTypes]'))
        SET IDENTITY_INSERT [tblReportTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AcceptedAutoAssignmentsDeadlineForJobOffers', N'AutoAssignmentsForJobOffers', N'LoneWorkerAdmin1ID', N'LoneWorkerAdmin2ID', N'MaxNumberOfSubGroups', N'TradeDeadlineValue') AND [object_id] = OBJECT_ID(N'[tblSchedulePreferences]'))
        SET IDENTITY_INSERT [tblSchedulePreferences] ON;
    EXEC(N'INSERT INTO [tblSchedulePreferences] ([Id], [AcceptedAutoAssignmentsDeadlineForJobOffers], [AutoAssignmentsForJobOffers], [LoneWorkerAdmin1ID], [LoneWorkerAdmin2ID], [MaxNumberOfSubGroups], [TradeDeadlineValue])
    VALUES (CAST(1 AS bigint), NULL, CAST(0 AS bit), NULL, NULL, NULL, 0.0E0)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AcceptedAutoAssignmentsDeadlineForJobOffers', N'AutoAssignmentsForJobOffers', N'LoneWorkerAdmin1ID', N'LoneWorkerAdmin2ID', N'MaxNumberOfSubGroups', N'TradeDeadlineValue') AND [object_id] = OBJECT_ID(N'[tblSchedulePreferences]'))
        SET IDENTITY_INSERT [tblSchedulePreferences] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblScheduleRights]'))
        SET IDENTITY_INSERT [tblScheduleRights] ON;
    EXEC(N'INSERT INTO [tblScheduleRights] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Modify''),
    (CAST(2 AS bigint), N''Limited modify''),
    (CAST(3 AS bigint), N''Read-only''),
    (CAST(4 AS bigint), N''Anonymous'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblScheduleRights]'))
        SET IDENTITY_INSERT [tblScheduleRights] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DaysBeforePasswordExpires', N'MinimumLength', N'MinimumNumericCharacters', N'MinimumSpecialCharacters', N'MinimumUpperCharacters', N'TimeoutMinutes') AND [object_id] = OBJECT_ID(N'[tblSecurity]'))
        SET IDENTITY_INSERT [tblSecurity] ON;
    EXEC(N'INSERT INTO [tblSecurity] ([Id], [DaysBeforePasswordExpires], [MinimumLength], [MinimumNumericCharacters], [MinimumSpecialCharacters], [MinimumUpperCharacters], [TimeoutMinutes])
    VALUES (CAST(1 AS bigint), NULL, 6, 0, 0, 0, 10)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DaysBeforePasswordExpires', N'MinimumLength', N'MinimumNumericCharacters', N'MinimumSpecialCharacters', N'MinimumUpperCharacters', N'TimeoutMinutes') AND [object_id] = OBJECT_ID(N'[tblSecurity]'))
        SET IDENTITY_INSERT [tblSecurity] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Email', N'IsFirstLogin', N'Password', N'Username') AND [object_id] = OBJECT_ID(N'[tblSuperAdmins]'))
        SET IDENTITY_INSERT [tblSuperAdmins] ON;
    EXEC(N'INSERT INTO [tblSuperAdmins] ([Id], [Email], [IsFirstLogin], [Password], [Username])
    VALUES (CAST(1 AS bigint), N''petar.petrovic.novi.sad.1992@gmail.com'', CAST(1 AS bit), N''be834cc0d15ab084a32c38487ef23f80ae5f6ac2cf07fb720f4e0f77fa18ad03'', N''Adminadv'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Email', N'IsFirstLogin', N'Password', N'Username') AND [object_id] = OBJECT_ID(N'[tblSuperAdmins]'))
        SET IDENTITY_INSERT [tblSuperAdmins] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DisplaySyncButton', N'Message') AND [object_id] = OBJECT_ID(N'[tblSyncSettings]'))
        SET IDENTITY_INSERT [tblSyncSettings] ON;
    EXEC(N'INSERT INTO [tblSyncSettings] ([Id], [DisplaySyncButton], [Message])
    VALUES (CAST(1 AS bigint), CAST(0 AS bit), N''Sync Successful'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DisplaySyncButton', N'Message') AND [object_id] = OBJECT_ID(N'[tblSyncSettings]'))
        SET IDENTITY_INSERT [tblSyncSettings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblSyncStatuses]'))
        SET IDENTITY_INSERT [tblSyncStatuses] ON;
    EXEC(N'INSERT INTO [tblSyncStatuses] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Pending''),
    (CAST(2 AS bigint), N''Error''),
    (CAST(3 AS bigint), N''Success'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblSyncStatuses]'))
        SET IDENTITY_INSERT [tblSyncStatuses] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblTemplateConstraintRules]'))
        SET IDENTITY_INSERT [tblTemplateConstraintRules] ON;
    EXEC(N'INSERT INTO [tblTemplateConstraintRules] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Not Already Assigned''),
    (CAST(2 AS bigint), N''Employee Must Not Work With Another Employee''),
    (CAST(3 AS bigint), N''Employee Must Work With Another Employee''),
    (CAST(4 AS bigint), N''Employee Field Value'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblTemplateConstraintRules]'))
        SET IDENTITY_INSERT [tblTemplateConstraintRules] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblTimeUnits]'))
        SET IDENTITY_INSERT [tblTimeUnits] ON;
    EXEC(N'INSERT INTO [tblTimeUnits] ([Id], [Name])
    VALUES (CAST(1 AS bigint), N''Years''),
    (CAST(2 AS bigint), N''Months''),
    (CAST(3 AS bigint), N''Weeks'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblTimeUnits]'))
        SET IDENTITY_INSERT [tblTimeUnits] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsMonthlyPayPeriod', N'LocalesID', N'PayPeriodNumberOfDays', N'PayPeriodStartDate', N'ScheduleInitialDateRange', N'StartDayOfWeek') AND [object_id] = OBJECT_ID(N'[tblScheduleDatePreferences]'))
        SET IDENTITY_INSERT [tblScheduleDatePreferences] ON;
    EXEC(N'INSERT INTO [tblScheduleDatePreferences] ([Id], [IsMonthlyPayPeriod], [LocalesID], [PayPeriodNumberOfDays], [PayPeriodStartDate], [ScheduleInitialDateRange], [StartDayOfWeek])
    VALUES (CAST(1 AS bigint), CAST(0 AS bit), CAST(1 AS bigint), NULL, NULL, N''Week'', N''Monday'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsMonthlyPayPeriod', N'LocalesID', N'PayPeriodNumberOfDays', N'PayPeriodStartDate', N'ScheduleInitialDateRange', N'StartDayOfWeek') AND [object_id] = OBJECT_ID(N'[tblScheduleDatePreferences]'))
        SET IDENTITY_INSERT [tblScheduleDatePreferences] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAbsenceRequests_AbsenceCodeID] ON [tblAbsenceRequests] ([AbsenceCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAbsenceRequests_AbsenceStatusID] ON [tblAbsenceRequests] ([AbsenceStatusID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAbsenceRequests_EmployeeAbsenceID] ON [tblAbsenceRequests] ([EmployeeAbsenceID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAbsenceRequests_EmployeeID] ON [tblAbsenceRequests] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAbsenceRequests_UserID] ON [tblAbsenceRequests] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAgencyJobAssignments_AgencyID] ON [tblAgencyJobAssignments] ([AgencyID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAgencyJobAssignments_AgencyReasonForCoverID] ON [tblAgencyJobAssignments] ([AgencyReasonForCoverID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAgencyJobAssignments_JobID] ON [tblAgencyJobAssignments] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAgencyTemplateJobAssignments_AgencyID] ON [tblAgencyTemplateJobAssignments] ([AgencyID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAgencyTemplateJobAssignments_AgencyReasonForCoverID] ON [tblAgencyTemplateJobAssignments] ([AgencyReasonForCoverID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAgencyTemplateJobAssignments_TemplateJobID] ON [tblAgencyTemplateJobAssignments] ([TemplateJobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAttendanceConfirmations_EmployeeID] ON [tblAttendanceConfirmations] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAttendanceConfirmations_JobID] ON [tblAttendanceConfirmations] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblAttendanceConfirmations_UserId] ON [tblAttendanceConfirmations] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblBrokenRules_ConstraintID] ON [tblBrokenRules] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblBrokenRules_EmployeeID] ON [tblBrokenRules] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblBrokenRules_JobID] ON [tblBrokenRules] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Class_Name_Unique] ON [tblClasses] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintBaseDateRanges_ConstraintID] ON [tblConstraintBaseDateRanges] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintCustomDatas_ConstraintID] ON [tblConstraintCustomDatas] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintCustomDatas_CustomDataID] ON [tblConstraintCustomDatas] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintCustomRanges_ConstraintID] ON [tblConstraintCustomRanges] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintDOWPs_ConstraintBaseDateRangeID] ON [tblConstraintDOWPs] ([ConstraintBaseDateRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintDOWPs_ConstraintCustomDataID] ON [tblConstraintDOWPs] ([ConstraintCustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintDOWPs_ConstraintCustomRangeID] ON [tblConstraintDOWPs] ([ConstraintCustomRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintDOWPs_ConstraintID] ON [tblConstraintDOWPs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintDOWPs_ConstraintSetValueID] ON [tblConstraintDOWPs] ([ConstraintSetValueID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintDOWPs_CustomDataID] ON [tblConstraintDOWPs] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintEMNWWAEs_ConstraintID] ON [tblConstraintEMNWWAEs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintEMNWWAEs_EmployeeAID] ON [tblConstraintEMNWWAEs] ([EmployeeAID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintEMNWWAEs_EmployeeBID] ON [tblConstraintEMNWWAEs] ([EmployeeBID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintEMWWAEs_ConstraintID] ON [tblConstraintEMWWAEs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintEMWWAEs_EmployeeAID] ON [tblConstraintEMWWAEs] ([EmployeeAID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintEMWWAEs_EmployeeBID] ON [tblConstraintEMWWAEs] ([EmployeeBID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNODOTWs_ConstraintBaseDateRangeID] ON [tblConstraintMNODOTWs] ([ConstraintBaseDateRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNODOTWs_ConstraintCustomDataID] ON [tblConstraintMNODOTWs] ([ConstraintCustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNODOTWs_ConstraintCustomRangeID] ON [tblConstraintMNODOTWs] ([ConstraintCustomRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintMNODOTWs_ConstraintID] ON [tblConstraintMNODOTWs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNODOTWs_ConstraintSetValueID] ON [tblConstraintMNODOTWs] ([ConstraintSetValueID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNODOTWs_CustomDataID] ON [tblConstraintMNODOTWs] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOHs_ConstraintBaseDateRangeID] ON [tblConstraintMNOHs] ([ConstraintBaseDateRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOHs_ConstraintCustomDataID] ON [tblConstraintMNOHs] ([ConstraintCustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOHs_ConstraintCustomRangeID] ON [tblConstraintMNOHs] ([ConstraintCustomRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintMNOHs_ConstraintID] ON [tblConstraintMNOHs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOHs_ConstraintSetValueID] ON [tblConstraintMNOHs] ([ConstraintSetValueID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOHs_CustomDataID] ON [tblConstraintMNOHs] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTCs_ConstraintCustomDataID] ON [tblConstraintMNOJTCs] ([ConstraintCustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintMNOJTCs_ConstraintID] ON [tblConstraintMNOJTCs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTCs_ConstraintSetValueID] ON [tblConstraintMNOJTCs] ([ConstraintSetValueID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTCs_CustomDataID] ON [tblConstraintMNOJTCs] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTCs_JobTypeID] ON [tblConstraintMNOJTCs] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTs_ConstraintBaseDateRangeID] ON [tblConstraintMNOJTs] ([ConstraintBaseDateRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTs_ConstraintCustomDataID] ON [tblConstraintMNOJTs] ([ConstraintCustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTs_ConstraintCustomRangeID] ON [tblConstraintMNOJTs] ([ConstraintCustomRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintMNOJTs_ConstraintID] ON [tblConstraintMNOJTs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTs_ConstraintSetValueID] ON [tblConstraintMNOJTs] ([ConstraintSetValueID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTs_CustomDataID] ON [tblConstraintMNOJTs] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTs_JobTypeID] ON [tblConstraintMNOJTs] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraints_ConstraintRuleID] ON [tblConstraints] ([ConstraintRuleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraints_ScheduleID] ON [tblConstraints] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintSetValues_ConstraintID] ON [tblConstraintSetValues] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintSSs_ConstraintCustomDataID] ON [tblConstraintSSs] ([ConstraintCustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintSSs_ConstraintID] ON [tblConstraintSSs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintSSs_ConstraintSetValueID] ON [tblConstraintSSs] ([ConstraintSetValueID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblConstraintSSs_CustomDataID] ON [tblConstraintSSs] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [CostCode_Name_Unique] ON [tblCostCodes] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblCustomDataLookups_CustomDataID] ON [tblCustomDataLookups] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblCustomDatas_CustomDataTypeID] ON [tblCustomDatas] ([CustomDataTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [CustomData_Name_Unique] ON [tblCustomDatas] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [CustomDataType_Name_Unique] ON [tblCustomDataTypes] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Department_Name_Unique] ON [tblDepartments] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Division_Name_Unique] ON [tblDivsions] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeAbsences_AbsenceCodeID] ON [tblEmployeeAbsences] ([AbsenceCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeAbsences_EmployeeID] ON [tblEmployeeAbsences] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeConstraints_ConstraintID] ON [tblEmployeeConstraints] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeConstraints_EmployeeID] ON [tblEmployeeConstraints] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeConstraints_JobID] ON [tblEmployeeConstraints] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeNotifications_AbsenceRequestID] ON [tblEmployeeNotifications] ([AbsenceRequestID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeNotifications_EmployeeID] ON [tblEmployeeNotifications] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_ClassID] ON [tblEmployees] ([ClassID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_CostCodeID] ON [tblEmployees] ([CostCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_DepartmentID] ON [tblEmployees] ([DepartmentID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_DivisionID] ON [tblEmployees] ([DivisionID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Employee_Email_Unique] ON [tblEmployees] ([Email]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [Employee_EmployeeNumber_Unique] ON [tblEmployees] ([EmployeeNumber]) WHERE [EmployeeNumber] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_GenderID] ON [tblEmployees] ([GenderID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_JobTitleID] ON [tblEmployees] ([JobTitleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_JobTypeID] ON [tblEmployees] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_LocationID] ON [tblEmployees] ([LocationID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_ManagerID] ON [tblEmployees] ([ManagerID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_NotificationTypeID] ON [tblEmployees] ([NotificationTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_ProfileID] ON [tblEmployees] ([ProfileID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_TargetRuleGroupID] ON [tblEmployees] ([TargetRuleGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_TeamID] ON [tblEmployees] ([TeamID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Employee_Username_Unique] ON [tblEmployees] ([Username]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployees_WorkRulesID] ON [tblEmployees] ([WorkRulesID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeesOwnTradeOffers_EmployeeID] ON [tblEmployeesOwnTradeOffers] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeesOwnTradeOffers_JobID] ON [tblEmployeesOwnTradeOffers] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeesTradeOffers_EmployeeID] ON [tblEmployeesTradeOffers] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeesTradeOffers_EmployeeOwnTradeOfferID] ON [tblEmployeesTradeOffers] ([EmployeeOwnTradeOfferID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeesTradeOffers_JobID] ON [tblEmployeesTradeOffers] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeSyncs_EmployeeID] ON [tblEmployeeSyncs] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeSyncs_JobID] ON [tblEmployeeSyncs] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblEmployeeSyncs_SyncID] ON [tblEmployeeSyncs] ([SyncID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Gender_Name_Unique] ON [tblGenders] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedJobs_InsertedTemplateID] ON [tblInsertedJobs] ([InsertedTemplateID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedJobs_JobID] ON [tblInsertedJobs] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedJobs_TemplateJobID] ON [tblInsertedJobs] ([TemplateJobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedSubGroups_InsertedTemplateID] ON [tblInsertedSubGroups] ([InsertedTemplateID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedSubGroups_ParentID] ON [tblInsertedSubGroups] ([ParentID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedSubGroups_SubGroupID] ON [tblInsertedSubGroups] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedSubGroups_TemplateSubGroupID] ON [tblInsertedSubGroups] ([TemplateSubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedTemplates_ScheduleID] ON [tblInsertedTemplates] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedTemplates_SubGroupID] ON [tblInsertedTemplates] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblInsertedTemplates_TemplateID] ON [tblInsertedTemplates] ([TemplateID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobAvailabilities_EmployeeID] ON [tblJobAvailabilities] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobAvailabilities_JobID] ON [tblJobAvailabilities] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobCustomDatas_CustomDataID] ON [tblJobCustomDatas] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobCustomDatas_CustomDataLookupID] ON [tblJobCustomDatas] ([CustomDataLookupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobCustomDatas_JobID] ON [tblJobCustomDatas] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobOffers_EmployeeID] ON [tblJobOffers] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobOffers_JobID] ON [tblJobOffers] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobOffers_JobOfferStatusID] ON [tblJobOffers] ([JobOfferStatusID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobOffers_UserID] ON [tblJobOffers] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobOffersForAutoAssigments_EmployeeID] ON [tblJobOffersForAutoAssigments] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobOffersForAutoAssigments_JobID] ON [tblJobOffersForAutoAssigments] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [JobOfferStatus_Name_Unique] ON [tblJobOfferStatuses] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobs_JobStatusID] ON [tblJobs] ([JobStatusID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobs_JobTypeID] ON [tblJobs] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobs_ShiftID] ON [tblJobs] ([ShiftID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobs_SubGroupID] ON [tblJobs] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobs_TemplateJobId] ON [tblJobs] ([TemplateJobId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [JobStatus_Name_Unique] ON [tblJobStatuses] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [JobTitle_Name_Unique] ON [tblJobTitles] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobTypeEssentialComparisonRules_CustomDataID] ON [tblJobTypeEssentialComparisonRules] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobTypeEssentialComparisonRules_JobTypeID] ON [tblJobTypeEssentialComparisonRules] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobTypeEssentialSkills_SkillCodeID] ON [tblJobTypeEssentialSkills] ([SkillCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobTypeNonEssentialComparisonRules_CustomDataID] ON [tblJobTypeNonEssentialComparisonRules] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobTypeNonEssentialComparisonRules_JobTypeID] ON [tblJobTypeNonEssentialComparisonRules] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobTypeNonEssentialSkills_SkillCodeID] ON [tblJobTypeNonEssentialSkills] ([SkillCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [JobType_Name_Unique] ON [tblJobTypes] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblJobTypes_TimeUnitID] ON [tblJobTypes] ([TimeUnitID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLinkInfo_AbsenceRequestID] ON [tblLinkInfo] ([AbsenceRequestID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLinkInfo_EmployeeId] ON [tblLinkInfo] ([EmployeeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLinkInfo_JobID] ON [tblLinkInfo] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLinkInfo_ScheduleId] ON [tblLinkInfo] ([ScheduleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLinkInfo_SubGroupId] ON [tblLinkInfo] ([SubGroupId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLinkInfo_UserId] ON [tblLinkInfo] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Locale_Name_Unique] ON [tblLocales] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Location_Name_Unique] ON [tblLocations] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLoneWorkerAlerts_EmployeeID] ON [tblLoneWorkerAlerts] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLoneWorkerAlerts_JobID] ON [tblLoneWorkerAlerts] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLoneWorkerCheckIns_EmployeeID] ON [tblLoneWorkerCheckIns] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLoneWorkerCheckIns_JobID] ON [tblLoneWorkerCheckIns] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLoneWorkerTransactionLogs_EmployeeID] ON [tblLoneWorkerTransactionLogs] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblLoneWorkerTransactionLogs_JobID] ON [tblLoneWorkerTransactionLogs] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblPanelPermissions_PermissionOptionID] ON [tblPanelPermissions] ([PermissionOptionID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblPanelPermissions_PermissionTypeID] ON [tblPanelPermissions] ([PermissionTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblPanelPermissions_ProfileID] ON [tblPanelPermissions] ([ProfileID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [PermissionType_Name_Unique] ON [tblPermissionTypes] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblProfile_AbsencePermissionsID] ON [tblProfile] ([AbsencePermissionsID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblProfile_EmployeePermissionsID] ON [tblProfile] ([EmployeePermissionsID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblProfile_ReportPermissionsID] ON [tblProfile] ([ReportPermissionsID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblProfile_SchedulePermissionsID] ON [tblProfile] ([SchedulePermissionsID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblProfile_SystemPermissionsID] ON [tblProfile] ([SystemPermissionsID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblPushNotification_EmployeeId] ON [tblPushNotification] ([EmployeeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblPushNotification_LinkInfoId] ON [tblPushNotification] ([LinkInfoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblPushNotification_UserId] ON [tblPushNotification] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblRankingRules_CustomDataID] ON [tblRankingRules] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblRankingRules_RestrictedToJobTypeID] ON [tblRankingRules] ([RestrictedToJobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblRankings_EmployeeID] ON [tblRankings] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblRankings_RankingRuleID] ON [tblRankings] ([RankingRuleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblRankings_RankingTypeID] ON [tblRankings] ([RankingTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblRankings_ScheduleID_Name] ON [tblRankings] ([ScheduleID], [Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblRecordsForTrade_JobAvailabilityID] ON [tblRecordsForTrade] ([JobAvailabilityID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblRecordsForTrade_OriginalAssignedEmployeeID] ON [tblRecordsForTrade] ([OriginalAssignedEmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblScheduleAssigmentsResults_ScheduleSyncRequestResultID] ON [tblScheduleAssigmentsResults] ([ScheduleSyncRequestResultID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblScheduleCustomDatas_CustomDataID] ON [tblScheduleCustomDatas] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblScheduleCustomDatas_CustomDataLookupID] ON [tblScheduleCustomDatas] ([CustomDataLookupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblScheduleCustomDatas_ScheduleID] ON [tblScheduleCustomDatas] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblScheduleDatePreferences_LocalesID] ON [tblScheduleDatePreferences] ([LocalesID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblScheduleMaxAndMinJobDate_ScheduleID] ON [tblScheduleMaxAndMinJobDate] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSchedulePreferences_LoneWorkerAdmin1ID] ON [tblSchedulePreferences] ([LoneWorkerAdmin1ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSchedulePreferences_LoneWorkerAdmin2ID] ON [tblSchedulePreferences] ([LoneWorkerAdmin2ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [Schedule_Name_Unique] ON [tblSchedules] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblScheduleSyncRequestResults_SyncID] ON [tblScheduleSyncRequestResults] ([SyncID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblShifts_ShiftsGroupId] ON [tblShifts] ([ShiftsGroupId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSkillMatrices_EmployeeID] ON [tblSkillMatrices] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSkillMatrices_SkillCodeID] ON [tblSkillMatrices] ([SkillCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSpecialDates_SpecialDateTypeID] ON [tblSpecialDates] ([SpecialDateTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [SpecialDateType_Name_Unique] ON [tblSpecialDateTypes] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroupCustomDatas_CustomDataID] ON [tblSubGroupCustomDatas] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroupCustomDatas_CustomDataLookupID] ON [tblSubGroupCustomDatas] ([CustomDataLookupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroupCustomDatas_SubGroupID] ON [tblSubGroupCustomDatas] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroups_AttendanceManager1ID] ON [tblSubGroups] ([AttendanceManager1ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroups_AttendanceManager2ID] ON [tblSubGroups] ([AttendanceManager2ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroups_LoneWorkerManager1ID] ON [tblSubGroups] ([LoneWorkerManager1ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroups_LoneWorkerManager2ID] ON [tblSubGroups] ([LoneWorkerManager2ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroups_ParentGroupID] ON [tblSubGroups] ([ParentGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroups_ScheduleID] ON [tblSubGroups] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroups_TemplateSubGroupId] ON [tblSubGroups] ([TemplateSubGroupId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroupsApprovals_ParentGroupID] ON [tblSubGroupsApprovals] ([ParentGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroupsApprovals_ScheduleID] ON [tblSubGroupsApprovals] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroupsApprovals_SubGroupID] ON [tblSubGroupsApprovals] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSubGroupsApprovals_UserId] ON [tblSubGroupsApprovals] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblSync_SyncStatusID] ON [tblSync] ([SyncStatusID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTargetRules_RestrictedJobTypeID] ON [tblTargetRules] ([RestrictedJobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTargetRules_TargetRuleConfigID] ON [tblTargetRules] ([TargetRuleConfigID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateBrokenRules_EmployeeID] ON [tblTemplateBrokenRules] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateBrokenRules_JobID] ON [tblTemplateBrokenRules] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateConstraintEMNWWAEs_EmployeeAID] ON [tblTemplateConstraintEMNWWAEs] ([EmployeeAID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateConstraintEMNWWAEs_EmployeeBID] ON [tblTemplateConstraintEMNWWAEs] ([EmployeeBID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblTemplateConstraintEMNWWAEs_TemplateConstraintID] ON [tblTemplateConstraintEMNWWAEs] ([TemplateConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateConstraintEMWWAEs_EmployeeAID] ON [tblTemplateConstraintEMWWAEs] ([EmployeeAID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateConstraintEMWWAEs_EmployeeBID] ON [tblTemplateConstraintEMWWAEs] ([EmployeeBID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblTemplateConstraintEMWWAEs_TemplateConstraintID] ON [tblTemplateConstraintEMWWAEs] ([TemplateConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateConstraints_TemplateConstraintRuleID] ON [tblTemplateConstraints] ([TemplateConstraintRuleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateConstraints_TemplateScheduleID] ON [tblTemplateConstraints] ([TemplateScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [IX_tblTemplateConstraintSetValues_TemplateConstraintID] ON [tblTemplateConstraintSetValues] ([TemplateConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateEmployeeConstraints_ConstraintID] ON [tblTemplateEmployeeConstraints] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateEmployeeConstraints_EmployeeID] ON [tblTemplateEmployeeConstraints] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateEmployeeConstraints_JobID] ON [tblTemplateEmployeeConstraints] ([JobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobAvailabilities_EmployeeID] ON [tblTemplateJobAvailabilities] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobAvailabilities_TemplateJobID] ON [tblTemplateJobAvailabilities] ([TemplateJobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobCustomDatas_CustomDataID] ON [tblTemplateJobCustomDatas] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobCustomDatas_CustomDataLookupID] ON [tblTemplateJobCustomDatas] ([CustomDataLookupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobCustomDatas_TemplateJobID] ON [tblTemplateJobCustomDatas] ([TemplateJobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobs_JobStatusID] ON [tblTemplateJobs] ([JobStatusID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobs_JobTypeID] ON [tblTemplateJobs] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobs_OriginalJobID] ON [tblTemplateJobs] ([OriginalJobID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobs_ShiftID] ON [tblTemplateJobs] ([ShiftID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateJobs_TemplateSubGroupID] ON [tblTemplateJobs] ([TemplateSubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateScheduleCustomDatas_CustomDataID] ON [tblTemplateScheduleCustomDatas] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateScheduleCustomDatas_CustomDataLookupID] ON [tblTemplateScheduleCustomDatas] ([CustomDataLookupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateScheduleCustomDatas_TemplateScheduleID] ON [tblTemplateScheduleCustomDatas] ([TemplateScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateScheduleMaxAndMinJobDate_TemplateScheduleID] ON [tblTemplateScheduleMaxAndMinJobDate] ([TemplateScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSchedules_TemplateID] ON [tblTemplateSchedules] ([TemplateID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroupCustomDatas_CustomDataID] ON [tblTemplateSubGroupCustomDatas] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroupCustomDatas_CustomDataLookupID] ON [tblTemplateSubGroupCustomDatas] ([CustomDataLookupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroupCustomDatas_TemplateSubGroupID] ON [tblTemplateSubGroupCustomDatas] ([TemplateSubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroups_AttendanceManager1ID] ON [tblTemplateSubGroups] ([AttendanceManager1ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroups_AttendanceManager2ID] ON [tblTemplateSubGroups] ([AttendanceManager2ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroups_LoneWorkerManager1ID] ON [tblTemplateSubGroups] ([LoneWorkerManager1ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroups_LoneWorkerManager2ID] ON [tblTemplateSubGroups] ([LoneWorkerManager2ID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroups_ParentGroupID] ON [tblTemplateSubGroups] ([ParentGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblTemplateSubGroups_ScheduleID] ON [tblTemplateSubGroups] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUnlockedSubGroups_SubGroupID] ON [tblUnlockedSubGroups] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUnlockedSubGroups_UnlockedRangeID] ON [tblUnlockedSubGroups] ([UnlockedRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserAbsences_AbsenceCodeID] ON [tblUserAbsences] ([AbsenceCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserAbsences_UserID] ON [tblUserAbsences] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_ClassID] ON [tblUserEmployeePermissions] ([ClassID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_CostCodeID] ON [tblUserEmployeePermissions] ([CostCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_DepartmentID] ON [tblUserEmployeePermissions] ([DepartmentID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_DivisionID] ON [tblUserEmployeePermissions] ([DivisionID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_JobTitleID] ON [tblUserEmployeePermissions] ([JobTitleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_LocationID] ON [tblUserEmployeePermissions] ([LocationID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_OrganisationFieldID] ON [tblUserEmployeePermissions] ([OrganisationFieldID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_TeamID] ON [tblUserEmployeePermissions] ([TeamID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserEmployeePermissions_UserID] ON [tblUserEmployeePermissions] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserImages_EmployeeID] ON [tblUserImages] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserImages_ImageSizeID] ON [tblUserImages] ([ImageSizeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserImages_UserID] ON [tblUserImages] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserNotifications_AbsenceRequestID] ON [tblUserNotifications] ([AbsenceRequestID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserNotifications_EmployeeID] ON [tblUserNotifications] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserNotifications_UserID] ON [tblUserNotifications] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [User_Email_Unique] ON [tblUsers] ([Email]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUsers_LinkedEmployeeID] ON [tblUsers] ([LinkedEmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUsers_LinkedEmployeeRightID] ON [tblUsers] ([LinkedEmployeeRightID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUsers_ProfileID] ON [tblUsers] ([ProfileID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE UNIQUE INDEX [User_Username_Unique] ON [tblUsers] ([Username]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserSchedulePermissions_ScheduleID] ON [tblUserSchedulePermissions] ([ScheduleID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserSchedulePermissions_ScheduleRightID] ON [tblUserSchedulePermissions] ([ScheduleRightID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserSchedulePermissions_SubGroupID] ON [tblUserSchedulePermissions] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserSchedulePermissions_UserID] ON [tblUserSchedulePermissions] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserShiftsPermission_ShiftsGroupId] ON [tblUserShiftsPermission] ([ShiftsGroupId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserShiftsPermission_UserId] ON [tblUserShiftsPermission] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserTemplatePermissions_ScheduleRightID] ON [tblUserTemplatePermissions] ([ScheduleRightID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserTemplatePermissions_TemplateID] ON [tblUserTemplatePermissions] ([TemplateID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    CREATE INDEX [IX_tblUserTemplatePermissions_UserID] ON [tblUserTemplatePermissions] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblAbsenceRequests] ADD CONSTRAINT [FK_tblAbsenceRequests_tblEmployeeAbsences_EmployeeAbsenceID] FOREIGN KEY ([EmployeeAbsenceID]) REFERENCES [tblEmployeeAbsences] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblAbsenceRequests] ADD CONSTRAINT [FK_tblAbsenceRequests_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblAbsenceRequests] ADD CONSTRAINT [FK_tblAbsenceRequests_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblEmployeeAbsences] ADD CONSTRAINT [FK_tblEmployeeAbsences_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblUserAbsences] ADD CONSTRAINT [FK_tblUserAbsences_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblEmployeeNotifications] ADD CONSTRAINT [FK_tblEmployeeNotifications_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblLinkInfo] ADD CONSTRAINT [FK_tblLinkInfo_tblEmployees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [tblEmployees] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblLinkInfo] ADD CONSTRAINT [FK_tblLinkInfo_tblUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblLinkInfo] ADD CONSTRAINT [FK_tblLinkInfo_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblLinkInfo] ADD CONSTRAINT [FK_tblLinkInfo_tblSubGroups_SubGroupId] FOREIGN KEY ([SubGroupId]) REFERENCES [tblSubGroups] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblUserNotifications] ADD CONSTRAINT [FK_tblUserNotifications_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblUserNotifications] ADD CONSTRAINT [FK_tblUserNotifications_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblAgencyJobAssignments] ADD CONSTRAINT [FK_tblAgencyJobAssignments_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblAgencyTemplateJobAssignments] ADD CONSTRAINT [FK_tblAgencyTemplateJobAssignments_tblTemplateJobs_TemplateJobID] FOREIGN KEY ([TemplateJobID]) REFERENCES [tblTemplateJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblEmployees] ADD CONSTRAINT [FK_tblEmployees_tblUsers_ManagerID] FOREIGN KEY ([ManagerID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblBrokenRules] ADD CONSTRAINT [FK_tblBrokenRules_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblEmployeeConstraints] ADD CONSTRAINT [FK_tblEmployeeConstraints_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblJobCustomDatas] ADD CONSTRAINT [FK_tblJobCustomDatas_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblTemplateJobCustomDatas] ADD CONSTRAINT [FK_tblTemplateJobCustomDatas_tblTemplateJobs_TemplateJobID] FOREIGN KEY ([TemplateJobID]) REFERENCES [tblTemplateJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblAttendanceConfirmations] ADD CONSTRAINT [FK_tblAttendanceConfirmations_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblEmployeesOwnTradeOffers] ADD CONSTRAINT [FK_tblEmployeesOwnTradeOffers_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblEmployeesTradeOffers] ADD CONSTRAINT [FK_tblEmployeesTradeOffers_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblEmployeeSyncs] ADD CONSTRAINT [FK_tblEmployeeSyncs_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblJobAvailabilities] ADD CONSTRAINT [FK_tblJobAvailabilities_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblJobOffers] ADD CONSTRAINT [FK_tblJobOffers_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblJobOffersForAutoAssigments] ADD CONSTRAINT [FK_tblJobOffersForAutoAssigments_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblLoneWorkerAlerts] ADD CONSTRAINT [FK_tblLoneWorkerAlerts_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblLoneWorkerCheckIns] ADD CONSTRAINT [FK_tblLoneWorkerCheckIns_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblLoneWorkerTransactionLogs] ADD CONSTRAINT [FK_tblLoneWorkerTransactionLogs_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblTemplateBrokenRules] ADD CONSTRAINT [FK_tblTemplateBrokenRules_tblTemplateJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblTemplateJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblTemplateEmployeeConstraints] ADD CONSTRAINT [FK_tblTemplateEmployeeConstraints_tblTemplateJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblTemplateJobs] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblTemplateJobAvailabilities] ADD CONSTRAINT [FK_tblTemplateJobAvailabilities_tblTemplateJobs_TemplateJobID] FOREIGN KEY ([TemplateJobID]) REFERENCES [tblTemplateJobs] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblInsertedJobs] ADD CONSTRAINT [FK_tblInsertedJobs_tblJobs_JobID] FOREIGN KEY ([JobID]) REFERENCES [tblJobs] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblInsertedJobs] ADD CONSTRAINT [FK_tblInsertedJobs_tblTemplateJobs_TemplateJobID] FOREIGN KEY ([TemplateJobID]) REFERENCES [tblTemplateJobs] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    ALTER TABLE [tblTemplateJobs] ADD CONSTRAINT [FK_tblTemplateJobs_tblJobs_OriginalJobID] FOREIGN KEY ([OriginalJobID]) REFERENCES [tblJobs] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220203095558_InitialCreateMigration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220203095558_InitialCreateMigration', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220210113151_Migration_V1')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'Password');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [Password] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220210113151_Migration_V1')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'OldPassword');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [OldPassword] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220210113151_Migration_V1')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Password');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Password] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220210113151_Migration_V1')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'OldPassword');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [OldPassword] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220210113151_Migration_V1')
BEGIN
    EXEC(N'UPDATE [tblSecurity] SET [MinimumNumericCharacters] = 1, [MinimumSpecialCharacters] = 1, [MinimumUpperCharacters] = 1
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220210113151_Migration_V1')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''A+0x1Jx1G9NYZOVP0h/PzfawtrBJlDwGo5y8l8Kr+/HiQEdkUAK3puuErNu/vwYNe1FH5uSHYpQPL+y0l8LO4lORggjjBGWCVblPX/mai7CJcVnS1aCmtd3OBXQKwoSCnTr9rN1c6lhUFWhbqCzXWOvECpQTym2dXbiAJKmyCMCc/q4E0AxuzMPhWD10EAAotDnWj53efSt6RmaMW6gLBs+6bEedKcOfij9EMRQDYyGc+oBbhwJuiYFf1aAAcQHdpvpYM7J0RL5y6/0EJwIaR+vtgQZIr/oE9HgAwYgqpn9dVDwVh0GLEBg61IZjj4fVuqkbl5lEo6NjdAFQu9ERFw==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220210113151_Migration_V1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220210113151_Migration_V1', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220224141457_Migration_V2')
BEGIN
    ALTER TABLE [tblUsers] ADD [AccessAllShifts] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220224141457_Migration_V2')
BEGIN
    EXEC(N'UPDATE [tblEmailSettings] SET [SmtpPassword] = N''a2xhc2lrYUsxMQ==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220224141457_Migration_V2')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''Sf47cMpbySaI15EO2eACIMXECsEyu0prG+TKMM3G4+2qo27h97TOKeoXH5KbpgFkvTQqr1WQrxrcqK11zA42LwVGBvoRcRKeb9Z+1/0GTzFVQ4C39wa8Juplm1qZMfQbxK46IuKq2IRIHl3xE3+nYC6AmnMB01wdkHWjIX3pwHYsYwbL+AFckJPQyNwwsmgWOpLv8Nez70QcumgVOW6kqFzF+pGfx+84HgCyEdfGjZkY9uJURraeWmjSOuldQu4hqFytAdqLGKyjQPQfWrwJJjYj5lW9MgKKoAvWryVVBcUT5zvnS+CdefYKf9aEMoM6ZvL/aWrT8viroj+5/O3Rjg==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220224141457_Migration_V2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220224141457_Migration_V2', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    ALTER TABLE [tblJobAvailabilities] ADD [MNOJTIME] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    CREATE TABLE [tblConstraintMNOJTIMEs] (
        [Id] bigint NOT NULL IDENTITY,
        [IsPayPeriod] bit NOT NULL,
        [IsMonth] bit NOT NULL,
        [IsWeek] bit NOT NULL,
        [ConstraintID] bigint NOT NULL,
        [CustomDataID] bigint NULL,
        [ConstraintSetValueID] bigint NULL,
        [ConstraintCustomDataID] bigint NULL,
        [ConstraintCustomRangeID] bigint NULL,
        [ConstraintBaseDateRangeID] bigint NULL,
        [JobStartFrom] bigint NULL,
        [JobStartTo] bigint NULL,
        [JobEndFrom] bigint NULL,
        [JobEndTo] bigint NULL,
        [MaxCount] int NOT NULL,
        CONSTRAINT [PK_tblConstraintMNOJTIMEs] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblConstraintMNOJTIMEs_tblConstraintBaseDateRanges_ConstraintBaseDateRangeID] FOREIGN KEY ([ConstraintBaseDateRangeID]) REFERENCES [tblConstraintBaseDateRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTIMEs_tblConstraintCustomDatas_ConstraintCustomDataID] FOREIGN KEY ([ConstraintCustomDataID]) REFERENCES [tblConstraintCustomDatas] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTIMEs_tblConstraintCustomRanges_ConstraintCustomRangeID] FOREIGN KEY ([ConstraintCustomRangeID]) REFERENCES [tblConstraintCustomRanges] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTIMEs_tblConstraints_ConstraintID] FOREIGN KEY ([ConstraintID]) REFERENCES [tblConstraints] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblConstraintMNOJTIMEs_tblConstraintSetValues_ConstraintSetValueID] FOREIGN KEY ([ConstraintSetValueID]) REFERENCES [tblConstraintSetValues] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblConstraintMNOJTIMEs_tblCustomDatas_CustomDataID] FOREIGN KEY ([CustomDataID]) REFERENCES [tblCustomDatas] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblConstraintRules]'))
        SET IDENTITY_INSERT [tblConstraintRules] ON;
    EXEC(N'INSERT INTO [tblConstraintRules] ([Id], [Name])
    VALUES (CAST(13 AS bigint), N''Maximum Number Of Job Times'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblConstraintRules]'))
        SET IDENTITY_INSERT [tblConstraintRules] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''QawYt8jm60LP/NAJQPQwO31oe4dTB164SAfTWiAMvvh9cPdVtlFUsa4VCqKU+LAwVmiWN3fWA8tKfxNAzUEFCA+c5e/24fGFKJd0kcqKGOl7sQ9ckLRy24270NC1b5lDYGeHrO4Y5h9ORH1NwwejnR/zdO2+p8C6VPF/gvxP0rZaDM2WZVuAEpAw7iEP4h2umCzL8508tmtCtK1+s72fAq/Nsqo8+zQCKNFfRlqPESLn6d4D3DZwOuK/DofDdUikm25cEztG85Xy58v6NQjsydvpk9pn4wQzUb2PcLilFnpg5ytaphU1WdR6plOStymxYpr3imPvqcXYkOgbrkAuWw==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTIMEs_ConstraintBaseDateRangeID] ON [tblConstraintMNOJTIMEs] ([ConstraintBaseDateRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTIMEs_ConstraintCustomDataID] ON [tblConstraintMNOJTIMEs] ([ConstraintCustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTIMEs_ConstraintCustomRangeID] ON [tblConstraintMNOJTIMEs] ([ConstraintCustomRangeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintMNOJTIMEs_ConstraintID] ON [tblConstraintMNOJTIMEs] ([ConstraintID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTIMEs_ConstraintSetValueID] ON [tblConstraintMNOJTIMEs] ([ConstraintSetValueID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    CREATE INDEX [IX_tblConstraintMNOJTIMEs_CustomDataID] ON [tblConstraintMNOJTIMEs] ([CustomDataID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307063741_Migration_V3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220307063741_Migration_V3', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307093302_Migration_V4')
BEGIN
    ALTER TABLE [tblTemplateJobs] ADD [Comment] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307093302_Migration_V4')
BEGIN
    ALTER TABLE [tblJobs] ADD [Comment] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307093302_Migration_V4')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''CB1qwsRyVE1VwOC/ap27EMNhaSvLDPG9sy4aLSK4a0S8WZB1ZVik2BopxXr78s7ARXreQlQRhQ+OrDHqijmA4pS/vg992LRajvkDlDAntOOgZUjXt0wygY1NpeHG/yl3tS6Ffuu5icTo4A3WHn/q1pqORGDx1U4ohcSwPR8U2D7UtUfZZLSfoJ+AUOFKUrDwoA+XWU/rHaPr8hBZlS5Nf+XP/h2UThYFSwvT0D4s505Wc0AyE6Mx0ANwuAqbiptb608erNKpX0JZGzrGdPqDD04GyCP5ShFHHReFtxbHDYfS1Z3YivXHR9GWfObBWj6sn9UkwomQk/t5mj8+ESIUgQ==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220307093302_Migration_V4')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220307093302_Migration_V4', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220310132313_Migration_V5')
BEGIN
    ALTER TABLE [tblCustomDatas] ADD [OrganisationFieldId] bigint NOT NULL DEFAULT CAST(0 AS bigint);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220310132313_Migration_V5')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CustomDataTypeID', N'Name', N'OrganisationFieldId') AND [object_id] = OBJECT_ID(N'[tblCustomDatas]'))
        SET IDENTITY_INSERT [tblCustomDatas] ON;
    EXEC(N'INSERT INTO [tblCustomDatas] ([CustomDataTypeID], [Name], [OrganisationFieldId])
    VALUES (CAST(3 AS bigint), N''Location'', CAST(1 AS bigint)),
    (CAST(3 AS bigint), N''Department'', CAST(2 AS bigint)),
    (CAST(3 AS bigint), N''Cost code'', CAST(3 AS bigint)),
    (CAST(3 AS bigint), N''Class'', CAST(4 AS bigint)),
    (CAST(3 AS bigint), N''Division'', CAST(5 AS bigint)),
    (CAST(3 AS bigint), N''Job title'', CAST(6 AS bigint)),
    (CAST(3 AS bigint), N''Team'', CAST(7 AS bigint))');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CustomDataTypeID', N'Name', N'OrganisationFieldId') AND [object_id] = OBJECT_ID(N'[tblCustomDatas]'))
        SET IDENTITY_INSERT [tblCustomDatas] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220310132313_Migration_V5')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''bHEWIBMyvem6aXUx3YyQlzhO4HxfFVF4qcUtx52ZEA7K/Ci3OJY3tHLhg5pjRAlTIxjOWkP9nnLOkzAJUPFWWAIycwo0ZRN3eRVuURYx4N3dREbHa989SCDh96o5xNGPAFN5PTrdKnlJvaX8Drz34SDAR3wPNHlPFKe324v6n7zvHWm/MB6SpNy1HMt6T+Bz1xPjtbqjazJUBBWanNdShZXGMQcJ8rVu+HEafXdQpzFqnfFGUG6PMhVGLREN69AhAKKwf7RYyL0wFR3APBFsPIaKp/bSm1mQvlWo2ewSO+h+UNKxTjJJ53h9l18xNp4C4Q3f9bpuJADU0BXNxovGcA==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220310132313_Migration_V5')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220310132313_Migration_V5', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220321095042_Migration_V6')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Address4');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Address4] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220321095042_Migration_V6')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Address3');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Address3] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220321095042_Migration_V6')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Address2');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Address2] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220321095042_Migration_V6')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Address1');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Address1] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220321095042_Migration_V6')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''Nh+dK36KLqSOpF0c3zlMdYjhD6QAaczvoLrbwMcrdEdQXcEI3a4cngq9zZ89+N1VB0MWnWTxPI5dW5Ao4mYg+PImIovrRvtcFyNoDWwzITaOcNCu8cxVyszYw0KHunxemq+pX5bd+QQiZRt236o5QVzIK16yDISDCGVcWNoYJUsAek+jCYF8vk4Vi54tlU5FYpYkm5dLpQjGReB6vfbg5nEg7eQel4jng9k4nC3g6mf4HCkMI1/FfwC20HRcC4AwLy0TQRKo3wPjqSvvHUBYygI7bwRPmRBG4F8/xK9rz9v9Rn6k9GcxgHmJtJByqz/4O57ha5Up+4aiirmjaDtRlg==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220321095042_Migration_V6')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220321095042_Migration_V6', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220322091540_Migration_V7')
BEGIN
    DROP INDEX [User_Email_Unique] ON [tblUsers];
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'Email');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [Email] nvarchar(128) NOT NULL;
    CREATE UNIQUE INDEX [User_Email_Unique] ON [tblUsers] ([Email]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220322091540_Migration_V7')
BEGIN
    DROP INDEX [Employee_Email_Unique] ON [tblEmployees];
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Email');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Email] nvarchar(128) NOT NULL;
    CREATE UNIQUE INDEX [Employee_Email_Unique] ON [tblEmployees] ([Email]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220322091540_Migration_V7')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''MJPeKPooZ6o8zoylvT+LBbRg2zqOrgy/t+6HiNWedl5ePuWGmThqbiQfKu2j0B8nBggCspxzaWNLJ+SOtnxmKv/Gbc64JVhlVXlHgTb5qufCE6kds+PDt1WUK7VO0hpm1yMglwXDmkaCjMnvzagB15q46QNdq1lmFOSW3qCjWV9iMtxTPzrfuXafDc/S2rnyf1z82g5MdYclzjP6x54YhoLRrNrEz7M+cmBYdDplg/FioQthmLzYUkSotR9YoBJyZyA59rag+HKMIkbADkrJK0fU9sEmTO+o4IE5aIkJgCpmb5fon7Ry/hpYZTJxxVsSA6xClH1CKirk6CcxeP4l4A==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220322091540_Migration_V7')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220322091540_Migration_V7', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220323101408_Migration_V8')
BEGIN
    ALTER TABLE [tblCustomDataLookups] ADD [IsEmployeeDataValue] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220323101408_Migration_V8')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''MH962PzbpumuuNwBbGZuQM4itCc1bt9g7yHCagv6L2i9O3rOMPv6pTEb+bs2YpsBsDPmyHJ9i2FDQ1jl1RH6fxG2HcJr3U7lmdXx7NQp/VBaDsoQ7j/2B3H7FfF5FRuobZ1CH2Qu2d9N8bsJPtkN/aSPXo8/H+V+oK6o/e6JtEEXyHh2jmWdEv0cLXnV3pnkKGGAobSdPDBxz5gspysZYkAG2f2rvlxzuEf2H4EDlrqNVRS/LVdMyQJsttFELwYMa0ZBsAEu6LmXbVsTNOrvrwok4Jwx+ulBBjpI9kotHSePSI70OSM0kqO+or8mlGlhT89TuHJEJh7EDKun0YFRPQ==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220323101408_Migration_V8')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220323101408_Migration_V8', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220330105245_Migration_V9')
BEGIN
    update tblCustomDatas set Name = 'Cost Code' where Name = 'Cost code' and CustomDataTypeID = (select Id from tblCustomDataTypes where Name = 'Lookup') update tblCustomDatas set Name = 'Job Title' where Name = 'Job title' and CustomDataTypeID = (select Id from tblCustomDataTypes where Name = 'Lookup')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220330105245_Migration_V9')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''WkjfU1yLK8C9f2Og+8QCJIZcE1HsWzPGAblpUn/0S44MPfcqHd8sR6lrVRYb3O5nP9YNTD+sIXlIQq+lVSl2JZV7hkqxwWEF14sM+ggTvh+9xj/EHwzzSqNcsarU2SXdM+DdBOf/NkdbB9V0H44WG7HndCEerQ1xeanfOnz2QNmOnl/lolutFvQlRoKxN4VndgML/uiDWmexS3AsFpWlV4CSgn4Gk9Ot7S29RIjLIbrZHMpt3fbD9AnH9Jj0+/tgIdFM9EvKuzoE2YfoOlPBELXYOod3qjAhFhAH2zv+eDiuQE4ekmwWQNep7PkEKlJuJR03ZASbbBph0crQbfE9iw==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220330105245_Migration_V9')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220330105245_Migration_V9', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220405065206_Migration_V10')
BEGIN
    ALTER TABLE [tblTemplates] ADD [CanBePublished] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220405065206_Migration_V10')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''ZTmDTUO97tHZlZCp+EAVp3Lc+OcPXpsFS9y5g7fpu0sBa0Gjtrb4i/471YM1xB6aNFmRgXS5d8cFRZqbQhebAvk9tCBqn9jDGatBIfihFwRfQmBm6UC4moe3RaxkVtp5oihzcVELeug10pPphKUUA9KsqnUwaeFv/AnX7Aedk/hNFsrdiHnxna2xrsjssDXA0XJ1jQyc/2sx69+wEmqVXokpZx2AlYgbZUPKmdElwTqJLL79tkQKvMDfpPANWPcErvtYSj3cGJ9zSChMZejyLd9ItbbGGZG7yGfd39D2tZAouwg9NwT0fxGBsUpoEzHb7SI1MLzloFVVBOCsNYLC/A==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220405065206_Migration_V10')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220405065206_Migration_V10', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408084436_Migration_V11')
BEGIN
    EXEC(N'DELETE FROM [tblAbsenceCodes]
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408084436_Migration_V11')
BEGIN
    EXEC(N'DELETE FROM [tblEmailSettings]
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408084436_Migration_V11')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblSuperAdmins]') AND [c].[name] = N'Email');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [tblSuperAdmins] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [tblSuperAdmins] DROP COLUMN [Email];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408084436_Migration_V11')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''BB+pbVXGKqKVVOaczv4/LH2Tgj0Cx1CJQ9U6PfcSy07aN86Yy5eJAu4vu5n7i0nsG3XSUONvByxC1lCO+iy9o9tSvhE9D+2nijC1fOYorcrt32zuzXktaYEg1lRlbHOR1MEzv5NOlHGglbFiAZ5zydFLAzkzfGy9yQO9cVz65DHwgsEVtnGqUO9GvlHw+sRnAoDO5nDF6EJKh6sxSSrlW9wgw+7L/l6hw6AyCqi1oKLgE+D706E3OdT4MqadT0CwDbKV9sagJERlfIotFXMA5Y4WBguYx1LoBbY4LbUmfP+t5W24aS28arM0PA30zSk8gjCdB+qS0W+IaW53P2Bwhw==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220408084436_Migration_V11')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220408084436_Migration_V11', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblAbsencePermissions]') AND [c].[name] = N'GenerateRequests');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [tblAbsencePermissions] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [tblAbsencePermissions] DROP COLUMN [GenerateRequests];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblTeams]') AND [c].[name] = N'Name');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [tblTeams] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [tblTeams] ALTER COLUMN [Name] nvarchar(100) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DROP INDEX [Location_Name_Unique] ON [tblLocations];
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblLocations]') AND [c].[name] = N'Name');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [tblLocations] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [tblLocations] ALTER COLUMN [Name] nvarchar(300) NOT NULL;
    CREATE UNIQUE INDEX [Location_Name_Unique] ON [tblLocations] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DROP INDEX [JobTitle_Name_Unique] ON [tblJobTitles];
    DECLARE @var14 sysname;
    SELECT @var14 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblJobTitles]') AND [c].[name] = N'Name');
    IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [tblJobTitles] DROP CONSTRAINT [' + @var14 + '];');
    ALTER TABLE [tblJobTitles] ALTER COLUMN [Name] nvarchar(100) NOT NULL;
    CREATE UNIQUE INDEX [JobTitle_Name_Unique] ON [tblJobTitles] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DECLARE @var15 sysname;
    SELECT @var15 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmailSettings]') AND [c].[name] = N'SmtpPassword');
    IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [tblEmailSettings] DROP CONSTRAINT [' + @var15 + '];');
    ALTER TABLE [tblEmailSettings] ALTER COLUMN [SmtpPassword] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DROP INDEX [Division_Name_Unique] ON [tblDivsions];
    DECLARE @var16 sysname;
    SELECT @var16 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblDivsions]') AND [c].[name] = N'Name');
    IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [tblDivsions] DROP CONSTRAINT [' + @var16 + '];');
    ALTER TABLE [tblDivsions] ALTER COLUMN [Name] nvarchar(100) NOT NULL;
    CREATE UNIQUE INDEX [Division_Name_Unique] ON [tblDivsions] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DROP INDEX [Department_Name_Unique] ON [tblDepartments];
    DECLARE @var17 sysname;
    SELECT @var17 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblDepartments]') AND [c].[name] = N'Name');
    IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [tblDepartments] DROP CONSTRAINT [' + @var17 + '];');
    ALTER TABLE [tblDepartments] ALTER COLUMN [Name] nvarchar(100) NOT NULL;
    CREATE UNIQUE INDEX [Department_Name_Unique] ON [tblDepartments] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DROP INDEX [CostCode_Name_Unique] ON [tblCostCodes];
    DECLARE @var18 sysname;
    SELECT @var18 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblCostCodes]') AND [c].[name] = N'Name');
    IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [tblCostCodes] DROP CONSTRAINT [' + @var18 + '];');
    ALTER TABLE [tblCostCodes] ALTER COLUMN [Name] nvarchar(100) NOT NULL;
    CREATE UNIQUE INDEX [CostCode_Name_Unique] ON [tblCostCodes] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    DROP INDEX [Class_Name_Unique] ON [tblClasses];
    DECLARE @var19 sysname;
    SELECT @var19 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblClasses]') AND [c].[name] = N'Name');
    IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [tblClasses] DROP CONSTRAINT [' + @var19 + '];');
    ALTER TABLE [tblClasses] ALTER COLUMN [Name] nvarchar(100) NOT NULL;
    CREATE UNIQUE INDEX [Class_Name_Unique] ON [tblClasses] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''Q3KfQnyyrhsevSTKg5ncE5YfQgebt7ResyxFYDHtjypA+N8cuxy6A408UaJn3jw52b4ng6yDJxsgNulDI9TuJIUs6R5N9Gaen8kBoZdWv6ySt62+BakAmasfjdzROsElb0T4Vl1Y6EkGBykXzZIKYRDGvpmCQJAysnL+ENe+3V9bOM3si/jb5QlZMBQHVITPBkiqwsAEspAcrn94mT6jSHshAcJllkDylHvGfKiguENAnZZT2LceM1mkq7Gl1wWb93460yHctdmQw0qb174bcUxMfeGI0lX3gKfsqm+YNNY0L9FX0g7ixIFAt3GTYzqvek05zP+o8PRSuzuKSv7m1w==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414054745_Migration_V12')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220414054745_Migration_V12', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414114904_Migration_V13')
BEGIN
    ALTER TABLE [tblJobs] ADD [CanBeResubmittedForApproval] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414114904_Migration_V13')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''EUm4cBkWPqeZF3VdaSsaSmkwnW726aKeHbTs778vLZylv488qwd+UQEi5hgVVATVPrTsAbH0efs+r4a07x1Ngyu6AEg1HrxzfWmFcgVxZ+ucNGg8EKTxmm1wXxbXmq3tqZVBUJYSkhG7N1ArpjT8D7t0TB272XeY+21IFWiWClNqS+QfAJLMu/jrohkc1yCijNCaUG0vY6EB6HD/o49kNMY5ptZIGpJ7SuxV9ftAy/tourklp5uXVfNbsOhoWgU5g0Qk48IdDwNgq0uyx9/M0yyYHT3MC89RrzzJM7QGLARSgHiGMJ4MOz4IkAGwnqjnSQFV0g7ZGIYhHphdwtvxoQ==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220414114904_Migration_V13')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220414114904_Migration_V13', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220421064528_Migration_V15')
BEGIN
    ALTER TABLE [tblJobAvailabilities] ADD [IsNotified] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220421064528_Migration_V15')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''SYlFlHt7kDwgQW70zCV3bCTVR1EXmcwmlcNPCv4DMKGlMdRZkeCxckBkFJfjU1aX/NEf4KyzdpPQcojT6z/MoKOwl4XUWq5wkH9PQcWZ20Xp0K0lLxmSS79/LkSdpXGUzLnUcLLN0PRyWGwhy1WzeEwqSzUda75uD0vWBvKkKmlGV9bThB4bJC/g6S17UDhNR1kjPbULMzYrONh+DWWY6g94rtGbpfEXaQlaX5JfAX3nTIiSUFfGDMEfqHcmtMOwuoD9zo8+nQVbA2DgxhQfkXXYQd+Qp68OL2GP/K2p0Hf3jA8Tz8A29n3qEOk+rIpeJA5CmfWxQI4Kd3s37DEqtw==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220421064528_Migration_V15')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220421064528_Migration_V15', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429052442_Migration_V16')
BEGIN
    DECLARE @var20 sysname;
    SELECT @var20 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'Password');
    IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var20 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [Password] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429052442_Migration_V16')
BEGIN
    DECLARE @var21 sysname;
    SELECT @var21 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'OldPassword');
    IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var21 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [OldPassword] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429052442_Migration_V16')
BEGIN
    DECLARE @var22 sysname;
    SELECT @var22 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Password');
    IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var22 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Password] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429052442_Migration_V16')
BEGIN
    DECLARE @var23 sysname;
    SELECT @var23 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'OldPassword');
    IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var23 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [OldPassword] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429052442_Migration_V16')
BEGIN
    EXEC(N'UPDATE [tblSecurity] SET [MinimumNumericCharacters] = 0, [MinimumSpecialCharacters] = 0, [MinimumUpperCharacters] = 0
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429052442_Migration_V16')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''be834cc0d15ab084a32c38487ef23f80ae5f6ac2cf07fb720f4e0f77fa18ad03''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220429052442_Migration_V16')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220429052442_Migration_V16', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    ALTER TABLE [tblJobsLocked] ADD [IsFromPublishTemplate] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    ALTER TABLE [tblJobAvailabilities] ADD [OriginalCompletelyValid] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    ALTER TABLE [tblJobAvailabilities] ADD [OriginalCompletelyValidUpdated] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    CREATE TABLE [tblJobsHistory] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [JobStartDateTime] datetime2 NOT NULL,
        [JobEndDateTime] datetime2 NOT NULL,
        [Hours] bigint NOT NULL,
        [ManualEditedHours] bit NOT NULL,
        [Hours1] bigint NOT NULL,
        [ManualEditedHours1] bit NOT NULL,
        [Hours2] bigint NOT NULL,
        [ManualEditedHours2] bit NOT NULL,
        [Hours3] bigint NOT NULL,
        [ManualEditedHours3] bit NOT NULL,
        [Hours4] bigint NOT NULL,
        [ManualEditedHours4] bit NOT NULL,
        [Hours5] bigint NOT NULL,
        [ManualEditedHours5] bit NOT NULL,
        [Hours6] bigint NOT NULL,
        [ManualEditedHours6] bit NOT NULL,
        [Notes] nvarchar(1000) NULL,
        [NoOfEmployeesRequired] int NOT NULL,
        [AllowedTrade] bit NOT NULL,
        [ManualEditedAllowedTrade] bit NOT NULL,
        [IsConcurrent] bit NOT NULL,
        [ReferenceArea] nvarchar(50) NULL,
        [SortOrder] int NULL,
        [IsCriticalTask] bit NOT NULL,
        [Approved] bit NOT NULL,
        [NumberOfValidAssigned] int NOT NULL,
        [NumberOfInvalidAssigned] int NOT NULL,
        [LoneWorkerJob] bit NOT NULL,
        [ManuallyEditedLoneWorkerJob] bit NOT NULL,
        [LoneWorkerRecurringIntervals] bigint NULL,
        [ManuallyEditedReccuringIntervals] bit NOT NULL,
        [LoneWorkerResponseWindow] bigint NULL,
        [ManuallyEditedResponseWindow] bit NOT NULL,
        [AttendanceConfirmation] bit NOT NULL,
        [ManuallyEditedAttendanceConfirmation] bit NOT NULL,
        [AttendanceTimeBeforeStart] bigint NULL,
        [ManuallyEditedAttendanceTimeBeforeStart] bit NOT NULL,
        [AttendanceResponseWindow] bigint NULL,
        [ManuallyEditedAttendanceResponseWindow] bit NOT NULL,
        [Comment] nvarchar(50) NULL,
        [CanBeResubmittedForApproval] bit NOT NULL,
        [SubGroupID] bigint NOT NULL,
        [JobTypeID] bigint NOT NULL,
        [JobStatusID] bigint NOT NULL,
        [ShiftID] bigint NULL,
        [JobId] bigint NOT NULL,
        CONSTRAINT [PK_tblJobsHistory] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobsHistory_tblJobs_JobId] FOREIGN KEY ([JobId]) REFERENCES [tblJobs] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblJobsHistory_tblJobStatuses_JobStatusID] FOREIGN KEY ([JobStatusID]) REFERENCES [tblJobStatuses] ([Id]),
        CONSTRAINT [FK_tblJobsHistory_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]),
        CONSTRAINT [FK_tblJobsHistory_tblShifts_ShiftID] FOREIGN KEY ([ShiftID]) REFERENCES [tblShifts] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblJobsHistory_tblSubGroups_SubGroupID] FOREIGN KEY ([SubGroupID]) REFERENCES [tblSubGroups] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''MtEJ0dPFPzkEhLM/uYzHVnDm7J6wepCwOh0gLY6t8v3a81JAGeNkXj5ABbb/UgqzmWLrhAY1BzK+MVewQwWzNxZGp5DgVvg2GMiYdJ0kxC2I9RRv6t5DQ8xLEv/UdcbP+RZzv9Lbp90G8y654tcwOmipGABAWiyayO2CLKUNvfYhqCHPEOlVvzLPNeVnwhWszLvGME1mKczDyD1JcGmkmxp6QDENhxjVQZ5uorCcotNg8XV5Byj9en0GdlCn4ZJXKSDf2HVvlOaMSqGQGE+sJQumdZxRz2G3x6KvfPH6Qn1AINns/2vKxpX+YPW7jSIb0gmTzAk9xaksU2iLhnamRw==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    CREATE INDEX [IX_tblJobsHistory_JobId] ON [tblJobsHistory] ([JobId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    CREATE INDEX [IX_tblJobsHistory_JobStatusID] ON [tblJobsHistory] ([JobStatusID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    CREATE INDEX [IX_tblJobsHistory_JobTypeID] ON [tblJobsHistory] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    CREATE INDEX [IX_tblJobsHistory_ShiftID] ON [tblJobsHistory] ([ShiftID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    CREATE INDEX [IX_tblJobsHistory_SubGroupID] ON [tblJobsHistory] ([SubGroupID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504113604_Migration_V17')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220504113604_Migration_V17', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    ALTER TABLE [tblCustomDatas] DROP CONSTRAINT [FK_tblCustomDatas_tblCustomDataTypes_CustomDataTypeID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    DECLARE @var24 sysname;
    SELECT @var24 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblCustomDatas]') AND [c].[name] = N'OrganisationFieldId');
    IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [tblCustomDatas] DROP CONSTRAINT [' + @var24 + '];');
    ALTER TABLE [tblCustomDatas] ALTER COLUMN [OrganisationFieldId] bigint NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    Update [tblCustomDatas] Set OrganisationFieldId = null Where OrganisationFieldId = 0
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''ElgOJVHhmMAkzKJfmzPYjYEsZjpo3FO5wjn2JpLKfLMqsI2Be6HONujnQfUfJAT84AnHI7ZufMhHLJ9bKld3uv3UP0ly5ju3HKjQ2kwjvB9t0RTVUTpMaKQVL952cPbjsbYy2KmTGcOv2vbxymdzbkLGrwoexDuVgsHzJPpz8hZwNvFNpGKhHJG91I5keGHrsFdJQ6jQM0y3JCqcGg7t5XcRP6uSeSBMAuQyXUKCbVkhjETwjAFMeTceVBBTxWarDIKCh+B3tql+eZXVx5ReY0L10KELugU4Pp0NOdOV3ownLAaS3ss7Sv+XseHccVzDn8QiHO1ahwzyBbJp3KXM9Q==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    CREATE INDEX [IX_tblCustomDatas_OrganisationFieldId] ON [tblCustomDatas] ([OrganisationFieldId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    ALTER TABLE [tblCustomDatas] ADD CONSTRAINT [FK_tblCustomDatas_tblCustomDataTypes_CustomDataTypeID] FOREIGN KEY ([CustomDataTypeID]) REFERENCES [tblCustomDataTypes] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    ALTER TABLE [tblCustomDatas] ADD CONSTRAINT [FK_tblCustomDatas_tblOrganisationFields_OrganisationFieldId] FOREIGN KEY ([OrganisationFieldId]) REFERENCES [tblOrganisationFields] ([Id]) ON DELETE SET NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513103135_Migration_V18')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220513103135_Migration_V18', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513112018_Migration_V19')
BEGIN
    CREATE TABLE [tblEmployeeLocations] (
        [Id] bigint NOT NULL IDENTITY,
        [EmployeeId] bigint NOT NULL,
        [LocationId] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeeLocations] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeeLocations_tblEmployees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_tblEmployeeLocations_tblLocations_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [tblLocations] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513112018_Migration_V19')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''WSi2/qFrHERR7Thez6ZRx3oummWpi9Dg9KYeJhINlsse5HaC2ZAyXOSHdJkb63uw2kQ5OXZDUX7+j3kw9W2RQSK/t15lRIkLs8KGJ2PRjTllmKwLZHMT2goE1gPz8Ryr3IVpMZC3mTpdH7Pz4H7ou7V6jiJ4YEKKe926JV6s4TvgWfGBZnen3V+hbBsNg0vq4Eo8w6XbQmsAy5CAaqpbOYxvCUsYYyj0MGtaeExHqRAXiuZVUEM6yCCN0ClV8Ce5vOU2w1ciUqvKqNtCar4uAnaS62r08vawqrqgWar9Tjm2PfZpvf63K6JLRtk/HzwcmofbdoeYGoHZV5XnNy63sw==''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513112018_Migration_V19')
BEGIN
    CREATE INDEX [IX_tblEmployeeLocations_EmployeeId] ON [tblEmployeeLocations] ([EmployeeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513112018_Migration_V19')
BEGIN
    CREATE INDEX [IX_tblEmployeeLocations_LocationId] ON [tblEmployeeLocations] ([LocationId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220513112018_Migration_V19')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220513112018_Migration_V19', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220514090849_Migration_V20')
BEGIN
    DECLARE @var25 sysname;
    SELECT @var25 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'Password');
    IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var25 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [Password] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220514090849_Migration_V20')
BEGIN
    DECLARE @var26 sysname;
    SELECT @var26 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'OldPassword');
    IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var26 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [OldPassword] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220514090849_Migration_V20')
BEGIN
    DECLARE @var27 sysname;
    SELECT @var27 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'Password');
    IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var27 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [Password] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220514090849_Migration_V20')
BEGIN
    DECLARE @var28 sysname;
    SELECT @var28 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'OldPassword');
    IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var28 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [OldPassword] nvarchar(256) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220514090849_Migration_V20')
BEGIN
    EXEC(N'UPDATE [tblSecurity] SET [MinimumNumericCharacters] = 1, [MinimumSpecialCharacters] = 1, [MinimumUpperCharacters] = 1
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220514090849_Migration_V20')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''be834cc0d15ab084a32c38487ef23f80ae5f6ac2cf07fb720f4e0f77fa18ad03''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220514090849_Migration_V20')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220514090849_Migration_V20', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516090622_Migration_V22')
BEGIN
    CREATE TABLE [tblRankingComparisonValues] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [RankingID] bigint NOT NULL,
        CONSTRAINT [PK_tblRankingComparisonValues] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblRankingComparisonValues_tblRankings_RankingID] FOREIGN KEY ([RankingID]) REFERENCES [tblRankings] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516090622_Migration_V22')
BEGIN
    CREATE INDEX [IX_tblRankingComparisonValues_RankingID] ON [tblRankingComparisonValues] ([RankingID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220516090622_Migration_V22')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220516090622_Migration_V22', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518054016_Migration_V21')
BEGIN
    CREATE TABLE [tblEmployeeLocationViaIntegration] (
        [Id] bigint NOT NULL IDENTITY,
        [EmployeeId] bigint NOT NULL,
        [LocationId] bigint NOT NULL,
        [EmployeeLocationId] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeeLocationViaIntegration] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblEmployeeLocationViaIntegration_tblEmployeeLocations_EmployeeLocationId] FOREIGN KEY ([EmployeeLocationId]) REFERENCES [tblEmployeeLocations] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518054016_Migration_V21')
BEGIN
    CREATE INDEX [IX_tblEmployeeLocationViaIntegration_EmployeeLocationId] ON [tblEmployeeLocationViaIntegration] ([EmployeeLocationId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518054016_Migration_V21')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220518054016_Migration_V21', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518131115_Migration_V23')
BEGIN
    CREATE TABLE [tblJobTypeEssentialComparisonRuleTextValues] (
        [Id] bigint NOT NULL IDENTITY,
        [LocationTextValue] nvarchar(max) NULL,
        [JobTypeEssentialComparisonRuleId] bigint NOT NULL,
        CONSTRAINT [PK_tblJobTypeEssentialComparisonRuleTextValues] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobTypeEssentialComparisonRuleTextValues_tblJobTypeEssentialComparisonRules_JobTypeEssentialComparisonRuleId] FOREIGN KEY ([JobTypeEssentialComparisonRuleId]) REFERENCES [tblJobTypeEssentialComparisonRules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518131115_Migration_V23')
BEGIN
    CREATE TABLE [tblJobTypeNonEssentialComparisonRuleTextValues] (
        [Id] bigint NOT NULL IDENTITY,
        [LocationTextValue] nvarchar(max) NULL,
        [JobTypeNonEssentialComparisonRuleId] bigint NOT NULL,
        CONSTRAINT [PK_tblJobTypeNonEssentialComparisonRuleTextValues] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblJobTypeNonEssentialComparisonRuleTextValues_tblJobTypeNonEssentialComparisonRules_JobTypeNonEssentialComparisonRuleId] FOREIGN KEY ([JobTypeNonEssentialComparisonRuleId]) REFERENCES [tblJobTypeNonEssentialComparisonRules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518131115_Migration_V23')
BEGIN
    CREATE INDEX [IX_tblJobTypeEssentialComparisonRuleTextValues_JobTypeEssentialComparisonRuleId] ON [tblJobTypeEssentialComparisonRuleTextValues] ([JobTypeEssentialComparisonRuleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518131115_Migration_V23')
BEGIN
    CREATE INDEX [IX_tblJobTypeNonEssentialComparisonRuleTextValues_JobTypeNonEssentialComparisonRuleId] ON [tblJobTypeNonEssentialComparisonRuleTextValues] ([JobTypeNonEssentialComparisonRuleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220518131115_Migration_V23')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220518131115_Migration_V23', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V24')
BEGIN
    DROP TABLE [tblLicences];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V24')
BEGIN
    DECLARE @var29 sysname;
    SELECT @var29 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblSystemPermissions]') AND [c].[name] = N'SystemLicence');
    IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [tblSystemPermissions] DROP CONSTRAINT [' + @var29 + '];');
    ALTER TABLE [tblSystemPermissions] DROP COLUMN [SystemLicence];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V24')
BEGIN
    ALTER TABLE [tblSystemPermissions] ADD [License] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V24')
BEGIN
    CREATE TABLE [tblLicenses] (
        [Id] bigint NOT NULL IDENTITY,
        [InstallationID] nvarchar(64) NOT NULL,
        [CustomerBusinessID] nvarchar(max) NULL,
        [RosteringVersion] nvarchar(30) NULL,
        [MaxNumberOfAutoRosteringLicense] int NOT NULL,
        [ExpiryDate] datetime2 NOT NULL,
        CONSTRAINT [PK_tblLicenses] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V24')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] ON;
    EXEC(N'INSERT INTO [tblPermissionTypes] ([Id], [Name])
    VALUES (CAST(7 AS bigint), N''License'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V24')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220613092541_Migration_V24', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V25')
BEGIN
    DROP INDEX IX_tblConstraintSetValues_ConstraintID ON [dbo].[tblConstraintSetValues];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V25')
BEGIN
    CREATE UNIQUE INDEX [IX_tblConstraintSetValues_Id_ConstraintID] ON [tblConstraintSetValues] ([ConstraintID], [Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220613092541_Migration_V25')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220613092541_Migration_V25', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220620061351_Migration_V26')
BEGIN
    ALTER TABLE [tblEmployees] DROP CONSTRAINT [FK_tblEmployees_tblLocations_LocationID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220620061351_Migration_V26')
BEGIN
    DROP INDEX [IX_tblEmployees_LocationID] ON [tblEmployees];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220620061351_Migration_V26')
BEGIN
    DECLARE @var30 sysname;
    SELECT @var30 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'LocationID');
    IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var30 + '];');
    ALTER TABLE [tblEmployees] DROP COLUMN [LocationID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220620061351_Migration_V26')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220620061351_Migration_V26', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220620170815_Migration_V27')
BEGIN
    ALTER TABLE [tblSuperAdmins] ADD [ApiKey] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220620170815_Migration_V27')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220620170815_Migration_V27', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220622071831_Migration_V28')
BEGIN
    DECLARE @var31 sysname;
    SELECT @var31 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblLicenses]') AND [c].[name] = N'RosteringVersion');
    IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [tblLicenses] DROP CONSTRAINT [' + @var31 + '];');
    ALTER TABLE [tblLicenses] DROP COLUMN [RosteringVersion];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220622071831_Migration_V28')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220622071831_Migration_V28', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220622072242_Migration_V31')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [Password] = N''$2a$11$h1kkD4qFQXtZPxgY1a0E/uvQaPirICnDWyMdQQIM3AfnfoaSNib6m''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220622072242_Migration_V31')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220622072242_Migration_V31', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220627103621_Migration_V29')
BEGIN
    ALTER TABLE [tblSchedulePermissions] ADD [AllowsOverridingJobs] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220627103621_Migration_V29')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220627103621_Migration_V29', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220629113304_Migration_V30')
BEGIN
    ALTER TABLE [tblTemplateBrokenRules] ADD [User] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220629113304_Migration_V30')
BEGIN
    ALTER TABLE [tblBrokenRules] ADD [User] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220629113304_Migration_V30')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220629113304_Migration_V30', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220704124426_Migration_V33')
BEGIN
    ALTER TABLE [tblEmployees] ADD [WeeklyHours] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220704124426_Migration_V33')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220704124426_Migration_V33', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220704130138_Migration_V32')
BEGIN
    DECLARE @var32 sysname;
    SELECT @var32 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblSchedulePermissions]') AND [c].[name] = N'AllowsOverridingJobs');
    IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [tblSchedulePermissions] DROP CONSTRAINT [' + @var32 + '];');
    ALTER TABLE [tblSchedulePermissions] DROP COLUMN [AllowsOverridingJobs];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220704130138_Migration_V32')
BEGIN
    ALTER TABLE [tblSchedulePermissions] ADD [AllowOverlappingAssignments] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220704130138_Migration_V32')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220704130138_Migration_V32', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220712094723_Migration_V34')
BEGIN
    ALTER TABLE [tblTemplateJobAvailabilities] ADD [UserWhoHasAssigned] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220712094723_Migration_V34')
BEGIN
    ALTER TABLE [tblJobAvailabilities] ADD [UserWhoHasAssigned] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220712094723_Migration_V34')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220712094723_Migration_V34', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220720045927_Migration_V35')
BEGIN
    DECLARE @var33 sysname;
    SELECT @var33 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblConstraintMNOJTCs]') AND [c].[name] = N'IncludeAllJobTypes');
    IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [tblConstraintMNOJTCs] DROP CONSTRAINT [' + @var33 + '];');
    ALTER TABLE [tblConstraintMNOJTCs] DROP COLUMN [IncludeAllJobTypes];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220720045927_Migration_V35')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220720045927_Migration_V35', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722040542_Migration_V38')
BEGIN
    ALTER TABLE [tblSuperAdmins] ADD [EmailAddress] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722040542_Migration_V38')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220722040542_Migration_V38', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220726070945_Migration_V37')
BEGIN
    CREATE TABLE [tblEmployeeSchedHrsStatuses] (
        [Id] bigint NOT NULL IDENTITY,
        [Name] nvarchar(100) NOT NULL,
        [PrimaryColor] nvarchar(9) NULL,
        [SecondaryColor] nvarchar(9) NULL,
        [Description] nvarchar(1000) NULL,
        CONSTRAINT [PK_tblEmployeeSchedHrsStatuses] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220726070945_Migration_V37')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblEmployeeSchedHrsStatuses]'))
        SET IDENTITY_INSERT [tblEmployeeSchedHrsStatuses] ON;
    EXEC(N'INSERT INTO [tblEmployeeSchedHrsStatuses] ([Id], [Description], [Name], [PrimaryColor], [SecondaryColor])
    VALUES (CAST(1 AS bigint), N''This is when Employee Scheduled Hours are Greater than Planned Hours.'', N''Scheduled Hours Greater than Planned Hours'', N''#DC3545'', N''#DC3545'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblEmployeeSchedHrsStatuses]'))
        SET IDENTITY_INSERT [tblEmployeeSchedHrsStatuses] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220726070945_Migration_V37')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblEmployeeSchedHrsStatuses]'))
        SET IDENTITY_INSERT [tblEmployeeSchedHrsStatuses] ON;
    EXEC(N'INSERT INTO [tblEmployeeSchedHrsStatuses] ([Id], [Description], [Name], [PrimaryColor], [SecondaryColor])
    VALUES (CAST(2 AS bigint), N''This is when Employee Scheduled Hours are less than Planned Hours.'', N''Scheduled Hours less than Planned Hours'', N''#458045'', N''#458045'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblEmployeeSchedHrsStatuses]'))
        SET IDENTITY_INSERT [tblEmployeeSchedHrsStatuses] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220726070945_Migration_V37')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblEmployeeSchedHrsStatuses]'))
        SET IDENTITY_INSERT [tblEmployeeSchedHrsStatuses] ON;
    EXEC(N'INSERT INTO [tblEmployeeSchedHrsStatuses] ([Id], [Description], [Name], [PrimaryColor], [SecondaryColor])
    VALUES (CAST(3 AS bigint), N''This is when Employee Scheduled Hours are Equal to Planned Hours.'', N''Scheduled Hours Equal to Planned Hours'', N''#F2A900'', N''#F2A900'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name', N'PrimaryColor', N'SecondaryColor') AND [object_id] = OBJECT_ID(N'[tblEmployeeSchedHrsStatuses]'))
        SET IDENTITY_INSERT [tblEmployeeSchedHrsStatuses] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220726070945_Migration_V37')
BEGIN
    CREATE UNIQUE INDEX [EmployeeSchedHrsStatus_Name_Unique] ON [tblEmployeeSchedHrsStatuses] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220726070945_Migration_V37')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220726070945_Migration_V37', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220727091833_Migration_V36')
BEGIN
    CREATE TABLE [tblSkillMatrixSearches] (
        [Id] bigint NOT NULL IDENTITY,
        [ColumnPage] int NOT NULL,
        [ColumnLimit] int NOT NULL,
        [IsEmployee] bit NOT NULL,
        [Page] int NOT NULL,
        [Limit] int NOT NULL,
        [SortOrder] nvarchar(4) NOT NULL,
        [AreRowsSwapped] bit NOT NULL,
        [UserID] bigint NULL,
        CONSTRAINT [PK_tblSkillMatrixSearches] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSkillMatrixSearches_tblUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220727091833_Migration_V36')
BEGIN
    CREATE TABLE [tblSkillMatrixFilterSearches] (
        [Id] bigint NOT NULL IDENTITY,
        [SkillCodeID] bigint NULL,
        [JobTypeID] bigint NULL,
        [SkillMatrixSearchID] bigint NOT NULL,
        CONSTRAINT [PK_tblSkillMatrixFilterSearches] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_tblSkillMatrixFilterSearches_tblJobTypes_JobTypeID] FOREIGN KEY ([JobTypeID]) REFERENCES [tblJobTypes] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSkillMatrixFilterSearches_tblSkillCodes_SkillCodeID] FOREIGN KEY ([SkillCodeID]) REFERENCES [tblSkillCodes] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_tblSkillMatrixFilterSearches_tblSkillMatrixSearches_SkillMatrixSearchID] FOREIGN KEY ([SkillMatrixSearchID]) REFERENCES [tblSkillMatrixSearches] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220727091833_Migration_V36')
BEGIN
    CREATE INDEX [IX_tblSkillMatrixFilterSearches_JobTypeID] ON [tblSkillMatrixFilterSearches] ([JobTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220727091833_Migration_V36')
BEGIN
    CREATE INDEX [IX_tblSkillMatrixFilterSearches_SkillCodeID] ON [tblSkillMatrixFilterSearches] ([SkillCodeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220727091833_Migration_V36')
BEGIN
    CREATE INDEX [IX_tblSkillMatrixFilterSearches_SkillMatrixSearchID] ON [tblSkillMatrixFilterSearches] ([SkillMatrixSearchID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220727091833_Migration_V36')
BEGIN
    CREATE INDEX [IX_tblSkillMatrixSearches_UserID] ON [tblSkillMatrixSearches] ([UserID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220727091833_Migration_V36')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220727091833_Migration_V36', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220908130236_Migration_V39')
BEGIN
    EXEC(N'UPDATE [tblEmployeeSchedHrsStatuses] SET [Name] = N''Scheduled hours greater than Planned hours (Over rostered)''
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220908130236_Migration_V39')
BEGIN
    EXEC(N'UPDATE [tblEmployeeSchedHrsStatuses] SET [Description] = N''This is when Employee Scheduled Hours are Lesser than Planned Hours.'', [Name] = N''Scheduled hours lesser than Planned hours (Under rostered)''
    WHERE [Id] = CAST(2 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220908130236_Migration_V39')
BEGIN
    EXEC(N'UPDATE [tblEmployeeSchedHrsStatuses] SET [Name] = N''Scheduled hours equal to Planned hours (Rostered hours filled)''
    WHERE [Id] = CAST(3 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220908130236_Migration_V39')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220908130236_Migration_V39', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220913165724_Migration_V40')
BEGIN
    ALTER TABLE [tblSystemPermissions] ADD [EmployeeAvailability] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220913165724_Migration_V40')
BEGIN
    CREATE TABLE [tblEmployeeAvailability] (
        [Id] bigint NOT NULL IDENTITY,
        [DayOfWeek] nvarchar(max) NULL,
        [StartTime] nvarchar(50) NULL,
        [EndTime] nvarchar(50) NULL,
        [EmployeeId] bigint NOT NULL,
        CONSTRAINT [PK_tblEmployeeAvailability] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220913165724_Migration_V40')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220913165724_Migration_V40', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220922100502_Migration_V41')
BEGIN
    DECLARE @var34 sysname;
    SELECT @var34 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployeeAvailability]') AND [c].[name] = N'StartTime');
    IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployeeAvailability] DROP CONSTRAINT [' + @var34 + '];');
    ALTER TABLE [tblEmployeeAvailability] ALTER COLUMN [StartTime] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220922100502_Migration_V41')
BEGIN
    DECLARE @var35 sysname;
    SELECT @var35 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployeeAvailability]') AND [c].[name] = N'EndTime');
    IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployeeAvailability] DROP CONSTRAINT [' + @var35 + '];');
    ALTER TABLE [tblEmployeeAvailability] ALTER COLUMN [EndTime] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220922100502_Migration_V41')
BEGIN
    CREATE TABLE [tblAuditTrail] (
        [Id] bigint NOT NULL IDENTITY,
        [OperationDateTime] datetime2 NULL,
        [UserName] nvarchar(200) NULL,
        [FunctionName] nvarchar(200) NULL,
        [FunctionDetails] nvarchar(max) NULL,
        [Operation] nvarchar(10) NULL,
        [PreviousValue] nvarchar(max) NULL,
        [CurrentValue] nvarchar(max) NULL,
        CONSTRAINT [PK_tblAuditTrail] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220922100502_Migration_V41')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220922100502_Migration_V41', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220929091334_Migration_V42')
BEGIN
    ALTER TABLE [tblSchedulePreferences] ADD [AutoSolveAsPermission] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220929091334_Migration_V42')
BEGIN
    ALTER TABLE [tblSchedulePermissions] ADD [AutoSolve] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220929091334_Migration_V42')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220929091334_Migration_V42', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220930115808_Migration_V43')
BEGIN
    ALTER TABLE [tblAuditTrail] ADD [FunctionId] bigint NOT NULL DEFAULT CAST(0 AS bigint);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220930115808_Migration_V43')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220930115808_Migration_V43', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220930163743_Migration_V44')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblConstraintRules]'))
        SET IDENTITY_INSERT [tblConstraintRules] ON;
    EXEC(N'INSERT INTO [tblConstraintRules] ([Id], [Name])
    VALUES (CAST(14 AS bigint), N''Employee Availability'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[tblConstraintRules]'))
        SET IDENTITY_INSERT [tblConstraintRules] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220930163743_Migration_V44')
BEGIN
    ALTER TABLE [tblJobAvailabilities] ADD [EmployeeAvailability] bit NOT NULL DEFAULT CAST(1 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220930163743_Migration_V44')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220930163743_Migration_V44', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221010064532_Migration_V45')
BEGIN
    DECLARE @var36 sysname;
    SELECT @var36 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblSystemPermissions]') AND [c].[name] = N'EmployeeAvailability');
    IF @var36 IS NOT NULL EXEC(N'ALTER TABLE [tblSystemPermissions] DROP CONSTRAINT [' + @var36 + '];');
    ALTER TABLE [tblSystemPermissions] DROP COLUMN [EmployeeAvailability];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221010064532_Migration_V45')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [Name] = N''Employee Availability''
    WHERE [Id] = CAST(7 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221010064532_Migration_V45')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221010064532_Migration_V45', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221012052927_Migration_V46')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [Name] = N''Availability''
    WHERE [Id] = CAST(7 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221012052927_Migration_V46')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221012052927_Migration_V46', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221028112647_Migration_V47')
BEGIN
    delete t1 from tblJobTypeNonEssentialSkills t1 join tblJobTypeEssentialSkills t2 on t1.JobTypeID = t2.JobTypeID where t1.SkillCodeID = t2.SkillCodeID
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221028112647_Migration_V47')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221028112647_Migration_V47', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    ALTER TABLE [tblPermissionTypes] ADD [IsUserPanel] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [IsUserPanel] = CAST(0 AS bit)
    WHERE [Id] = CAST(2 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [IsUserPanel] = CAST(0 AS bit)
    WHERE [Id] = CAST(3 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [IsUserPanel] = CAST(0 AS bit)
    WHERE [Id] = CAST(4 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [IsUserPanel] = CAST(0 AS bit)
    WHERE [Id] = CAST(5 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [IsUserPanel] = CAST(0 AS bit)
    WHERE [Id] = CAST(6 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [IsUserPanel] = CAST(0 AS bit)
    WHERE [Id] = CAST(7 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsUserPanel', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] ON;
    EXEC(N'INSERT INTO [tblPermissionTypes] ([Id], [IsUserPanel], [Name])
    VALUES (CAST(8 AS bigint), CAST(1 AS bit), N''Schedules''),
    (CAST(9 AS bigint), CAST(1 AS bit), N''Templates''),
    (CAST(10 AS bigint), CAST(1 AS bit), N''Employee Access''),
    (CAST(11 AS bigint), CAST(1 AS bit), N''Shifts''),
    (CAST(12 AS bigint), CAST(1 AS bit), N''API'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsUserPanel', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221107065830_Migration_V48')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221107065830_Migration_V48', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221110063143_Migration_V49')
BEGIN
    CREATE TABLE [tblBackwardCompatibilityChecks] (
        [Id] bigint NOT NULL IDENTITY,
        [FieldName] nvarchar(50) NOT NULL,
        [IsImplemented] bit NOT NULL,
        CONSTRAINT [PK_tblBackwardCompatibilityChecks] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221110063143_Migration_V49')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FieldName', N'IsImplemented') AND [object_id] = OBJECT_ID(N'[tblBackwardCompatibilityChecks]'))
        SET IDENTITY_INSERT [tblBackwardCompatibilityChecks] ON;
    EXEC(N'INSERT INTO [tblBackwardCompatibilityChecks] ([Id], [FieldName], [IsImplemented])
    VALUES (CAST(1 AS bigint), N''User Panel Permissions'', CAST(0 AS bit))');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FieldName', N'IsImplemented') AND [object_id] = OBJECT_ID(N'[tblBackwardCompatibilityChecks]'))
        SET IDENTITY_INSERT [tblBackwardCompatibilityChecks] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221110063143_Migration_V49')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221110063143_Migration_V49', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221121054212_Migration_V50')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Amount', N'BaseDate', N'BaseDateRange', N'ComparisonMode', N'ComparisonValue', N'CountOvernights', N'CustomDataID', N'DateRange', N'DayOfWeek', N'EmployeeField', N'JobEndFrom', N'JobEndTo', N'JobStartFrom', N'JobStartTo', N'Name', N'Offset', N'Operator', N'RestrictedToJobTypeID', N'ReverseOrder') AND [object_id] = OBJECT_ID(N'[tblRankingTypes]'))
        SET IDENTITY_INSERT [tblRankingTypes] ON;
    EXEC(N'INSERT INTO [tblRankingTypes] ([Id], [Amount], [BaseDate], [BaseDateRange], [ComparisonMode], [ComparisonValue], [CountOvernights], [CustomDataID], [DateRange], [DayOfWeek], [EmployeeField], [JobEndFrom], [JobEndTo], [JobStartFrom], [JobStartTo], [Name], [Offset], [Operator], [RestrictedToJobTypeID], [ReverseOrder])
    VALUES (CAST(6 AS bigint), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N''Skills'', CAST(0 AS bit), CAST(0 AS bit), CAST(1 AS bit), CAST(1 AS bit))');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Amount', N'BaseDate', N'BaseDateRange', N'ComparisonMode', N'ComparisonValue', N'CountOvernights', N'CustomDataID', N'DateRange', N'DayOfWeek', N'EmployeeField', N'JobEndFrom', N'JobEndTo', N'JobStartFrom', N'JobStartTo', N'Name', N'Offset', N'Operator', N'RestrictedToJobTypeID', N'ReverseOrder') AND [object_id] = OBJECT_ID(N'[tblRankingTypes]'))
        SET IDENTITY_INSERT [tblRankingTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221121054212_Migration_V50')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221121054212_Migration_V50', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221130123358_Migration_V51')
BEGIN
    ALTER TABLE [tblUsers] ADD [NotificationTypeID] bigint NOT NULL DEFAULT CAST(3 AS bigint);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221130123358_Migration_V51')
BEGIN
    CREATE INDEX [IX_tblUsers_NotificationTypeID] ON [tblUsers] ([NotificationTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221130123358_Migration_V51')
BEGIN
    ALTER TABLE [tblUsers] ADD CONSTRAINT [FK_tblUsers_tblNotificationTypes_NotificationTypeID] FOREIGN KEY ([NotificationTypeID]) REFERENCES [tblNotificationTypes] ([Id]) ON DELETE SET DEFAULT;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221130123358_Migration_V51')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221130123358_Migration_V51', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221201070628_Migration_V52')
BEGIN
    EXEC(N'UPDATE [tblNotificationTypes] SET [Name] = N''Push & Email''
    WHERE [Id] = CAST(3 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221201070628_Migration_V52')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221201070628_Migration_V52', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221215050331_Migration_V53')
BEGIN
    ALTER TABLE [tblAbsenceCodes] ADD [Description] nvarchar(500) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221215050331_Migration_V53')
BEGIN
    UPDATE tblAbsenceCodes SET Description = Name
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221215050331_Migration_V53')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221215050331_Migration_V53', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230131093007_Migration_V54')
BEGIN
    DECLARE @var37 sysname;
    SELECT @var37 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblAbsenceCodes]') AND [c].[name] = N'Description');
    IF @var37 IS NOT NULL EXEC(N'ALTER TABLE [tblAbsenceCodes] DROP CONSTRAINT [' + @var37 + '];');
    ALTER TABLE [tblAbsenceCodes] ALTER COLUMN [Description] nvarchar(500) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230131093007_Migration_V54')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230131093007_Migration_V54', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227163121_Migration_V55')
BEGIN
    DECLARE @var38 sysname;
    SELECT @var38 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblLicenses]') AND [c].[name] = N'CustomerBusinessID');
    IF @var38 IS NOT NULL EXEC(N'ALTER TABLE [tblLicenses] DROP CONSTRAINT [' + @var38 + '];');
    ALTER TABLE [tblLicenses] DROP COLUMN [CustomerBusinessID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227163121_Migration_V55')
BEGIN
    DECLARE @var39 sysname;
    SELECT @var39 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblLicenses]') AND [c].[name] = N'ExpiryDate');
    IF @var39 IS NOT NULL EXEC(N'ALTER TABLE [tblLicenses] DROP CONSTRAINT [' + @var39 + '];');
    ALTER TABLE [tblLicenses] DROP COLUMN [ExpiryDate];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227163121_Migration_V55')
BEGIN
    DECLARE @var40 sysname;
    SELECT @var40 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblLicenses]') AND [c].[name] = N'InstallationID');
    IF @var40 IS NOT NULL EXEC(N'ALTER TABLE [tblLicenses] DROP CONSTRAINT [' + @var40 + '];');
    ALTER TABLE [tblLicenses] DROP COLUMN [InstallationID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227163121_Migration_V55')
BEGIN
    DECLARE @var41 sysname;
    SELECT @var41 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblLicenses]') AND [c].[name] = N'MaxNumberOfAutoRosteringLicense');
    IF @var41 IS NOT NULL EXEC(N'ALTER TABLE [tblLicenses] DROP CONSTRAINT [' + @var41 + '];');
    ALTER TABLE [tblLicenses] DROP COLUMN [MaxNumberOfAutoRosteringLicense];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227163121_Migration_V55')
BEGIN
    ALTER TABLE [tblLicenses] ADD [LicenseData] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227163121_Migration_V55')
BEGIN
    CREATE TABLE [tblConfigSettings] (
        [Id] bigint NOT NULL IDENTITY,
        [Key] nvarchar(max) NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_tblConfigSettings] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227163121_Migration_V55')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230227163121_Migration_V55', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327120620_Migration_V56')
BEGIN
    ALTER TABLE [tblUsers] ADD [AdvancedId] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327120620_Migration_V56')
BEGIN
    ALTER TABLE [tblEmployees] ADD [AdvancedId] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327120620_Migration_V56')
BEGIN
    DECLARE @var42 sysname;
    SELECT @var42 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployeeAvailability]') AND [c].[name] = N'StartTime');
    IF @var42 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployeeAvailability] DROP CONSTRAINT [' + @var42 + '];');
    ALTER TABLE [tblEmployeeAvailability] ALTER COLUMN [StartTime] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327120620_Migration_V56')
BEGIN
    DECLARE @var43 sysname;
    SELECT @var43 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployeeAvailability]') AND [c].[name] = N'EndTime');
    IF @var43 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployeeAvailability] DROP CONSTRAINT [' + @var43 + '];');
    ALTER TABLE [tblEmployeeAvailability] ALTER COLUMN [EndTime] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327120620_Migration_V56')
BEGIN
    CREATE INDEX [IX_tblScheduleAssigmentsResults_EmployeeID] ON [tblScheduleAssigmentsResults] ([EmployeeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327120620_Migration_V56')
BEGIN
    ALTER TABLE [tblScheduleAssigmentsResults] ADD CONSTRAINT [FK_tblScheduleAssigmentsResults_tblEmployees_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [tblEmployees] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327120620_Migration_V56')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230327120620_Migration_V56', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330093539_Migration_V57')
BEGIN
    DECLARE @var44 sysname;
    SELECT @var44 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'AdvancedId');
    IF @var44 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var44 + '];');
    ALTER TABLE [tblUsers] ALTER COLUMN [AdvancedId] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330093539_Migration_V57')
BEGIN
    DECLARE @var45 sysname;
    SELECT @var45 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'AdvancedId');
    IF @var45 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var45 + '];');
    ALTER TABLE [tblEmployees] ALTER COLUMN [AdvancedId] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330093539_Migration_V57')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230330093539_Migration_V57', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410112400_Migration_V58')
BEGIN
    DECLARE @var46 sysname;
    SELECT @var46 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployeeTile]') AND [c].[name] = N'WorkRules');
    IF @var46 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployeeTile] DROP CONSTRAINT [' + @var46 + '];');
    ALTER TABLE [tblEmployeeTile] DROP COLUMN [WorkRules];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410112400_Migration_V58')
BEGIN
    DECLARE @var47 sysname;
    SELECT @var47 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployeeTile]') AND [c].[name] = N'TargetRuleGroup');
    IF @var47 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployeeTile] DROP CONSTRAINT [' + @var47 + '];');
    ALTER TABLE [tblEmployeeTile] DROP COLUMN [TargetRuleGroup];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410112400_Migration_V58')
BEGIN
    DECLARE @var48 sysname;
    SELECT @var48 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployeeTile]') AND [c].[name] = N'Availability');
    IF @var48 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployeeTile] DROP CONSTRAINT [' + @var48 + '];');
    ALTER TABLE [tblEmployeeTile] DROP COLUMN [Availability];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410112400_Migration_V58')
BEGIN
    EXEC sp_rename N'[tblEmployeeTile].[AllowedTrades]', N'AllowedTrade', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410112400_Migration_V58')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230410112400_Migration_V58', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414050901_Migration_V59')
BEGIN
    CREATE TABLE [tblAdvancedSSO] (
        [Id] bigint NOT NULL IDENTITY,
        [IsOverRuleOrganizationHint] bit NOT NULL,
        [OrganizationHint] nvarchar(max) NULL,
        CONSTRAINT [PK_tblAdvancedSSO] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414050901_Migration_V59')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsOverRuleOrganizationHint') AND [object_id] = OBJECT_ID(N'[tblAdvancedSSO]'))
        SET IDENTITY_INSERT [tblAdvancedSSO] ON;
    EXEC(N'INSERT INTO [tblAdvancedSSO] ([Id], [IsOverRuleOrganizationHint])
    VALUES (CAST(1 AS bigint), CAST(0 AS bit))');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsOverRuleOrganizationHint') AND [object_id] = OBJECT_ID(N'[tblAdvancedSSO]'))
        SET IDENTITY_INSERT [tblAdvancedSSO] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414050901_Migration_V59')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230414050901_Migration_V59', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230503134106_Migration_V60')
BEGIN
    CREATE TABLE [tblASSOMigrationDetails] (
        [Id] bigint NOT NULL IDENTITY,
        [Date] datetime2 NULL,
        [EmployeeOrUserId] bigint NOT NULL,
        [UserName] nvarchar(50) NULL,
        [IsUser] bit NOT NULL,
        [AdvancedId] nvarchar(50) NULL,
        [Status] bit NOT NULL,
        [Message] nvarchar(max) NULL,
        [IsDeleted] bit NOT NULL,
        CONSTRAINT [PK_tblASSOMigrationDetails] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230503134106_Migration_V60')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230503134106_Migration_V60', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230510103637_Migration_V61')
BEGIN
    ALTER TABLE [tblASSOMigrationDetails] ADD [Email] nvarchar(128) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230510103637_Migration_V61')
BEGIN
    ALTER TABLE [tblASSOMigrationDetails] ADD [EmployeeID] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230510103637_Migration_V61')
BEGIN
    ALTER TABLE [tblASSOMigrationDetails] ADD [FirstName] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230510103637_Migration_V61')
BEGIN
    ALTER TABLE [tblASSOMigrationDetails] ADD [LastName] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230510103637_Migration_V61')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230510103637_Migration_V61', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522110016_Migration_V62')
BEGIN
    ALTER TABLE [tblUsers] ADD [MobileDeviceId] nvarchar(500) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522110016_Migration_V62')
BEGIN
    ALTER TABLE [tblEmployees] ADD [MobileDeviceId] nvarchar(500) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522110016_Migration_V62')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230522110016_Migration_V62', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230523064236_Migration_V63')
BEGIN
    DECLARE @var49 sysname;
    SELECT @var49 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblUsers]') AND [c].[name] = N'MobileDeviceId');
    IF @var49 IS NOT NULL EXEC(N'ALTER TABLE [tblUsers] DROP CONSTRAINT [' + @var49 + '];');
    ALTER TABLE [tblUsers] DROP COLUMN [MobileDeviceId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230523064236_Migration_V63')
BEGIN
    DECLARE @var50 sysname;
    SELECT @var50 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[tblEmployees]') AND [c].[name] = N'MobileDeviceId');
    IF @var50 IS NOT NULL EXEC(N'ALTER TABLE [tblEmployees] DROP CONSTRAINT [' + @var50 + '];');
    ALTER TABLE [tblEmployees] DROP COLUMN [MobileDeviceId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230523064236_Migration_V63')
BEGIN
    CREATE TABLE [tblUserMobileDeviceMappings] (
        [Id] bigint NOT NULL IDENTITY,
        [UserId] bigint NOT NULL,
        [MobileDeviceId] nvarchar(500) NULL,
        [IsUser] bit NOT NULL,
        CONSTRAINT [PK_tblUserMobileDeviceMappings] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230523064236_Migration_V63')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230523064236_Migration_V63', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230613045057_Migration_V64')
BEGIN
    ALTER TABLE [tblPushNotification] ADD [Category] nvarchar(25) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230613045057_Migration_V64')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230613045057_Migration_V64', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616065536_Migration_65')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsUserPanel', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] ON;
    EXEC(N'INSERT INTO [tblPermissionTypes] ([Id], [IsUserPanel], [Name])
    VALUES (CAST(13 AS bigint), CAST(0 AS bit), N''Mobile App Access'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsUserPanel', N'Name') AND [object_id] = OBJECT_ID(N'[tblPermissionTypes]'))
        SET IDENTITY_INSERT [tblPermissionTypes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616065536_Migration_65')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230616065536_Migration_65', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230704042035_Migration_V66')
BEGIN
    ALTER TABLE [tblUsers] ADD [IsEmployeeLinked] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230704042035_Migration_V66')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230704042035_Migration_V66', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230704053343_Migration_V67')
BEGIN
    update u set LinkedEmployeeID = Null, IsEmployeeLinked = 1 from tblUsers u join tblEmployees e on u.LinkedEmployeeID = e.Id and u.Email = e.Email and (u.AdvancedId != e.AdvancedId or ISNULL(u.AdvancedId,'') = '' or ISNULL(e.AdvancedId,'') = '')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230704053343_Migration_V67')
BEGIN
    update u set LinkedEmployeeID = Null from tblUsers u join tblEmployees e on u.LinkedEmployeeID = e.Id and u.Email != e.Email
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230704053343_Migration_V67')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230704053343_Migration_V67', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230713090925_Migration_66')
BEGIN
    EXEC(N'UPDATE [tblPermissionTypes] SET [Name] = N''Advanced People Access''
    WHERE [Id] = CAST(13 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230713090925_Migration_66')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230713090925_Migration_66', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230731091248_Migration_V68')
BEGIN
    ALTER TABLE [tblUserMobileDeviceMappings] ADD [Platform] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230731091248_Migration_V68')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230731091248_Migration_V68', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230803045854_Migration_V69')
BEGIN
    ALTER TABLE [tblUserMobileDeviceMappings] ADD [DeviceIdentifier] nvarchar(1000) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230803045854_Migration_V69')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230803045854_Migration_V69', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230809104534_Migration_V70')
BEGIN
    ALTER TABLE [tblSuperAdmins] ADD [AdvancedId] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230809104534_Migration_V70')
BEGIN
    EXEC(N'UPDATE [tblSuperAdmins] SET [AdvancedId] = NULL
    WHERE [Id] = CAST(1 AS bigint);
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230809104534_Migration_V70')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230809104534_Migration_V70', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230911110532_Migration_V71')
BEGIN
    ALTER TABLE [tblEmployees] ADD [IsSystemAccessEmailSent] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230911110532_Migration_V71')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230911110532_Migration_V71', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230914112349_Migration_V72')
BEGIN
    ALTER TABLE [tblAdvancedSSO] ADD [AuthenticationDomain] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230914112349_Migration_V72')
BEGIN
    update tblAdvancedSSO set AuthenticationDomain = 'oneadvanced.io'
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230914112349_Migration_V72')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230914112349_Migration_V72', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230915054623_Migration_V73')
BEGIN
    ALTER TABLE [tblUsers] ADD [IsSystemAccessEmailSent] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230915054623_Migration_V73')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230915054623_Migration_V73', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230926061345_Migration_V74')
BEGIN
    DROP INDEX IF EXISTS IX_tblConstraintSetValues_ConstraintID ON [dbo].[tblConstraintSetValues];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230926061345_Migration_V74')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230926061345_Migration_V74', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230927053632_Migration_V75')
BEGIN
    ALTER TABLE [tblUsers] ADD [LeaveDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230927053632_Migration_V75')
BEGIN
    ALTER TABLE [tblUsers] ADD [StartDate] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230927053632_Migration_V75')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230927053632_Migration_V75', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231127111847_Migration_V76')
BEGIN
    ALTER TABLE [tblEmployees] ADD [IsLocked] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231127111847_Migration_V76')
BEGIN
    ALTER TABLE [tblEmployees] ADD [LoginFailedCount] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231127111847_Migration_V76')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Key', N'Value') AND [object_id] = OBJECT_ID(N'[tblConfigSettings]'))
        SET IDENTITY_INSERT [tblConfigSettings] ON;
    EXEC(N'INSERT INTO [tblConfigSettings] ([Key], [Value])
    VALUES (N''Login Failed Count'', N''3'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Key', N'Value') AND [object_id] = OBJECT_ID(N'[tblConfigSettings]'))
        SET IDENTITY_INSERT [tblConfigSettings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231127111847_Migration_V76')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231127111847_Migration_V76', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240102074658_Migration_V78')
BEGIN
    update tblSecurity set TimeoutMinutes = 30 where Id = 1 and (TimeoutMinutes > 90 or TimeoutMinutes < 20)
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240102074658_Migration_V78')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240102074658_Migration_V78', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240112063935_Migration_V79')
BEGIN
    SET IDENTITY_INSERT dbo.tblSchedules ON; 
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240112063935_Migration_V79')
BEGIN
    insert into tblSchedules(Id,Name,StartDate,EndDate) values (0,'Global','1900-01-01 00:00:00.0000000','9999-12-31 23:59:59.0000000' ) 
                                       SET IDENTITY_INSERT dbo.tblSchedules OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240112063935_Migration_V79')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240112063935_Migration_V79', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240116083111_Migration_V80')
BEGIN
    ALTER TABLE [tblAbsenceCodes] ADD [CountAsWorked] bit NOT NULL DEFAULT CAST(1 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240116083111_Migration_V80')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240116083111_Migration_V80', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240118052639_Migration_V81')
BEGIN
    ALTER TABLE [tblSchedules] ADD [ApplyConstraintFromScheduleId] bigint NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240118052639_Migration_V81')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240118052639_Migration_V81', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240205041505_Migration_V82')
BEGIN
    ALTER TABLE [tblEmailSettings] ADD [SmtpUsername] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240205041505_Migration_V82')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240205041505_Migration_V82', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations')
BEGIN
    EXECUTE('CREATE PROCEDURE [dbo].[UpdateJobStatuses] @JobIDsStringValue nvarchar(MAX)
    AS
    BEGIN
        SET NOCOUNT ON;
    	DECLARE @JobIdsTable TABLE (jobID bigint);
        DECLARE @JobID BIGINT = 0;
        DECLARE @IsConcurent bit = 0;
        DECLARE @JobStatusID BIGINT = 0;
        DECLARE @NumberOfRequiredEmployees INT = 0;
        DECLARE @NumberOfAvailableEmployees INT = 0;
        DECLARE @NumberOfValidAssignment INT = 0;
        DECLARE @NumberOfInvalidAssignment INT = 0;
        DECLARE @MoreNeededForAssigment INT = 0;

        DECLARE @jobIDStringValue NVARCHAR(255)
    	DECLARE @pos INT

    	WHILE CHARINDEX('','', @JobIDsStringValue) > 0
    	BEGIN
    		SELECT @pos  = CHARINDEX('','', @JobIDsStringValue)  
    		SELECT @jobIDStringValue =  CAST(SUBSTRING(@JobIDsStringValue, 1, @pos-1) AS bigint)

    		INSERT INTO @JobIdsTable SELECT @jobIDStringValue

    		SELECT @JobIDsStringValue = SUBSTRING(@JobIDsStringValue, @pos+1, LEN(@JobIDsStringValue)-@pos)
    	END

    	DECLARE @CursorTestID INT;
    	DECLARE @RunningTotal BIGINT = 0;
     
    	DECLARE CUR_TEST CURSOR FAST_FORWARD FOR SELECT jobID FROM @JobIdsTable
     
    	OPEN CUR_TEST
    	FETCH NEXT FROM CUR_TEST INTO @CursorTestID
     
    	WHILE @@FETCH_STATUS = 0
    	BEGIN
    		SET @JobID = @CursorTestID;
            SET @NumberOfRequiredEmployees  = (SELECT NoOfEmployeesRequired from tblJobs WHERE Id = @JobID);
            SET @NumberOfAvailableEmployees = (SELECT COUNT(Id) FROM tblJobAvailabilities WHERE JobID = @JobID AND IsAssigned = 0 AND CompletelyValid = 1);
            SET @NumberOfValidAssignment    = (SELECT COUNT(Id) FROM tblJobAvailabilities WHERE JobID = @JobID AND IsAssigned = 1 AND (CompletelyValid = 1 OR (CompletelyValid = 0 AND IsOverriden = 1))) 
                                            + (SELECT COUNT(Id) FROM tblAgencyJobAssignments WHERE JobID = @JobID);		

    		SET @NumberOfInvalidAssignment  = (SELECT COUNT(Id) FROM tblJobAvailabilities WHERE JobID = @JobID AND IsAssigned = 1 AND CompletelyValid = 0 AND IsOverriden = 0);
    		UPDATE tblJobs SET NumberOfValidAssigned = @NumberOfValidAssignment WHERE Id = @JobID;
    		UPDATE tblJobs SET NumberOfInvalidAssigned = @NumberOfInvalidAssignment WHERE Id = @JobID;
    		SET @IsConcurent = (SELECT IsConcurrent from tblJobs WHERE Id = @JobID);
            SET @MoreNeededForAssigment = @NumberOfRequiredEmployees - @NumberOfValidAssignment
            IF @IsConcurent = 1
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Concurrent job'');
            END
            ELSE IF @NumberOfValidAssignment = 0 AND @NumberOfAvailableEmployees = 0
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''No available employees'');
            END
            ELSE IF @NumberOfRequiredEmployees > @NumberOfValidAssignment AND @NumberOfAvailableEmployees >= @NumberOfRequiredEmployees
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Insufficient employees assigned'');
            END
            ELSE IF @NumberOfRequiredEmployees > @NumberOfValidAssignment AND @NumberOfAvailableEmployees < @MoreNeededForAssigment
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Insufficient employees to meet the requirement'');
            END
            ELSE IF @NumberOfRequiredEmployees = @NumberOfValidAssignment AND @NumberOfAvailableEmployees = 0
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Correct number of employees assigned but no cover'');
            END
            ELSE IF @NumberOfRequiredEmployees = @NumberOfValidAssignment AND @NumberOfAvailableEmployees > 0
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Correct number of employees assigned'');
            END
            ELSE IF @NumberOfRequiredEmployees < @NumberOfValidAssignment
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Too many employees assigned'');
            END
            ELSE
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Insufficient employees assigned'');
            END
            UPDATE tblJobs SET JobStatusID = @JobStatusID WHERE Id = @JobID;

    	   SET @RunningTotal += @CursorTestID

    	   FETCH NEXT FROM CUR_TEST INTO @CursorTestID
    	END
    	CLOSE CUR_TEST
    	DEALLOCATE CUR_TEST
    END;
    ')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations')
BEGIN
    EXECUTE('CREATE PROCEDURE [dbo].[UpdateTemplateJobStatuses] @JobIDsStringValue nvarchar(MAX)
    AS
    BEGIN
        SET NOCOUNT ON;
    	DECLARE @JobIdsTable TABLE (jobID bigint);
        DECLARE @JobID BIGINT = 0;
        DECLARE @IsConcurent bit = 0;
        DECLARE @JobStatusID BIGINT = 0;
        DECLARE @NumberOfRequiredEmployees INT = 0;
        DECLARE @NumberOfAvailableEmployees INT = 0;
        DECLARE @NumberOfValidAssignment INT = 0;
        DECLARE @NumberOfInvalidAssignment INT = 0;
        DECLARE @MoreNeededForAssigment INT = 0;
        DECLARE @jobIDStringValue NVARCHAR(255)
    	DECLARE @pos INT
    	WHILE CHARINDEX('','', @JobIDsStringValue) > 0
    	BEGIN
    		SELECT @pos  = CHARINDEX('','', @JobIDsStringValue)  
    		SELECT @jobIDStringValue =  CAST(SUBSTRING(@JobIDsStringValue, 1, @pos-1) AS bigint)
    		INSERT INTO @JobIdsTable SELECT @jobIDStringValue
    		SELECT @JobIDsStringValue = SUBSTRING(@JobIDsStringValue, @pos+1, LEN(@JobIDsStringValue)-@pos)
    	END
    	DECLARE @CursorTestID INT;
    	DECLARE @RunningTotal BIGINT = 0;
    	DECLARE CUR_TEST CURSOR FAST_FORWARD FOR SELECT jobID FROM @JobIdsTable
    	OPEN CUR_TEST
    	FETCH NEXT FROM CUR_TEST INTO @CursorTestID
    	WHILE @@FETCH_STATUS = 0
    	BEGIN
    		SET @JobID = @CursorTestID;
    	    SET @NumberOfRequiredEmployees  = (SELECT NoOfEmployeesRequired from tblTemplateJobs WHERE Id = @JobID);
            SET @NumberOfAvailableEmployees = (SELECT COUNT(Id) FROM tblTemplateJobAvailabilities WHERE TemplateJobID = @JobID AND IsAssigned = 0 AND CompletelyValid = 1);
            SET @NumberOfValidAssignment    = (SELECT COUNT(Id) FROM tblTemplateJobAvailabilities WHERE TemplateJobID = @JobID AND IsAssigned = 1 AND (CompletelyValid = 1 OR (CompletelyValid = 0 AND IsOverriden = 1)));
    		SET @NumberOfInvalidAssignment  = (SELECT COUNT(Id) FROM tblTemplateJobAvailabilities WHERE TemplateJobID = @JobID AND IsAssigned = 1 AND CompletelyValid = 0 AND IsOverriden = 0);
    		UPDATE tblTemplateJobs SET NumberOfValidAssigned = @NumberOfValidAssignment WHERE Id = @JobID;
    		UPDATE tblTemplateJobs SET NumberOfInvalidAssigned = @NumberOfInvalidAssignment WHERE Id = @JobID;
    		SET @IsConcurent = (SELECT IsConcurrent from tblTemplateJobs WHERE Id = @JobID);
            SET @MoreNeededForAssigment = @NumberOfRequiredEmployees - @NumberOfValidAssignment
            IF @IsConcurent = 1
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Concurrent job'');
            END
            ELSE IF @NumberOfValidAssignment = 0 AND @NumberOfAvailableEmployees = 0
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''No available employees'');
            END
            ELSE IF @NumberOfRequiredEmployees > @NumberOfValidAssignment AND @NumberOfAvailableEmployees >= @NumberOfRequiredEmployees
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Insufficient employees assigned'');
            END
            ELSE IF @NumberOfRequiredEmployees > @NumberOfValidAssignment AND @NumberOfAvailableEmployees < @MoreNeededForAssigment
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Insufficient employees to meet the requirement'');
            END
            ELSE IF @NumberOfRequiredEmployees = @NumberOfValidAssignment AND @NumberOfAvailableEmployees = 0
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Correct number of employees assigned but no cover'');
            END
            ELSE IF @NumberOfRequiredEmployees = @NumberOfValidAssignment AND @NumberOfAvailableEmployees > 0
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Correct number of employees assigned'');
            END
            ELSE IF @NumberOfRequiredEmployees < @NumberOfValidAssignment
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Too many employees assigned'');
            END
            ELSE
            BEGIN
                SET @JobStatusID = (SELECT Id FROM tblJobStatuses where Name like ''Insufficient employees assigned'');
            END
            UPDATE tblTemplateJobs SET JobStatusID = @JobStatusID WHERE Id = @JobID;
    	   SET @RunningTotal += @CursorTestID
    	   FETCH NEXT FROM CUR_TEST INTO @CursorTestID
    	END
    	CLOSE CUR_TEST
    	DEALLOCATE CUR_TEST
    END;')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations')
BEGIN
    EXECUTE('CREATE TRIGGER preventDeleteSuperAdmins ON tblSuperAdmins 
    	FOR DELETE
    AS
    PRINT ''You are not able to delete SuperAdmins!'' 
    ROLLBACK TRANSACTION')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'StoredProceduresMigrations', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations_V2')
BEGIN
    EXECUTE('create procedure [dbo].[spCreateUpdateConstraintSetValue]
     @constraintID bigint = null,
     @operator nvarchar(max) = null,
     @employeeField varchar(max) = null,
     @comparsionValue varchar(max) = null,
     @Id bigint = null,
     @ConstraintRule nvarchar(max) = null
     
    AS

    declare 
    @NEW_ID bigint

    BEGIN
    	if(@Id = null or @Id = 0)
    	BEGIN
    		insert into tblConstraintSetValues (ConstraintID, Operator, EmployeeField, ComparisonValue)
    		values(@constraintID, @operator, @employeeField, @comparsionValue)

    		set @NEW_ID = IDENT_CURRENT(''tblConstraintSetValues'');
    	END
    	else
    	BEGIN
    		update tblConstraintSetValues set Operator = @operator,
    										  EmployeeField = @employeeField,
    										  ComparisonValue = @comparsionValue
    		where Id = @Id
    	END
        	

    	if(@NEW_ID <> 0)
    	BEGIN
    		if(@ConstraintRule = ''MNOH'')
    		BEGIN
    			update tblConstraintMNOHs set ConstraintSetValueID =  @NEW_ID where ConstraintID = @constraintID
    		END
    		else if(@ConstraintRule = ''MNODOTW'')
    		BEGIN
    			update tblConstraintMNODOTWs set ConstraintSetValueID = @NEW_ID where ConstraintID = @constraintID
    		END
    		else if(@ConstraintRule = ''MNOJT'')
    		BEGIN
    			update tblConstraintMNOJTs set ConstraintSetValueID = @NEW_ID where ConstraintID = @constraintID
    		END
    		else if(@ConstraintRule = ''MNOJTC'')
    		BEGIN
    			update tblConstraintMNOJTCs set ConstraintSetValueID = @NEW_ID where ConstraintID = @constraintID
    		END
    		else if(@ConstraintRule = ''MNOJTIME'')
    		BEGIN
    			update tblConstraintMNOJTIMEs set ConstraintSetValueID = @NEW_ID where ConstraintID = @constraintID
    		END
    		else if(@ConstraintRule = ''SS'')
    		BEGIN
    			update tblConstraintSSs set ConstraintSetValueID = @NEW_ID where ConstraintID = @constraintID
    		END
    		else if(@ConstraintRule = ''DOWAP'')
    		BEGIN
    			update tblConstraintDOWPs set ConstraintSetValueID = @NEW_ID where ConstraintID = @constraintID
    		END
    	END

    END
    ')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations_V2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'StoredProceduresMigrations_V2', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations_V3')
BEGIN
    EXECUTE('Create OR ALTER procedure [dbo].[spASSOConfigurations]
    @Email nvarchar(max) = null,
    @AdvancedId nvarchar(50) = null,
    @OrganisationReference nvarchar(max) = null

    as

    BEGIN
    	if(select COUNT(*) from [dbo].[tblAdvancedSSO]) = 1
    	BEGIN
    		update [dbo].[tblAdvancedSSO] set OrganizationHint = @OrganisationReference where Id = 1
    	END
    	else
    	BEGIN
    		insert into [dbo].[tblAdvancedSSO]([IsOverRuleOrganizationHint], [OrganizationHint]) values (0, @OrganisationReference)
    	END	
    	
    	update [dbo].[tblSuperAdmins] set EmailAddress = @Email, AdvancedId = @AdvancedId WHERE Id = 1	
    END')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations_V3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'StoredProceduresMigrations_V3', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations_V4')
BEGIN
    EXECUTE('Create OR ALTER procedure [dbo].[spASSOConfigurations]
    @Email nvarchar(max) = null,
    @AdvancedId nvarchar(50) = null,
    @OrganisationReference nvarchar(max) = null

    as

    BEGIN
    	if(select COUNT(*) from [dbo].[tblAdvancedSSO]) = 1
    	BEGIN
    		update [dbo].[tblAdvancedSSO] set OrganizationHint = @OrganisationReference where Id = 1
    	END
    	else
    	BEGIN
    		insert into [dbo].[tblAdvancedSSO]([IsOverRuleOrganizationHint], [OrganizationHint]) values (0, @OrganisationReference)
    	END	
    	
    	update [dbo].[tblSuperAdmins] set EmailAddress = @Email, AdvancedId = @AdvancedId WHERE Id = 1	
    END')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'StoredProceduresMigrations_V4')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'StoredProceduresMigrations_V4', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'TriggersMigrations_V1')
BEGIN
    EXECUTE('CREATE TRIGGER [dbo].[UpdateOriginalCompletelyValidFlag] 
       ON  [dbo].[tblJobAvailabilities]
       AFTER UPDATE
    AS 
    BEGIN
    	IF(UPDATE(CompletelyValid))
    	BEGIN
    		UPDATE JA 
    		SET JA.OriginalCompletelyValid = D.CompletelyValid, JA.OriginalCompletelyValidUpdated = 1
    		FROM tblJobAvailabilities JA
    		INNER JOIN deleted D ON JA.Id = D.Id
    		INNER JOIN tblJobsLocked JL ON JL.JobAvailabilityID = JA.Id
    		WHERE JA.OriginalCompletelyValidUpdated = 0 AND JL.IsFromPublishTemplate = 0
    	END
    END')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'TriggersMigrations_V1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'TriggersMigrations_V1', N'7.0.1');
END;
GO

COMMIT;
GO

