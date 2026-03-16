USE [master]
GO
/****** Object:  Database [CursoOnline]    Script Date: 16/03/2026 08:17:10 ******/
CREATE DATABASE [CursoOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CursoOnline', FILENAME = N'C:\Users\49006814822\CursoOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CursoOnline_log', FILENAME = N'C:\Users\49006814822\CursoOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CursoOnline] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CursoOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CursoOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CursoOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CursoOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CursoOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CursoOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [CursoOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CursoOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CursoOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CursoOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CursoOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CursoOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CursoOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CursoOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CursoOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CursoOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CursoOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CursoOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CursoOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CursoOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CursoOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CursoOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CursoOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CursoOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CursoOnline] SET  MULTI_USER 
GO
ALTER DATABASE [CursoOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CursoOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CursoOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CursoOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CursoOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CursoOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CursoOnline] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [CursoOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [CursoOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CursoOnline]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 16/03/2026 08:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aluno](
	[AlunoID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](60) NULL,
	[Email] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[AlunoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 16/03/2026 08:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[CursoID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](70) NOT NULL,
	[CargaHoraria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instrutor]    Script Date: 16/03/2026 08:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instrutor](
	[InstrutorID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](60) NOT NULL,
	[Especializacao] [varchar](70) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InstrutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 16/03/2026 08:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[CursoID] [int] NOT NULL,
	[AlunoID] [int] NOT NULL,
 CONSTRAINT [PK_MatriculaID] PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC,
	[AlunoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aluno] ON 
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (1, N'Renata Azevedo', N'renata.azevedo@email.com')
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (2, N'Beatriz Ribeiro', N'beatriz.ribeiro@email.com')
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (3, N'Rafael Lima', N'rafael.lima@email.com')
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (4, N'Pedro Santos', N'pedro.santos@email.com')
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (5, N'Larissa Martins', N'larissa.martins@email.com')
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (6, N'Diego Barbosa', N'diego.barbosa@email.com')
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (7, N'Felipe Rodrigues', N'felipe.rodrigues@email.com')
GO
INSERT [dbo].[Aluno] ([AlunoID], [Nome], [Email]) VALUES (8, N'Camila Ferreira', N'camila.ferreira@email.com')
GO
SET IDENTITY_INSERT [dbo].[Aluno] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 
GO
INSERT [dbo].[Curso] ([CursoID], [Nome], [CargaHoraria]) VALUES (1, N'Introdução à Informática', 20)
GO
INSERT [dbo].[Curso] ([CursoID], [Nome], [CargaHoraria]) VALUES (2, N'Pacote Office (Word, Excel, PowerPoint', 40)
GO
INSERT [dbo].[Curso] ([CursoID], [Nome], [CargaHoraria]) VALUES (3, N'Desenvolvimento Web (HTML, CSS, JS)', 80)
GO
INSERT [dbo].[Curso] ([CursoID], [Nome], [CargaHoraria]) VALUES (4, N'Lógica de Programação', 40)
GO
INSERT [dbo].[Curso] ([CursoID], [Nome], [CargaHoraria]) VALUES (5, N'Banco de Dados SQL', 50)
GO
INSERT [dbo].[Curso] ([CursoID], [Nome], [CargaHoraria]) VALUES (6, N'Excel Avançado', 30)
GO
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Instrutor] ON 
GO
INSERT [dbo].[Instrutor] ([InstrutorID], [Nome], [Especializacao]) VALUES (1, N'Carlos Silva', N'Introdução à Informática')
GO
INSERT [dbo].[Instrutor] ([InstrutorID], [Nome], [Especializacao]) VALUES (2, N'Mariana Costa', N'Pacote Office')
GO
INSERT [dbo].[Instrutor] ([InstrutorID], [Nome], [Especializacao]) VALUES (3, N'Bruno Nascimento', N'UX/UI, Front-End e Back-End')
GO
INSERT [dbo].[Instrutor] ([InstrutorID], [Nome], [Especializacao]) VALUES (4, N'Fernanda Souza', N'Lógica de Programação')
GO
INSERT [dbo].[Instrutor] ([InstrutorID], [Nome], [Especializacao]) VALUES (5, N'Eduardo Rodrigues', N'Banco de Dados SQL')
GO
SET IDENTITY_INSERT [dbo].[Instrutor] OFF
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaID_Aluno] FOREIGN KEY([AlunoID])
REFERENCES [dbo].[Aluno] ([AlunoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_MatriculaID_Aluno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaID_Curso] FOREIGN KEY([CursoID])
REFERENCES [dbo].[Curso] ([CursoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_MatriculaID_Curso]
GO
USE [master]
GO
ALTER DATABASE [CursoOnline] SET  READ_WRITE 
GO

