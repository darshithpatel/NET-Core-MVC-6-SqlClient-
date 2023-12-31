USE [master]
GO
/****** Object:  Database [BasicsCRUD]    Script Date: 20/10/2023 13:23:01 ******/
CREATE DATABASE [BasicsCRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BasicsCRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BasicsCRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BasicsCRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BasicsCRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BasicsCRUD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BasicsCRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BasicsCRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BasicsCRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BasicsCRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BasicsCRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BasicsCRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BasicsCRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BasicsCRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BasicsCRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BasicsCRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BasicsCRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BasicsCRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BasicsCRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BasicsCRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BasicsCRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BasicsCRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BasicsCRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BasicsCRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BasicsCRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BasicsCRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BasicsCRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BasicsCRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BasicsCRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BasicsCRUD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BasicsCRUD] SET  MULTI_USER 
GO
ALTER DATABASE [BasicsCRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BasicsCRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BasicsCRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BasicsCRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BasicsCRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BasicsCRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BasicsCRUD] SET QUERY_STORE = OFF
GO
USE [BasicsCRUD]
GO
/****** Object:  Table [dbo].[tblClients]    Script Date: 20/10/2023 13:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Gender] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblClients] ON 

INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (3, N'Abela', N'Tesfaye', 40, N'theweeknd@hotmail.com', N'Male')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (4, N'Nasir', N'Montero', 67, N'lilnas89@gmail.com', N'Other')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (6, N'Riya', N'Patel', 21, N'Riyadomadiya9@gmail.com', N'Female')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (7, N'Amay', N'Hirapara', 19, N'amaykoda@gmail.com', N'Male')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (10, N'Tyler', N'Glass', 29, N'lilbaby@yahho.co.in', N'Male')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (11, N'Johnathan', N'Wick', 44, N'ineedguns@hotmail.com', N'Male')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (12, N'Krisha', N'Johnson', 16, N'krisha134@gmail.com', N'Female')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (13, N'Nandlal', N'Chhanga', 35, N'nandlal@gmail.com', N'Male')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (14, N'Rajesh', N'Ahir', 24, N'rajesh.ahir@example.com', N'Male')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (15, N'Margi', N'Patel', 26, N'margip344@gmail.com', N'Female')
INSERT [dbo].[tblClients] ([ClientID], [FirstName], [LastName], [Age], [Email], [Gender]) VALUES (16, N'Riddhi', N'Patel', 24, N'rdpatel4@gmail.com', N'Female')
SET IDENTITY_INSERT [dbo].[tblClients] OFF
GO
/****** Object:  StoredProcedure [dbo].[PR_Clients_Delete]    Script Date: 20/10/2023 13:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Clients_Delete]
@ClientID int
AS 
DELETE
	FROM [dbo].[tblClients]
	WHERE [dbo].[tblClients].[ClientID] = @ClientID
GO
/****** Object:  StoredProcedure [dbo].[PR_Clients_Insert]    Script Date: 20/10/2023 13:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Clients_Insert]
@FirstName		varchar(100),
@LastName		varchar(100),
@Age		int,
@Email		varchar(100),
@Gender		varchar(50)
AS 
Insert into tblClients
(
	FirstName	
	,LastName	
	,Age
	,Email
	,Gender
)	
values
(
	@FirstName
	,@LastName
	,@Age
	,@Email
	,@Gender
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Clients_SelectAll]    Script Date: 20/10/2023 13:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Clients_SelectAll]
As
Select
	tblClients.ClientID,
	tblClients.FirstName,
	tblClients.LastName,
	tblClients.Age,
	tblClients.Email,
	tblClients.Gender
From tblClients
Order by FirstName,LastName
GO
/****** Object:  StoredProcedure [dbo].[PR_Clients_SelectByPK]    Script Date: 20/10/2023 13:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Clients_SelectByPK]
@ClientID	int
As
Select
	tblClients.ClientID,
	tblClients.FirstName,
	tblClients.LastName,
	tblClients.Age,
	tblClients.Email,
	tblClients.Gender
From tblClients
Where tblClients.ClientID = @ClientID
GO
/****** Object:  StoredProcedure [dbo].[PR_Clients_UpdateByPK]    Script Date: 20/10/2023 13:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Clients_UpdateByPK]
@ClientID			int,
@FirstName		varchar(100),
@LastName		varchar(100),
@Age		int,
@Email		varchar(100),
@Gender		varchar(50)
AS 
Update tblClients
SET 
	FirstName = @FirstName,
	LastName = @LastName,
	Age = @Age,
	Email = @Email,
	Gender = @Gender
Where tblCLients.ClientID = @ClientID
GO
USE [master]
GO
ALTER DATABASE [BasicsCRUD] SET  READ_WRITE 
GO
