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

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Actress] (
        [Id] int NOT NULL IDENTITY,
        [FullName] nvarchar(max) NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7963161Z',
        CONSTRAINT [PK_Actress] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Contact] (
        [Id] int NOT NULL IDENTITY,
        [PhoneNumber] nvarchar(50) NOT NULL,
        [MailAccount] nvarchar(100) NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7967870Z',
        CONSTRAINT [PK_Contact] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Faq] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(50) NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7972954Z',
        CONSTRAINT [PK_Faq] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Feature] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [ImageUrL] nvarchar(max) NOT NULL,
        [Description] nvarchar(100) NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7978114Z',
        CONSTRAINT [PK_Feature] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Genre] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(100) NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7978530Z',
        CONSTRAINT [PK_Genre] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Partners] (
        [Id] int NOT NULL IDENTITY,
        [ImageUrl] nvarchar(max) NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7983361Z',
        CONSTRAINT [PK_Partners] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [PricingPlans] (
        [Id] int NOT NULL IDENTITY,
        [PlanName] nvarchar(50) NOT NULL,
        [Property] nvarchar(100) NOT NULL,
        [Price] float NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7988532Z',
        CONSTRAINT [PK_PricingPlans] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Social] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(100) NOT NULL,
        [ImageUrl] nvarchar(max) NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7994253Z',
        CONSTRAINT [PK_Social] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Movie] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(100) NOT NULL,
        [ImageUrl] nvarchar(max) NOT NULL,
        [Quality] nvarchar(max) NOT NULL,
        [AgeRestriction] nvarchar(max) NOT NULL,
        [Year] datetime2 NOT NULL,
        [Price] float NOT NULL,
        [Raiting] int NOT NULL,
        [GenreId] int NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7979423Z',
        CONSTRAINT [PK_Movie] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Movie_Genre_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genre] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Serie] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(100) NOT NULL,
        [ImageUrl] nvarchar(max) NOT NULL,
        [Quality] nvarchar(max) NOT NULL,
        [AgeRestriction] nvarchar(max) NOT NULL,
        [Year] datetime2 NOT NULL,
        [Price] float NOT NULL,
        [Raiting] int NOT NULL,
        [GenreId] int NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7989701Z',
        CONSTRAINT [PK_Serie] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Serie_Genre_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genre] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [MovieActress] (
        [Id] int NOT NULL IDENTITY,
        [MovieId] int NOT NULL,
        [ActressId] int NOT NULL,
        [isDeleted] bit NOT NULL,
        [CreatedTime] datetime2 NOT NULL,
        CONSTRAINT [PK_MovieActress] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_MovieActress_Actress_ActressId] FOREIGN KEY ([ActressId]) REFERENCES [Actress] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_MovieActress_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Season] (
        [Id] int NOT NULL IDENTITY,
        [SeasonNumber] int NOT NULL,
        [SerieId] int NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7988989Z',
        CONSTRAINT [PK_Season] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Season_Serie_SerieId] FOREIGN KEY ([SerieId]) REFERENCES [Serie] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [SerieActress] (
        [Id] int NOT NULL IDENTITY,
        [SerieId] int NOT NULL,
        [ActressId] int NOT NULL,
        [isDeleted] bit NOT NULL,
        [CreatedTime] datetime2 NOT NULL,
        CONSTRAINT [PK_SerieActress] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_SerieActress_Actress_ActressId] FOREIGN KEY ([ActressId]) REFERENCES [Actress] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_SerieActress_Serie_SerieId] FOREIGN KEY ([SerieId]) REFERENCES [Serie] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE TABLE [Episode] (
        [Id] int NOT NULL IDENTITY,
        [EpisodeNumber] int NOT NULL,
        [EpisodeTitle] nvarchar(50) NOT NULL,
        [AirDate] datetime2 NOT NULL,
        [SeasonId] int NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-14T12:57:52.7968364Z',
        CONSTRAINT [PK_Episode] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Episode_Season_SeasonId] FOREIGN KEY ([SeasonId]) REFERENCES [Season] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_Episode_SeasonId] ON [Episode] ([SeasonId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_Movie_GenreId] ON [Movie] ([GenreId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_MovieActress_ActressId] ON [MovieActress] ([ActressId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_MovieActress_MovieId] ON [MovieActress] ([MovieId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_Season_SerieId] ON [Season] ([SerieId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_Serie_GenreId] ON [Serie] ([GenreId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_SerieActress_ActressId] ON [SerieActress] ([ActressId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    CREATE INDEX [IX_SerieActress_SerieId] ON [SerieActress] ([SerieId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230514125752_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230514125752_initial', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'Quality');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Serie] DROP COLUMN [Quality];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'Quality');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Movie] DROP COLUMN [Quality];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-16T07:15:15.3219580Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-16T07:15:15.3212523Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-16T07:15:15.3211532Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-16T07:15:15.3210765Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Partners]') AND [c].[name] = N'CreatedTime');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Partners] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Partners] ADD DEFAULT '2023-05-16T07:15:15.3202667Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-16T07:15:15.3196476Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-16T07:15:15.3194974Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-16T07:15:15.3194179Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-16T07:15:15.3186202Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-16T07:15:15.3178940Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-16T07:15:15.3178111Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-16T07:15:15.3170462Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    CREATE TABLE [Quality] (
        [Id] int NOT NULL IDENTITY,
        [Qualty] nvarchar(max) NOT NULL,
        [isDeleted] bit NOT NULL,
        [CreatedTime] datetime2 NOT NULL,
        CONSTRAINT [PK_Quality] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    CREATE TABLE [MovieQuality] (
        [Id] int NOT NULL IDENTITY,
        [MovieId] int NOT NULL,
        [QualityId] int NOT NULL,
        [isDeleted] bit NOT NULL,
        [CreatedTime] datetime2 NOT NULL,
        CONSTRAINT [PK_MovieQuality] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_MovieQuality_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_MovieQuality_Quality_QualityId] FOREIGN KEY ([QualityId]) REFERENCES [Quality] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    CREATE TABLE [SerieQuality] (
        [Id] int NOT NULL IDENTITY,
        [SerieId] int NOT NULL,
        [QualityId] int NOT NULL,
        [isDeleted] bit NOT NULL,
        [CreatedTime] datetime2 NOT NULL,
        CONSTRAINT [PK_SerieQuality] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_SerieQuality_Quality_QualityId] FOREIGN KEY ([QualityId]) REFERENCES [Quality] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_SerieQuality_Serie_SerieId] FOREIGN KEY ([SerieId]) REFERENCES [Serie] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    CREATE INDEX [IX_MovieQuality_MovieId] ON [MovieQuality] ([MovieId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    CREATE INDEX [IX_MovieQuality_QualityId] ON [MovieQuality] ([QualityId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    CREATE INDEX [IX_SerieQuality_QualityId] ON [SerieQuality] ([QualityId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    CREATE INDEX [IX_SerieQuality_SerieId] ON [SerieQuality] ([SerieId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516071515_editQuality')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230516071515_editQuality', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var14 sysname;
    SELECT @var14 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var14 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-16T07:23:20.4497079Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var15 sysname;
    SELECT @var15 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var15 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-16T07:23:20.4489298Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var16 sysname;
    SELECT @var16 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var16 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-16T07:23:20.4488244Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var17 sysname;
    SELECT @var17 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var17 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-16T07:23:20.4487413Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var18 sysname;
    SELECT @var18 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Partners]') AND [c].[name] = N'CreatedTime');
    IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [Partners] DROP CONSTRAINT [' + @var18 + '];');
    ALTER TABLE [Partners] ADD DEFAULT '2023-05-16T07:23:20.4478692Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var19 sysname;
    SELECT @var19 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var19 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-16T07:23:20.4471838Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var20 sysname;
    SELECT @var20 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var20 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-16T07:23:20.4470313Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var21 sysname;
    SELECT @var21 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var21 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-16T07:23:20.4469351Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var22 sysname;
    SELECT @var22 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var22 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-16T07:23:20.4458140Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var23 sysname;
    SELECT @var23 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var23 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-16T07:23:20.4449224Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var24 sysname;
    SELECT @var24 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var24 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-16T07:23:20.4448336Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    DECLARE @var25 sysname;
    SELECT @var25 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var25 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-16T07:23:20.4440129Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072320_editQuality2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230516072320_editQuality2', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var26 sysname;
    SELECT @var26 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var26 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-16T07:25:58.1970832Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var27 sysname;
    SELECT @var27 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var27 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-16T07:25:58.1963664Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var28 sysname;
    SELECT @var28 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var28 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-16T07:25:58.1962587Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var29 sysname;
    SELECT @var29 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'isDeleted');
    IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var29 + '];');
    ALTER TABLE [Quality] ADD DEFAULT CAST(0 AS bit) FOR [isDeleted];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var30 sysname;
    SELECT @var30 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var30 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-16T07:25:58.1971681Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var31 sysname;
    SELECT @var31 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var31 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-16T07:25:58.1961736Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var32 sysname;
    SELECT @var32 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Partners]') AND [c].[name] = N'CreatedTime');
    IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [Partners] DROP CONSTRAINT [' + @var32 + '];');
    ALTER TABLE [Partners] ADD DEFAULT '2023-05-16T07:25:58.1953601Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var33 sysname;
    SELECT @var33 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var33 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-16T07:25:58.1947418Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var34 sysname;
    SELECT @var34 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var34 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-16T07:25:58.1946012Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var35 sysname;
    SELECT @var35 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var35 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-16T07:25:58.1945305Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var36 sysname;
    SELECT @var36 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var36 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var36 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-16T07:25:58.1937104Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var37 sysname;
    SELECT @var37 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var37 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var37 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-16T07:25:58.1929807Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var38 sysname;
    SELECT @var38 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var38 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var38 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-16T07:25:58.1928936Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    DECLARE @var39 sysname;
    SELECT @var39 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var39 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var39 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-16T07:25:58.1920931Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516072558_editQuality3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230516072558_editQuality3', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    EXEC sp_rename N'[Quality].[Qualty]', N'Name', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var40 sysname;
    SELECT @var40 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var40 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var40 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-16T09:30:22.6956320Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var41 sysname;
    SELECT @var41 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var41 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var41 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-16T09:30:22.6947438Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var42 sysname;
    SELECT @var42 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var42 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var42 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-16T09:30:22.6946393Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var43 sysname;
    SELECT @var43 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var43 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var43 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-16T09:30:22.6957300Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var44 sysname;
    SELECT @var44 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var44 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var44 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-16T09:30:22.6945269Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var45 sysname;
    SELECT @var45 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Partners]') AND [c].[name] = N'CreatedTime');
    IF @var45 IS NOT NULL EXEC(N'ALTER TABLE [Partners] DROP CONSTRAINT [' + @var45 + '];');
    ALTER TABLE [Partners] ADD DEFAULT '2023-05-16T09:30:22.6934406Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var46 sysname;
    SELECT @var46 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var46 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var46 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-16T09:30:22.6922525Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var47 sysname;
    SELECT @var47 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var47 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var47 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-16T09:30:22.6920632Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var48 sysname;
    SELECT @var48 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var48 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var48 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-16T09:30:22.6919815Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var49 sysname;
    SELECT @var49 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var49 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var49 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-16T09:30:22.6910895Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var50 sysname;
    SELECT @var50 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var50 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var50 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-16T09:30:22.6892855Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var51 sysname;
    SELECT @var51 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var51 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var51 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-16T09:30:22.6891283Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    DECLARE @var52 sysname;
    SELECT @var52 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var52 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var52 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-16T09:30:22.6864034Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230516093022_editQualityTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230516093022_editQualityTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var53 sysname;
    SELECT @var53 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var53 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var53 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-17T17:16:45.1615353Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var54 sysname;
    SELECT @var54 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var54 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var54 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-17T17:16:45.1611016Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var55 sysname;
    SELECT @var55 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var55 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var55 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-17T17:16:45.1610380Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var56 sysname;
    SELECT @var56 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var56 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var56 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-17T17:16:45.1615834Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var57 sysname;
    SELECT @var57 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var57 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var57 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-17T17:16:45.1609843Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var58 sysname;
    SELECT @var58 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Partners]') AND [c].[name] = N'CreatedTime');
    IF @var58 IS NOT NULL EXEC(N'ALTER TABLE [Partners] DROP CONSTRAINT [' + @var58 + '];');
    ALTER TABLE [Partners] ADD DEFAULT '2023-05-17T17:16:45.1604629Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var59 sysname;
    SELECT @var59 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var59 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var59 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-17T17:16:45.1600893Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var60 sysname;
    SELECT @var60 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var60 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var60 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-17T17:16:45.1599985Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var61 sysname;
    SELECT @var61 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'Description');
    IF @var61 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var61 + '];');
    ALTER TABLE [Feature] ALTER COLUMN [Description] nvarchar(500) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var62 sysname;
    SELECT @var62 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var62 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var62 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-17T17:16:45.1599562Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var63 sysname;
    SELECT @var63 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var63 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var63 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-17T17:16:45.1594624Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var64 sysname;
    SELECT @var64 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var64 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var64 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-17T17:16:45.1590161Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var65 sysname;
    SELECT @var65 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var65 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var65 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-17T17:16:45.1589618Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    DECLARE @var66 sysname;
    SELECT @var66 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var66 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var66 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-17T17:16:45.1584073Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517171645_editFeatureTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230517171645_editFeatureTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var67 sysname;
    SELECT @var67 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'Property');
    IF @var67 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var67 + '];');
    ALTER TABLE [PricingPlans] DROP COLUMN [Property];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var68 sysname;
    SELECT @var68 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var68 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var68 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-18T15:09:21.7326799Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var69 sysname;
    SELECT @var69 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var69 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var69 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-18T15:09:21.7322252Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var70 sysname;
    SELECT @var70 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var70 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var70 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-18T15:09:21.7321605Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var71 sysname;
    SELECT @var71 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var71 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var71 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-18T15:09:21.7327215Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var72 sysname;
    SELECT @var72 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var72 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var72 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-18T15:09:21.7321088Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var73 sysname;
    SELECT @var73 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Partners]') AND [c].[name] = N'CreatedTime');
    IF @var73 IS NOT NULL EXEC(N'ALTER TABLE [Partners] DROP CONSTRAINT [' + @var73 + '];');
    ALTER TABLE [Partners] ADD DEFAULT '2023-05-18T15:09:21.7306802Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var74 sysname;
    SELECT @var74 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var74 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var74 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-18T15:09:21.7303043Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var75 sysname;
    SELECT @var75 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var75 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var75 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-18T15:09:21.7302038Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var76 sysname;
    SELECT @var76 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var76 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var76 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-18T15:09:21.7301556Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var77 sysname;
    SELECT @var77 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var77 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var77 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-18T15:09:21.7296565Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var78 sysname;
    SELECT @var78 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var78 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var78 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-18T15:09:21.7292191Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var79 sysname;
    SELECT @var79 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var79 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var79 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-18T15:09:21.7291677Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    DECLARE @var80 sysname;
    SELECT @var80 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var80 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var80 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-18T15:09:21.7287041Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    CREATE TABLE [Property] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [PlanId] int NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-05-18T15:09:21.7327732Z',
        CONSTRAINT [PK_Property] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Property_PricingPlans_PlanId] FOREIGN KEY ([PlanId]) REFERENCES [PricingPlans] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    CREATE INDEX [IX_Property_PlanId] ON [Property] ([PlanId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518150921_editPlanTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230518150921_editPlanTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var81 sysname;
    SELECT @var81 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var81 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var81 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-18T16:53:48.2928669Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var82 sysname;
    SELECT @var82 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var82 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var82 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-18T16:53:48.2922380Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var83 sysname;
    SELECT @var83 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var83 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var83 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-18T16:53:48.2921644Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var84 sysname;
    SELECT @var84 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var84 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var84 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-18T16:53:48.2929175Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var85 sysname;
    SELECT @var85 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var85 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var85 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-05-18T16:53:48.2929724Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var86 sysname;
    SELECT @var86 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var86 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var86 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-18T16:53:48.2921030Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var87 sysname;
    SELECT @var87 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Partners]') AND [c].[name] = N'CreatedTime');
    IF @var87 IS NOT NULL EXEC(N'ALTER TABLE [Partners] DROP CONSTRAINT [' + @var87 + '];');
    ALTER TABLE [Partners] ADD DEFAULT '2023-05-18T16:53:48.2901095Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var88 sysname;
    SELECT @var88 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var88 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var88 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-18T16:53:48.2894937Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var89 sysname;
    SELECT @var89 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var89 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var89 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-18T16:53:48.2893846Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var90 sysname;
    SELECT @var90 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var90 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var90 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-18T16:53:48.2893219Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var91 sysname;
    SELECT @var91 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'Description');
    IF @var91 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var91 + '];');
    ALTER TABLE [Faq] ALTER COLUMN [Description] nvarchar(500) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var92 sysname;
    SELECT @var92 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var92 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var92 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-18T16:53:48.2886764Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var93 sysname;
    SELECT @var93 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var93 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var93 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-18T16:53:48.2880719Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var94 sysname;
    SELECT @var94 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var94 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var94 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-18T16:53:48.2880109Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    DECLARE @var95 sysname;
    SELECT @var95 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var95 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var95 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-18T16:53:48.2873807Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518165348_editFaqTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230518165348_editFaqTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DROP TABLE [Partners];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var96 sysname;
    SELECT @var96 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'ImageUrL');
    IF @var96 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var96 + '];');
    ALTER TABLE [Feature] DROP COLUMN [ImageUrL];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var97 sysname;
    SELECT @var97 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var97 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var97 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-18T17:15:15.4541106Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var98 sysname;
    SELECT @var98 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var98 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var98 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-18T17:15:15.4536820Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var99 sysname;
    SELECT @var99 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var99 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var99 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-18T17:15:15.4536190Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var100 sysname;
    SELECT @var100 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var100 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var100 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-18T17:15:15.4541495Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var101 sysname;
    SELECT @var101 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var101 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var101 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-05-18T17:15:15.4541908Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var102 sysname;
    SELECT @var102 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var102 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var102 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-18T17:15:15.4535695Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var103 sysname;
    SELECT @var103 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var103 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var103 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-18T17:15:15.4521365Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var104 sysname;
    SELECT @var104 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var104 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var104 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-18T17:15:15.4520521Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var105 sysname;
    SELECT @var105 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var105 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var105 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-18T17:15:15.4519884Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var106 sysname;
    SELECT @var106 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var106 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var106 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-18T17:15:15.4515684Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var107 sysname;
    SELECT @var107 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var107 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var107 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-18T17:15:15.4511381Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var108 sysname;
    SELECT @var108 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var108 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var108 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-18T17:15:15.4510925Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    DECLARE @var109 sysname;
    SELECT @var109 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var109 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var109 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-18T17:15:15.4506314Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230518171515_deletePartnerandEditImageUrlonFeatureTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230518171515_deletePartnerandEditImageUrlonFeatureTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var110 sysname;
    SELECT @var110 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var110 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var110 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-25T14:02:11.1006265Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var111 sysname;
    SELECT @var111 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var111 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var111 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-25T14:02:11.0997155Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var112 sysname;
    SELECT @var112 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var112 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var112 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-25T14:02:11.0995982Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var113 sysname;
    SELECT @var113 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var113 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var113 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-25T14:02:11.1007320Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var114 sysname;
    SELECT @var114 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var114 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var114 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-05-25T14:02:11.1008065Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var115 sysname;
    SELECT @var115 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var115 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var115 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-25T14:02:11.0995007Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var116 sysname;
    SELECT @var116 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var116 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var116 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-25T14:02:11.0966246Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var117 sysname;
    SELECT @var117 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var117 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var117 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-25T14:02:11.0964968Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var118 sysname;
    SELECT @var118 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var118 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var118 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-25T14:02:11.0964152Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var119 sysname;
    SELECT @var119 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var119 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var119 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-25T14:02:11.0956372Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var120 sysname;
    SELECT @var120 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var120 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var120 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-25T14:02:11.0948389Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var121 sysname;
    SELECT @var121 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var121 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var121 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-25T14:02:11.0947494Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    DECLARE @var122 sysname;
    SELECT @var122 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var122 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var122 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-25T14:02:11.0938879Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [FullName] nvarchar(max) NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230525140211_addUserTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230525140211_addUserTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var123 sysname;
    SELECT @var123 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'ImageUrl');
    IF @var123 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var123 + '];');
    ALTER TABLE [Movie] DROP COLUMN [ImageUrl];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var124 sysname;
    SELECT @var124 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var124 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var124 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-30T14:45:09.6532030Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var125 sysname;
    SELECT @var125 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var125 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var125 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-30T14:45:09.6521481Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var126 sysname;
    SELECT @var126 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var126 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var126 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-30T14:45:09.6520265Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var127 sysname;
    SELECT @var127 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var127 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var127 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-30T14:45:09.6532843Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var128 sysname;
    SELECT @var128 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var128 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var128 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-05-30T14:45:09.6533641Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var129 sysname;
    SELECT @var129 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var129 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var129 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-30T14:45:09.6519434Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var130 sysname;
    SELECT @var130 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var130 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var130 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-30T14:45:09.6489306Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var131 sysname;
    SELECT @var131 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var131 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var131 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-30T14:45:09.6487543Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var132 sysname;
    SELECT @var132 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var132 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var132 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-30T14:45:09.6486691Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var133 sysname;
    SELECT @var133 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var133 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var133 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-30T14:45:09.6478036Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var134 sysname;
    SELECT @var134 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var134 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var134 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-30T14:45:09.6468842Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var135 sysname;
    SELECT @var135 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var135 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var135 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-30T14:45:09.6467798Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    DECLARE @var136 sysname;
    SELECT @var136 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var136 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var136 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-30T14:45:09.6457577Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144509_editMovieTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230530144509_editMovieTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var137 sysname;
    SELECT @var137 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var137 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var137 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-30T14:46:06.5816643Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var138 sysname;
    SELECT @var138 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var138 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var138 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-30T14:46:06.5806505Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var139 sysname;
    SELECT @var139 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var139 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var139 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-30T14:46:06.5805468Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var140 sysname;
    SELECT @var140 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var140 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var140 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-30T14:46:06.5817367Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var141 sysname;
    SELECT @var141 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var141 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var141 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-05-30T14:46:06.5820094Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var142 sysname;
    SELECT @var142 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var142 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var142 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-30T14:46:06.5804716Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var143 sysname;
    SELECT @var143 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var143 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var143 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-30T14:46:06.5768617Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    ALTER TABLE [Movie] ADD [ImageUrl] varbinary(max) NOT NULL DEFAULT 0x;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var144 sysname;
    SELECT @var144 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var144 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var144 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-30T14:46:06.5767144Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var145 sysname;
    SELECT @var145 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var145 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var145 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-30T14:46:06.5766178Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var146 sysname;
    SELECT @var146 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var146 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var146 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-30T14:46:06.5754836Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var147 sysname;
    SELECT @var147 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var147 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var147 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-30T14:46:06.5744999Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var148 sysname;
    SELECT @var148 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var148 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var148 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-30T14:46:06.5742797Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    DECLARE @var149 sysname;
    SELECT @var149 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var149 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var149 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-30T14:46:06.5731383Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530144606_editMovieTables')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230530144606_editMovieTables', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var150 sysname;
    SELECT @var150 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var150 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var150 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-30T14:55:53.1904130Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var151 sysname;
    SELECT @var151 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var151 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var151 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-30T14:55:53.1887748Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var152 sysname;
    SELECT @var152 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var152 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var152 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-30T14:55:53.1886547Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var153 sysname;
    SELECT @var153 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var153 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var153 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-30T14:55:53.1904993Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var154 sysname;
    SELECT @var154 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var154 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var154 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-05-30T14:55:53.1905794Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var155 sysname;
    SELECT @var155 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var155 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var155 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-30T14:55:53.1885642Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var156 sysname;
    SELECT @var156 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var156 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var156 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-30T14:55:53.1858005Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var157 sysname;
    SELECT @var157 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var157 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var157 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-30T14:55:53.1856617Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var158 sysname;
    SELECT @var158 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var158 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var158 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-30T14:55:53.1855847Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var159 sysname;
    SELECT @var159 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var159 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var159 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-30T14:55:53.1847442Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var160 sysname;
    SELECT @var160 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var160 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var160 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-30T14:55:53.1835975Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var161 sysname;
    SELECT @var161 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var161 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var161 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-30T14:55:53.1834983Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    DECLARE @var162 sysname;
    SELECT @var162 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var162 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var162 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-30T14:55:53.1825767Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530145553_editMovieTabless')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230530145553_editMovieTabless', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var163 sysname;
    SELECT @var163 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var163 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var163 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-05-30T15:47:34.6019179Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var164 sysname;
    SELECT @var164 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var164 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var164 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-05-30T15:47:34.6011954Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var165 sysname;
    SELECT @var165 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var165 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var165 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-05-30T15:47:34.6010803Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var166 sysname;
    SELECT @var166 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var166 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var166 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-05-30T15:47:34.6020058Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var167 sysname;
    SELECT @var167 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var167 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var167 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-05-30T15:47:34.6020789Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var168 sysname;
    SELECT @var168 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var168 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var168 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-05-30T15:47:34.6009982Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var169 sysname;
    SELECT @var169 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'ImageUrl');
    IF @var169 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var169 + '];');
    ALTER TABLE [Movie] ALTER COLUMN [ImageUrl] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var170 sysname;
    SELECT @var170 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var170 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var170 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-05-30T15:47:34.5984332Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var171 sysname;
    SELECT @var171 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var171 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var171 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-05-30T15:47:34.5982654Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var172 sysname;
    SELECT @var172 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var172 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var172 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-05-30T15:47:34.5981513Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var173 sysname;
    SELECT @var173 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var173 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var173 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-05-30T15:47:34.5973418Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var174 sysname;
    SELECT @var174 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var174 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var174 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-05-30T15:47:34.5964715Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var175 sysname;
    SELECT @var175 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var175 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var175 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-05-30T15:47:34.5963797Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    DECLARE @var176 sysname;
    SELECT @var176 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var176 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var176 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-05-30T15:47:34.5954834Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230530154734_editImageUrl')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230530154734_editImageUrl', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var177 sysname;
    SELECT @var177 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var177 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var177 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-06-01T08:06:12.3783063Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var178 sysname;
    SELECT @var178 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var178 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var178 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-01T08:06:12.3773404Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var179 sysname;
    SELECT @var179 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var179 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var179 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-01T08:06:12.3772274Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var180 sysname;
    SELECT @var180 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var180 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var180 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-01T08:06:12.3783844Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var181 sysname;
    SELECT @var181 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var181 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var181 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-01T08:06:12.3784606Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var182 sysname;
    SELECT @var182 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var182 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var182 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-01T08:06:12.3771336Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var183 sysname;
    SELECT @var183 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var183 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var183 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-01T08:06:12.3739481Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    ALTER TABLE [Movie] ADD [VideoUrl] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var184 sysname;
    SELECT @var184 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var184 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var184 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-01T08:06:12.3737554Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var185 sysname;
    SELECT @var185 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var185 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var185 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-01T08:06:12.3735200Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var186 sysname;
    SELECT @var186 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var186 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var186 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-01T08:06:12.3726072Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var187 sysname;
    SELECT @var187 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var187 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var187 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-01T08:06:12.3716132Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var188 sysname;
    SELECT @var188 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var188 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var188 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-01T08:06:12.3715204Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    DECLARE @var189 sysname;
    SELECT @var189 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var189 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var189 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-01T08:06:12.3702141Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601080612_addVideourl')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230601080612_addVideourl', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var190 sysname;
    SELECT @var190 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var190 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var190 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-06-01T08:39:22.0731008Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var191 sysname;
    SELECT @var191 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var191 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var191 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-01T08:39:22.0714202Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var192 sysname;
    SELECT @var192 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var192 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var192 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-01T08:39:22.0711168Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var193 sysname;
    SELECT @var193 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var193 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var193 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-01T08:39:22.0731794Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var194 sysname;
    SELECT @var194 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var194 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var194 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-01T08:39:22.0732583Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var195 sysname;
    SELECT @var195 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var195 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var195 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-01T08:39:22.0709839Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var196 sysname;
    SELECT @var196 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'Raiting');
    IF @var196 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var196 + '];');
    ALTER TABLE [Movie] ALTER COLUMN [Raiting] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var197 sysname;
    SELECT @var197 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var197 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var197 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-01T08:39:22.0675974Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var198 sysname;
    SELECT @var198 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var198 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var198 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-01T08:39:22.0674738Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var199 sysname;
    SELECT @var199 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var199 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var199 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-01T08:39:22.0673969Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var200 sysname;
    SELECT @var200 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var200 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var200 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-01T08:39:22.0666152Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var201 sysname;
    SELECT @var201 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var201 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var201 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-01T08:39:22.0657971Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var202 sysname;
    SELECT @var202 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var202 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var202 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-01T08:39:22.0657113Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    DECLARE @var203 sysname;
    SELECT @var203 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var203 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var203 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-01T08:39:22.0648117Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601083922_editRaiting')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230601083922_editRaiting', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var204 sysname;
    SELECT @var204 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var204 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var204 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-06-01T14:47:08.8902933Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var205 sysname;
    SELECT @var205 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var205 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var205 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-01T14:47:08.8895669Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var206 sysname;
    SELECT @var206 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var206 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var206 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-01T14:47:08.8894672Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var207 sysname;
    SELECT @var207 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var207 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var207 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-01T14:47:08.8903571Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var208 sysname;
    SELECT @var208 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var208 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var208 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-01T14:47:08.8904265Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var209 sysname;
    SELECT @var209 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var209 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var209 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-01T14:47:08.8893994Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var210 sysname;
    SELECT @var210 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'Description');
    IF @var210 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var210 + '];');
    ALTER TABLE [Movie] ALTER COLUMN [Description] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var211 sysname;
    SELECT @var211 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var211 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var211 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-01T14:47:08.8869384Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var212 sysname;
    SELECT @var212 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var212 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var212 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-01T14:47:08.8868127Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var213 sysname;
    SELECT @var213 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var213 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var213 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-01T14:47:08.8867380Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var214 sysname;
    SELECT @var214 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var214 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var214 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-01T14:47:08.8859598Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var215 sysname;
    SELECT @var215 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var215 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var215 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-01T14:47:08.8850951Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var216 sysname;
    SELECT @var216 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var216 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var216 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-01T14:47:08.8849766Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    DECLARE @var217 sysname;
    SELECT @var217 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var217 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var217 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-01T14:47:08.8840561Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230601144709_editMovie')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230601144709_editMovie', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var218 sysname;
    SELECT @var218 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'ImageUrl');
    IF @var218 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var218 + '];');
    ALTER TABLE [Social] DROP COLUMN [ImageUrl];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var219 sysname;
    SELECT @var219 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Social]') AND [c].[name] = N'CreatedTime');
    IF @var219 IS NOT NULL EXEC(N'ALTER TABLE [Social] DROP CONSTRAINT [' + @var219 + '];');
    ALTER TABLE [Social] ADD DEFAULT '2023-06-03T00:28:09.2354940Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var220 sysname;
    SELECT @var220 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var220 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var220 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-03T00:28:09.2345341Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var221 sysname;
    SELECT @var221 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var221 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var221 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-03T00:28:09.2344146Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var222 sysname;
    SELECT @var222 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var222 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var222 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-03T00:28:09.2356011Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var223 sysname;
    SELECT @var223 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var223 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var223 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-03T00:28:09.2356887Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var224 sysname;
    SELECT @var224 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var224 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var224 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-03T00:28:09.2343399Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var225 sysname;
    SELECT @var225 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var225 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var225 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-03T00:28:09.2310846Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var226 sysname;
    SELECT @var226 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var226 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var226 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-03T00:28:09.2309677Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var227 sysname;
    SELECT @var227 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var227 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var227 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-03T00:28:09.2308737Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var228 sysname;
    SELECT @var228 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var228 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var228 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-03T00:28:09.2298504Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var229 sysname;
    SELECT @var229 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var229 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var229 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-03T00:28:09.2288040Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var230 sysname;
    SELECT @var230 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var230 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var230 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-03T00:28:09.2286851Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    DECLARE @var231 sysname;
    SELECT @var231 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var231 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var231 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-03T00:28:09.2276823Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603002809_editSocial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230603002809_editSocial', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DROP TABLE [Social];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var232 sysname;
    SELECT @var232 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var232 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var232 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-03T01:06:40.2169264Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var233 sysname;
    SELECT @var233 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var233 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var233 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-03T01:06:40.2168375Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var234 sysname;
    SELECT @var234 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var234 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var234 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-03T01:06:40.2169821Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var235 sysname;
    SELECT @var235 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var235 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var235 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-03T01:06:40.2170358Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var236 sysname;
    SELECT @var236 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var236 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var236 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-03T01:06:40.2167735Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var237 sysname;
    SELECT @var237 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var237 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var237 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-03T01:06:40.2142931Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var238 sysname;
    SELECT @var238 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var238 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var238 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-03T01:06:40.2141881Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var239 sysname;
    SELECT @var239 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var239 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var239 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-03T01:06:40.2141058Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var240 sysname;
    SELECT @var240 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var240 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var240 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-03T01:06:40.2134050Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var241 sysname;
    SELECT @var241 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var241 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var241 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-03T01:06:40.2126420Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var242 sysname;
    SELECT @var242 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var242 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var242 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-03T01:06:40.2125435Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    DECLARE @var243 sysname;
    SELECT @var243 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var243 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var243 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-03T01:06:40.2118052Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603010640_removeSocialTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230603010640_removeSocialTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var244 sysname;
    SELECT @var244 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var244 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var244 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-03T19:24:33.5564936Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var245 sysname;
    SELECT @var245 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var245 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var245 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-03T19:24:33.5563667Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var246 sysname;
    SELECT @var246 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var246 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var246 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-03T19:24:33.5565615Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var247 sysname;
    SELECT @var247 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var247 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var247 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-03T19:24:33.5566253Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var248 sysname;
    SELECT @var248 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var248 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var248 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-03T19:24:33.5562820Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var249 sysname;
    SELECT @var249 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var249 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var249 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-03T19:24:33.5537925Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    ALTER TABLE [Movie] ADD [BackgroundImage] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var250 sysname;
    SELECT @var250 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var250 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var250 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-03T19:24:33.5536435Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var251 sysname;
    SELECT @var251 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var251 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var251 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-03T19:24:33.5535618Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var252 sysname;
    SELECT @var252 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var252 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var252 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-03T19:24:33.5528363Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var253 sysname;
    SELECT @var253 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var253 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var253 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-03T19:24:33.5520951Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var254 sysname;
    SELECT @var254 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var254 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var254 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-03T19:24:33.5519960Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    DECLARE @var255 sysname;
    SELECT @var255 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var255 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var255 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-03T19:24:33.5511592Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230603192433_addImageProperty')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230603192433_addImageProperty', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var256 sysname;
    SELECT @var256 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var256 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var256 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-06T13:29:09.5854270Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var257 sysname;
    SELECT @var257 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var257 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var257 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-06T13:29:09.5850860Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var258 sysname;
    SELECT @var258 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var258 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var258 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-06T13:29:09.5855162Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var259 sysname;
    SELECT @var259 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var259 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var259 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-06T13:29:09.5857243Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var260 sysname;
    SELECT @var260 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var260 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var260 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-06T13:29:09.5849961Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var261 sysname;
    SELECT @var261 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var261 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var261 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-06T13:29:09.5819844Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var262 sysname;
    SELECT @var262 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var262 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var262 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-06T13:29:09.5817269Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var263 sysname;
    SELECT @var263 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var263 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var263 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-06T13:29:09.5816387Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var264 sysname;
    SELECT @var264 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var264 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var264 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-06T13:29:09.5807667Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var265 sysname;
    SELECT @var265 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var265 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var265 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-06T13:29:09.5798619Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var266 sysname;
    SELECT @var266 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var266 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var266 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-06T13:29:09.5797501Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    DECLARE @var267 sysname;
    SELECT @var267 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var267 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var267 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-06T13:29:09.5788692Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    CREATE TABLE [Comment] (
        [Id] int NOT NULL IDENTITY,
        [Message] nvarchar(max) NOT NULL,
        [AppUserId] nvarchar(450) NOT NULL,
        [MovieId] int NOT NULL,
        [isDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [CreatedTime] datetime2 NOT NULL DEFAULT '2023-06-06T13:29:09.5885648Z',
        CONSTRAINT [PK_Comment] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Comment_AspNetUsers_AppUserId] FOREIGN KEY ([AppUserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Comment_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    CREATE INDEX [IX_Comment_AppUserId] ON [Comment] ([AppUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    CREATE INDEX [IX_Comment_MovieId] ON [Comment] ([MovieId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606132909_addCommentTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230606132909_addCommentTable', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var268 sysname;
    SELECT @var268 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var268 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var268 + '];');
    ALTER TABLE [Serie] ADD DEFAULT '2023-06-06T13:37:40.5282171Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var269 sysname;
    SELECT @var269 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var269 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var269 + '];');
    ALTER TABLE [Season] ADD DEFAULT '2023-06-06T13:37:40.5281009Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var270 sysname;
    SELECT @var270 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var270 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var270 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-06T13:37:40.5282923Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var271 sysname;
    SELECT @var271 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var271 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var271 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-06T13:37:40.5283687Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var272 sysname;
    SELECT @var272 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var272 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var272 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-06T13:37:40.5280075Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var273 sysname;
    SELECT @var273 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var273 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var273 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-06T13:37:40.5252873Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var274 sysname;
    SELECT @var274 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var274 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var274 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-06T13:37:40.5251174Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var275 sysname;
    SELECT @var275 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var275 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var275 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-06T13:37:40.5250237Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var276 sysname;
    SELECT @var276 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var276 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var276 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-06T13:37:40.5240301Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var277 sysname;
    SELECT @var277 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var277 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var277 + '];');
    ALTER TABLE [Episode] ADD DEFAULT '2023-06-06T13:37:40.5231902Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var278 sysname;
    SELECT @var278 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var278 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var278 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-06T13:37:40.5230717Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var279 sysname;
    SELECT @var279 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Comment]') AND [c].[name] = N'CreatedTime');
    IF @var279 IS NOT NULL EXEC(N'ALTER TABLE [Comment] DROP CONSTRAINT [' + @var279 + '];');
    ALTER TABLE [Comment] ADD DEFAULT '2023-06-06T13:37:40.5284445Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    DECLARE @var280 sysname;
    SELECT @var280 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var280 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var280 + '];');
    ALTER TABLE [Actress] ADD DEFAULT '2023-06-06T13:37:40.5222374Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230606133740_edit')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230606133740_edit', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var281 sysname;
    SELECT @var281 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'isDeleted');
    IF @var281 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var281 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var282 sysname;
    SELECT @var282 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'Name');
    IF @var282 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var282 + '];');
    ALTER TABLE [Serie] ALTER COLUMN [Name] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var283 sysname;
    SELECT @var283 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'Description');
    IF @var283 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var283 + '];');
    ALTER TABLE [Serie] ALTER COLUMN [Description] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var284 sysname;
    SELECT @var284 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Serie]') AND [c].[name] = N'CreatedTime');
    IF @var284 IS NOT NULL EXEC(N'ALTER TABLE [Serie] DROP CONSTRAINT [' + @var284 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var285 sysname;
    SELECT @var285 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'isDeleted');
    IF @var285 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var285 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var286 sysname;
    SELECT @var286 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Season]') AND [c].[name] = N'CreatedTime');
    IF @var286 IS NOT NULL EXEC(N'ALTER TABLE [Season] DROP CONSTRAINT [' + @var286 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var287 sysname;
    SELECT @var287 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var287 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var287 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-15T11:48:35.3336495Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var288 sysname;
    SELECT @var288 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var288 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var288 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-15T11:48:35.3337856Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var289 sysname;
    SELECT @var289 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var289 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var289 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-15T11:48:35.3334911Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var290 sysname;
    SELECT @var290 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var290 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var290 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-15T11:48:35.3294082Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var291 sysname;
    SELECT @var291 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var291 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var291 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-15T11:48:35.3292168Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var292 sysname;
    SELECT @var292 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var292 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var292 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-15T11:48:35.3290686Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var293 sysname;
    SELECT @var293 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var293 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var293 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-15T11:48:35.3279153Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var294 sysname;
    SELECT @var294 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'isDeleted');
    IF @var294 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var294 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var295 sysname;
    SELECT @var295 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'EpisodeTitle');
    IF @var295 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var295 + '];');
    ALTER TABLE [Episode] ALTER COLUMN [EpisodeTitle] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var296 sysname;
    SELECT @var296 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Episode]') AND [c].[name] = N'CreatedTime');
    IF @var296 IS NOT NULL EXEC(N'ALTER TABLE [Episode] DROP CONSTRAINT [' + @var296 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var297 sysname;
    SELECT @var297 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var297 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var297 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-15T11:48:35.3267320Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var298 sysname;
    SELECT @var298 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Comment]') AND [c].[name] = N'CreatedTime');
    IF @var298 IS NOT NULL EXEC(N'ALTER TABLE [Comment] DROP CONSTRAINT [' + @var298 + '];');
    ALTER TABLE [Comment] ADD DEFAULT '2023-06-15T11:48:35.3339204Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var299 sysname;
    SELECT @var299 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'isDeleted');
    IF @var299 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var299 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    DECLARE @var300 sysname;
    SELECT @var300 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actress]') AND [c].[name] = N'CreatedTime');
    IF @var300 IS NOT NULL EXEC(N'ALTER TABLE [Actress] DROP CONSTRAINT [' + @var300 + '];');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615114835_editThings')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230615114835_editThings', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var301 sysname;
    SELECT @var301 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var301 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var301 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-15T12:13:20.5146584Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var302 sysname;
    SELECT @var302 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var302 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var302 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-15T12:13:20.5147040Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var303 sysname;
    SELECT @var303 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var303 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var303 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-15T12:13:20.5146175Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var304 sysname;
    SELECT @var304 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var304 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var304 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-15T12:13:20.5145698Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var305 sysname;
    SELECT @var305 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var305 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var305 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-15T12:13:20.5144718Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var306 sysname;
    SELECT @var306 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var306 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var306 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-15T12:13:20.5144229Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var307 sysname;
    SELECT @var307 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var307 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var307 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-15T12:13:20.5139487Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var308 sysname;
    SELECT @var308 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var308 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var308 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-15T12:13:20.5134564Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    DECLARE @var309 sysname;
    SELECT @var309 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Comment]') AND [c].[name] = N'CreatedTime');
    IF @var309 IS NOT NULL EXEC(N'ALTER TABLE [Comment] DROP CONSTRAINT [' + @var309 + '];');
    ALTER TABLE [Comment] ADD DEFAULT '2023-06-15T12:13:20.5147627Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [PlanId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    CREATE INDEX [IX_AspNetUsers_PlanId] ON [AspNetUsers] ([PlanId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    ALTER TABLE [AspNetUsers] ADD CONSTRAINT [FK_AspNetUsers_PricingPlans_PlanId] FOREIGN KEY ([PlanId]) REFERENCES [PricingPlans] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230615121320_addUserPlan')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230615121320_addUserPlan', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var310 sysname;
    SELECT @var310 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var310 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var310 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-16T08:23:36.6534730Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var311 sysname;
    SELECT @var311 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var311 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var311 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-16T08:23:36.6535438Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var312 sysname;
    SELECT @var312 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var312 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var312 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-16T08:23:36.6534146Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var313 sysname;
    SELECT @var313 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var313 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var313 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-16T08:23:36.6533423Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    ALTER TABLE [Movie] ADD [DisLikeCount] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    ALTER TABLE [Movie] ADD [LikeCount] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var314 sysname;
    SELECT @var314 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var314 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var314 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-16T08:23:36.6532304Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var315 sysname;
    SELECT @var315 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var315 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var315 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-16T08:23:36.6531529Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var316 sysname;
    SELECT @var316 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var316 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var316 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-16T08:23:36.6524975Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var317 sysname;
    SELECT @var317 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var317 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var317 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-16T08:23:36.6518257Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    DECLARE @var318 sysname;
    SELECT @var318 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Comment]') AND [c].[name] = N'CreatedTime');
    IF @var318 IS NOT NULL EXEC(N'ALTER TABLE [Comment] DROP CONSTRAINT [' + @var318 + '];');
    ALTER TABLE [Comment] ADD DEFAULT '2023-06-16T08:23:36.6536080Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    CREATE TABLE [MovieRaiting] (
        [Id] int NOT NULL IDENTITY,
        [UserId1] nvarchar(450) NOT NULL,
        [UserId] int NOT NULL,
        [MovieId] int NOT NULL,
        [LikeActive] bit NOT NULL,
        [DisLikeActive] bit NOT NULL,
        CONSTRAINT [PK_MovieRaiting] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_MovieRaiting_AspNetUsers_UserId1] FOREIGN KEY ([UserId1]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_MovieRaiting_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    CREATE INDEX [IX_MovieRaiting_MovieId] ON [MovieRaiting] ([MovieId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    CREATE INDEX [IX_MovieRaiting_UserId1] ON [MovieRaiting] ([UserId1]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616082336_editLike')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230616082336_editLike', N'6.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    ALTER TABLE [MovieRaiting] DROP CONSTRAINT [FK_MovieRaiting_AspNetUsers_UserId1];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DROP INDEX [IX_MovieRaiting_UserId1] ON [MovieRaiting];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var319 sysname;
    SELECT @var319 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[MovieRaiting]') AND [c].[name] = N'UserId1');
    IF @var319 IS NOT NULL EXEC(N'ALTER TABLE [MovieRaiting] DROP CONSTRAINT [' + @var319 + '];');
    ALTER TABLE [MovieRaiting] DROP COLUMN [UserId1];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var320 sysname;
    SELECT @var320 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quality]') AND [c].[name] = N'CreatedTime');
    IF @var320 IS NOT NULL EXEC(N'ALTER TABLE [Quality] DROP CONSTRAINT [' + @var320 + '];');
    ALTER TABLE [Quality] ADD DEFAULT '2023-06-16T09:02:24.0230964Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var321 sysname;
    SELECT @var321 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'CreatedTime');
    IF @var321 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var321 + '];');
    ALTER TABLE [Property] ADD DEFAULT '2023-06-16T09:02:24.0231602Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var322 sysname;
    SELECT @var322 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PricingPlans]') AND [c].[name] = N'CreatedTime');
    IF @var322 IS NOT NULL EXEC(N'ALTER TABLE [PricingPlans] DROP CONSTRAINT [' + @var322 + '];');
    ALTER TABLE [PricingPlans] ADD DEFAULT '2023-06-16T09:02:24.0230433Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var323 sysname;
    SELECT @var323 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[MovieRaiting]') AND [c].[name] = N'UserId');
    IF @var323 IS NOT NULL EXEC(N'ALTER TABLE [MovieRaiting] DROP CONSTRAINT [' + @var323 + '];');
    ALTER TABLE [MovieRaiting] ALTER COLUMN [UserId] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var324 sysname;
    SELECT @var324 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movie]') AND [c].[name] = N'CreatedTime');
    IF @var324 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var324 + '];');
    ALTER TABLE [Movie] ADD DEFAULT '2023-06-16T09:02:24.0229793Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var325 sysname;
    SELECT @var325 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genre]') AND [c].[name] = N'CreatedTime');
    IF @var325 IS NOT NULL EXEC(N'ALTER TABLE [Genre] DROP CONSTRAINT [' + @var325 + '];');
    ALTER TABLE [Genre] ADD DEFAULT '2023-06-16T09:02:24.0228580Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var326 sysname;
    SELECT @var326 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Feature]') AND [c].[name] = N'CreatedTime');
    IF @var326 IS NOT NULL EXEC(N'ALTER TABLE [Feature] DROP CONSTRAINT [' + @var326 + '];');
    ALTER TABLE [Feature] ADD DEFAULT '2023-06-16T09:02:24.0227683Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var327 sysname;
    SELECT @var327 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Faq]') AND [c].[name] = N'CreatedTime');
    IF @var327 IS NOT NULL EXEC(N'ALTER TABLE [Faq] DROP CONSTRAINT [' + @var327 + '];');
    ALTER TABLE [Faq] ADD DEFAULT '2023-06-16T09:02:24.0221148Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var328 sysname;
    SELECT @var328 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Contact]') AND [c].[name] = N'CreatedTime');
    IF @var328 IS NOT NULL EXEC(N'ALTER TABLE [Contact] DROP CONSTRAINT [' + @var328 + '];');
    ALTER TABLE [Contact] ADD DEFAULT '2023-06-16T09:02:24.0214215Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    DECLARE @var329 sysname;
    SELECT @var329 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Comment]') AND [c].[name] = N'CreatedTime');
    IF @var329 IS NOT NULL EXEC(N'ALTER TABLE [Comment] DROP CONSTRAINT [' + @var329 + '];');
    ALTER TABLE [Comment] ADD DEFAULT '2023-06-16T09:02:24.0232389Z' FOR [CreatedTime];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    CREATE INDEX [IX_MovieRaiting_UserId] ON [MovieRaiting] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    ALTER TABLE [MovieRaiting] ADD CONSTRAINT [FK_MovieRaiting_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230616090224_update')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230616090224_update', N'6.0.5');
END;
GO

COMMIT;
GO

