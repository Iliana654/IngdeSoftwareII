USE [master]
GO
/****** Object:  Database [SistemaCitasMedicas]    Script Date: 20/01/2025 10:14:42 ******/
CREATE DATABASE [SistemaCitasMedicas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaCitasMedicas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaCitasMedicas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaCitasMedicas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaCitasMedicas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaCitasMedicas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaCitasMedicas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaCitasMedicas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistemaCitasMedicas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaCitasMedicas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaCitasMedicas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaCitasMedicas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaCitasMedicas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemaCitasMedicas] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaCitasMedicas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaCitasMedicas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaCitasMedicas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaCitasMedicas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaCitasMedicas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaCitasMedicas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SistemaCitasMedicas] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaCitasMedicas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaCitasMedicas]
GO
/****** Object:  Table [dbo].[Cancelaciones]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancelaciones](
	[idCancelacion] [int] IDENTITY(1,1) NOT NULL,
	[idCita] [int] NOT NULL,
	[motivoCancelacion] [nvarchar](max) NOT NULL,
	[fechaCancelacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCancelacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[idCita] [int] IDENTITY(1,1) NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idMedico] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[motivo] [nvarchar](255) NULL,
	[estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentosMedicos]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentosMedicos](
	[idDocumento] [int] IDENTITY(1,1) NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idCita] [int] NULL,
	[tipoDocumento] [nvarchar](50) NOT NULL,
	[urlDocumento] [nvarchar](2083) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[fechaSubida] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[nombreEspecialidad] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombreEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorariosMedicos]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorariosMedicos](
	[idHorario] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[diaSemana] [nvarchar](20) NOT NULL,
	[horaInicio] [time](7) NOT NULL,
	[horaFin] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[numeroLicenciaMedica] [nvarchar](50) NOT NULL,
	[anosExperiencia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numeroLicenciaMedica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[sexo] [nvarchar](20) NOT NULL,
	[telefono] [nvarchar](15) NULL,
	[direccion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[idCita] [int] NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[metodoPago] [nvarchar](50) NOT NULL,
	[fechaPago] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/01/2025 10:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[correo] [nvarchar](100) NOT NULL,
	[contraseña] [nvarchar](255) NOT NULL,
	[rol] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cancelaciones] ADD  DEFAULT (getdate()) FOR [fechaCancelacion]
GO
ALTER TABLE [dbo].[DocumentosMedicos] ADD  DEFAULT (getdate()) FOR [fechaSubida]
GO
ALTER TABLE [dbo].[Pagos] ADD  DEFAULT (getdate()) FOR [fechaPago]
GO
ALTER TABLE [dbo].[Cancelaciones]  WITH CHECK ADD  CONSTRAINT [FK_Cancelaciones_Citas] FOREIGN KEY([idCita])
REFERENCES [dbo].[Citas] ([idCita])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cancelaciones] CHECK CONSTRAINT [FK_Cancelaciones_Citas]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Medicos] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medicos] ([idMedico])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Medicos]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Pacientes] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Pacientes] ([idPaciente])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Pacientes]
GO
ALTER TABLE [dbo].[DocumentosMedicos]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosMedicos_Citas] FOREIGN KEY([idCita])
REFERENCES [dbo].[Citas] ([idCita])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DocumentosMedicos] CHECK CONSTRAINT [FK_DocumentosMedicos_Citas]
GO
ALTER TABLE [dbo].[DocumentosMedicos]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosMedicos_Pacientes] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Pacientes] ([idPaciente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DocumentosMedicos] CHECK CONSTRAINT [FK_DocumentosMedicos_Pacientes]
GO
ALTER TABLE [dbo].[HorariosMedicos]  WITH CHECK ADD  CONSTRAINT [FK_HorariosMedicos_Medicos] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medicos] ([idMedico])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HorariosMedicos] CHECK CONSTRAINT [FK_HorariosMedicos_Medicos]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Especialidades] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidades] ([idEspecialidad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Especialidades]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Usuarios]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Usuarios]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Citas] FOREIGN KEY([idCita])
REFERENCES [dbo].[Citas] ([idCita])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Citas]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD CHECK  (([estado]='Completada' OR [estado]='Cancelada' OR [estado]='Confirmada' OR [estado]='Pendiente'))
GO
ALTER TABLE [dbo].[DocumentosMedicos]  WITH CHECK ADD CHECK  (([tipoDocumento]='Otro' OR [tipoDocumento]='Imagen' OR [tipoDocumento]='Examen' OR [tipoDocumento]='Receta'))
GO
ALTER TABLE [dbo].[HorariosMedicos]  WITH CHECK ADD CHECK  (([diaSemana]='Domingo' OR [diaSemana]='Sábado' OR [diaSemana]='Viernes' OR [diaSemana]='Jueves' OR [diaSemana]='Miércoles' OR [diaSemana]='Martes' OR [diaSemana]='Lunes'))
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD CHECK  (([sexo]='Otro' OR [sexo]='Femenino' OR [sexo]='Masculino'))
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD CHECK  (([metodoPago]='Transferencia' OR [metodoPago]='Tarjeta' OR [metodoPago]='Efectivo'))
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD CHECK  (([rol]='Administrador' OR [rol]='Médico' OR [rol]='Paciente'))
GO
USE [master]
GO
ALTER DATABASE [SistemaCitasMedicas] SET  READ_WRITE 
GO
