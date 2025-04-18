USE [master]
GO
/****** Object:  Database [Datawarehouse Laboratorio 1]    Script Date: 29/03/2024 22:31:52 ******/
CREATE DATABASE [Datawarehouse Laboratorio 1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseDatos2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Datawarehouse Laboratorio 1.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseDatos2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Datawarehouse Laboratorio 1_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Datawarehouse Laboratorio 1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET RECOVERY FULL 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET  MULTI_USER 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET QUERY_STORE = OFF
GO
USE [Datawarehouse Laboratorio 1]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 29/03/2024 22:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[PersonID] [int] NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 29/03/2024 22:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[BusinessEntityID] [int] NOT NULL,
	[PersonType] [nchar](2) NOT NULL,
	[NameStyle] [varchar](300) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [varchar](300) NOT NULL,
	[MiddleName] [varchar](300) NULL,
	[LastName] [varchar](300) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29/03/2024 22:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NOT NULL,
	[ReorderPoint] [smallint] NOT NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[DaysToManufacture] [int] NOT NULL,
	[ProductLine] [nchar](2) NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NOT NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderDetail]    Script Date: 29/03/2024 22:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetail](
	[SalesOrderID] [int] NOT NULL,
	[SalesOrderDetailID] [int] NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SpecialOfferID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[LineTotal] [money] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC,
	[SalesOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderHeader]    Script Date: 29/03/2024 22:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderHeader](
	[SalesOrderID] [int] NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NOT NULL,
	[SalesOrderNumber] [varchar](200) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NOT NULL,
	[ShipToAddressID] [int] NOT NULL,
	[ShipMethodID] [int] NOT NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue] [money] NOT NULL,
	[Comment] [nvarchar](128) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrder]    Script Date: 29/03/2024 22:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrder](
	[WorkOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderQty] [int] NOT NULL,
	[StockedQty] [int] NOT NULL,
	[ScrappedQty] [smallint] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[DueDate] [datetime] NOT NULL,
	[ScrapReasonID] [smallint] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkOrder_WorkOrderID] PRIMARY KEY CLUSTERED 
(
	[WorkOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
USE [master]
GO
ALTER DATABASE [Datawarehouse Laboratorio 1] SET  READ_WRITE 
GO
