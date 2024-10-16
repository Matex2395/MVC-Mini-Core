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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE TABLE [Empleados] (
        [id] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [LastName] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Empleados] PRIMARY KEY ([id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE TABLE [Proyectos] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Proyectos] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
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

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE TABLE [Tareas] (
        [Id] int NOT NULL IDENTITY,
        [Nombredelatarea] nvarchar(50) NOT NULL,
        [FechadeInicio] datetime2 NOT NULL,
        [tiempoestimado] float NOT NULL,
        [EstadoProgreso] nvarchar(max) NOT NULL,
        [proyectoId] int NOT NULL,
        [empleadoId] int NOT NULL,
        CONSTRAINT [PK_Tareas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Tareas_Empleados_empleadoId] FOREIGN KEY ([empleadoId]) REFERENCES [Empleados] ([id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Tareas_Proyectos_proyectoId] FOREIGN KEY ([proyectoId]) REFERENCES [Proyectos] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE INDEX [IX_Tareas_empleadoId] ON [Tareas] ([empleadoId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    CREATE INDEX [IX_Tareas_proyectoId] ON [Tareas] ([proyectoId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629145217_AddTableToDB'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240629145217_AddTableToDB', N'9.0.0-preview.5.24306.3');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629150935_SeedDataToEmpleado&Proyectos'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'id', N'LastName', N'Name') AND [object_id] = OBJECT_ID(N'[Empleados]'))
        SET IDENTITY_INSERT [Empleados] ON;
    EXEC(N'INSERT INTO [Empleados] ([id], [LastName], [Name])
    VALUES (1, N''Pérez'', N''Juan''),
    (2, N''González'', N''María''),
    (3, N''Martínez'', N''Carlos''),
    (4, N''Alvarez'', N''Guillermo''),
    (5, N''Torres'', N''Jair'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'id', N'LastName', N'Name') AND [object_id] = OBJECT_ID(N'[Empleados]'))
        SET IDENTITY_INSERT [Empleados] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629150935_SeedDataToEmpleado&Proyectos'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Proyectos]'))
        SET IDENTITY_INSERT [Proyectos] ON;
    EXEC(N'INSERT INTO [Proyectos] ([Id], [Name])
    VALUES (1, N''Proyecto A''),
    (2, N''Proyecto B''),
    (3, N''Proyecto C''),
    (4, N''Proyecto E'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Proyectos]'))
        SET IDENTITY_INSERT [Proyectos] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629150935_SeedDataToEmpleado&Proyectos'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240629150935_SeedDataToEmpleado&Proyectos', N'9.0.0-preview.5.24306.3');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629152301_SeedDataToTareas'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Nombredelatarea', N'FechadeInicio', N'tiempoestimado', N'EstadoProgreso', N'proyectoId', N'empleadoId') AND [object_id] = OBJECT_ID(N'[Tareas]'))
        SET IDENTITY_INSERT [Tareas] ON;
    EXEC(N'INSERT INTO [Tareas] ([Id], [Nombredelatarea], [FechadeInicio], [tiempoestimado], [EstadoProgreso], [proyectoId], [empleadoId])
    VALUES (1, N''Tarea 1'', ''2024-03-01T00:00:00.0000000'', 5.5E0, N''En progreso'', 1, 1),
    (2, N''Tarea 2'', ''2024-02-02T00:00:00.0000000'', 7.5E0, N''Completado'', 2, 2),
    (3, N''Tarea 3'', ''2024-01-03T00:00:00.0000000'', 3.0E0, N''En espera'', 3, 1),
    (4, N''Tarea 4'', ''2024-03-04T00:00:00.0000000'', 4.5E0, N''En progreso'', 1, 4),
    (5, N''Tarea 5'', ''2024-06-05T00:00:00.0000000'', 6.0E0, N''Completado'', 4, 5),
    (6, N''Tarea 6'', ''2024-05-06T00:00:00.0000000'', 2.5E0, N''En progreso'', 2, 2),
    (7, N''Tarea 7'', ''2024-02-07T00:00:00.0000000'', 8.0E0, N''En espera'', 3, 1),
    (8, N''Tarea 8'', ''2024-01-08T00:00:00.0000000'', 4.0E0, N''En progreso'', 1, 4),
    (9, N''Tarea 9'', ''2024-02-09T00:00:00.0000000'', 5.5E0, N''Completado'', 2, 1),
    (10, N''Tarea 10'', ''2024-10-10T00:00:00.0000000'', 7.0E0, N''En progreso'', 3, 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Nombredelatarea', N'FechadeInicio', N'tiempoestimado', N'EstadoProgreso', N'proyectoId', N'empleadoId') AND [object_id] = OBJECT_ID(N'[Tareas]'))
        SET IDENTITY_INSERT [Tareas] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240629152301_SeedDataToTareas'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240629152301_SeedDataToTareas', N'9.0.0-preview.5.24306.3');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241016141421_Connection String changed'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241016141421_Connection String changed', N'9.0.0-preview.5.24306.3');
END;
GO

COMMIT;
GO

