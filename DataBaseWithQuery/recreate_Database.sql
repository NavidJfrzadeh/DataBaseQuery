USE [master]
GO

/****** Object:  Database [LibraryApp]    Script Date: 2/17/2024 2:40:54 PM ******/
CREATE DATABASE [LibraryApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryApp', FILENAME = N'C:\Users\Navid\LibraryApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryApp_log', FILENAME = N'C:\Users\Navid\LibraryApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [LibraryApp] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [LibraryApp] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [LibraryApp] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [LibraryApp] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [LibraryApp] SET ARITHABORT OFF 
GO

ALTER DATABASE [LibraryApp] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [LibraryApp] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [LibraryApp] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [LibraryApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [LibraryApp] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [LibraryApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [LibraryApp] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [LibraryApp] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [LibraryApp] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [LibraryApp] SET  ENABLE_BROKER 
GO

ALTER DATABASE [LibraryApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [LibraryApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [LibraryApp] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [LibraryApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [LibraryApp] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [LibraryApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [LibraryApp] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [LibraryApp] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [LibraryApp] SET  MULTI_USER 
GO

ALTER DATABASE [LibraryApp] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [LibraryApp] SET DB_CHAINING OFF 
GO

ALTER DATABASE [LibraryApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [LibraryApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [LibraryApp] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [LibraryApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [LibraryApp] SET QUERY_STORE = OFF
GO

ALTER DATABASE [LibraryApp] SET  READ_WRITE 
GO

