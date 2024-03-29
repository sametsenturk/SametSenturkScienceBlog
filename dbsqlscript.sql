USE [master]
GO
/****** Object:  Database [SametSenturkScienceBlogDB]    Script Date: 14.06.2019 01:09:55 ******/
CREATE DATABASE [SametSenturkScienceBlogDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SametSenturkScienceBlogDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SametSenturkScienceBlogDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SametSenturkScienceBlogDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SametSenturkScienceBlogDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SametSenturkScienceBlogDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET  MULTI_USER 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET QUERY_STORE = OFF
GO
USE [SametSenturkScienceBlogDB]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 14.06.2019 01:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[AddDate] [datetime] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[FullContent] [varchar](max) NOT NULL,
	[SeeCount] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleCategory]    Script Date: 14.06.2019 01:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SeoName] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_ArticleCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleComment]    Script Date: 14.06.2019 01:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[FullContent] [nvarchar](350) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[IpAdress] [nchar](50) NOT NULL,
	[IsNotificationEnabled] [int] NOT NULL,
 CONSTRAINT [PK_ArticleComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleTagMapping]    Script Date: 14.06.2019 01:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTagMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_ArticleTagMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 14.06.2019 01:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SeoName] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14.06.2019 01:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ArticleCategory] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCategory]
GO
ALTER TABLE [dbo].[ArticleComment]  WITH CHECK ADD  CONSTRAINT [FK_ArticleComment_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[ArticleComment] CHECK CONSTRAINT [FK_ArticleComment_Article]
GO
ALTER TABLE [dbo].[ArticleTagMapping]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTagMapping_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[ArticleTagMapping] CHECK CONSTRAINT [FK_ArticleTagMapping_Article]
GO
ALTER TABLE [dbo].[ArticleTagMapping]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTagMapping_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[ArticleTagMapping] CHECK CONSTRAINT [FK_ArticleTagMapping_Tag]
GO
USE [master]
GO
ALTER DATABASE [SametSenturkScienceBlogDB] SET  READ_WRITE 
GO
