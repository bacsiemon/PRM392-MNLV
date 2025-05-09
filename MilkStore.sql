USE [master]
GO

CREATE DATABASE [MilkStore]
GO
ALTER DATABASE [MilkStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MilkStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MilkStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MilkStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MilkStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MilkStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MilkStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MilkStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MilkStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MilkStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MilkStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MilkStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MilkStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MilkStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MilkStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MilkStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MilkStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MilkStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MilkStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MilkStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MilkStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MilkStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MilkStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MilkStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MilkStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MilkStore] SET  MULTI_USER 
GO
ALTER DATABASE [MilkStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MilkStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MilkStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MilkStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MilkStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MilkStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MilkStore] SET QUERY_STORE = ON
GO
USE [MilkStore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [nvarchar](450) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gifts](
	[Id] [nvarchar](450) NOT NULL,
	[point] [int] NOT NULL,
	[GiftName] [nvarchar](max) NOT NULL,
	[ProductId] [nvarchar](450) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Gifts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailGifts](
	[Id] [nvarchar](450) NOT NULL,
	[OrderGiftId] [nvarchar](450) NULL,
	[Shipfee] [real] NULL,
	[GiftId] [nvarchar](450) NULL,
	[quantity] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_OrderDetailGifts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [nvarchar](450) NOT NULL,
	[OrderID] [nvarchar](450) NULL,
	[ProductID] [nvarchar](450) NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderGifts](
	[Id] [nvarchar](450) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_OrderGifts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/9/2024 8:04:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [nvarchar](450) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[OrderDate] [datetimeoffset](7) NOT NULL,
	[OrderStatuss] [int] NOT NULL,
	[PaymentStatuss] [int] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[DiscountedAmount] [float] NOT NULL,
	[ShippingAddress] [nvarchar](max) NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[estimatedDeliveryDate] [nvarchar](max) NOT NULL,
	[deliveryDate] [datetimeoffset](7) NULL,
	[IsInventoryUpdated] [bit] NOT NULL,
	[IsPointAdded] [bit] NOT NULL,
	[PointsAdded] [int] NOT NULL,
	[VoucherCode] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostProduct](
	[Id] [nvarchar](450) NOT NULL,
	[PostId] [nvarchar](450) NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_PostProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreOrders](
	[Id] [nvarchar](450) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[ProductID] [nvarchar](450) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_PreOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [nvarchar](450) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryId] [nvarchar](450) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [nvarchar](450) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[OrderDetailID] [nvarchar](450) NOT NULL,
	[ProductsID] [nvarchar](max) NOT NULL,
	[OrderID] [nvarchar](max) NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/9/2024 8:04:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistories](
	[Id] [nvarchar](450) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TransactionDate] [datetimeoffset](7) NOT NULL,
	[Type] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[BalanceAfterTransaction] [float] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_TransactionHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/9/2024 8:04:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Points] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ShippingAddress] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[Balance] [float] NOT NULL,
	[ManagerId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[Id] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SalePrice] [int] NOT NULL,
	[SalePercent] [int] NOT NULL,
	[LimitSalePrice] [int] NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
	[UsingLimit] [int] NOT NULL,
	[UsedCount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[VoucherCode] [nvarchar](6) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241018140658_Initial', N'8.0.8')
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'00b047e10f51443a9ec2dc6fffa8d28f', N'Quần áo cho mẹ bầu', NULL, NULL, NULL, CAST(N'2024-11-05T16:40:23.7257840+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:40:23.7257836+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1c3d49bc3e404c0cab354f77cb72aa53', N'Đồ dùng cho mẹ', NULL, NULL, NULL, CAST(N'2024-11-05T16:40:14.7569078+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:40:14.7569072+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1c813a3ff9a54e0cbdbc1f27a5d42126', N'test3', NULL, NULL, NULL, CAST(N'2024-10-31T14:22:24.9305349+00:00' AS DateTimeOffset), CAST(N'2024-10-31T21:22:24.9305346+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:40:40.4201621+00:00' AS DateTimeOffset))
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1c81516544d741e4856627f5561c0478', N'string', NULL, NULL, NULL, CAST(N'2024-11-02T17:44:31.7055126+00:00' AS DateTimeOffset), CAST(N'2024-11-03T00:44:31.7054342+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:40:37.6109913+00:00' AS DateTimeOffset))
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3d321af0e9384fe0ad652cc851cc6368', N'Đồ chơi', NULL, NULL, NULL, CAST(N'2024-11-05T16:40:09.2790264+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:40:09.2790259+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'70f9e6da83dd425189e1b448026ff57a', N'Quần áo cho bé', NULL, NULL, NULL, CAST(N'2024-11-05T16:40:18.9089056+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:40:18.9089051+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7f7e1df7adb141398a0d8b868008f5cc', N'Sữa và thực phẩm', NULL, NULL, NULL, CAST(N'2024-11-05T16:40:05.6095891+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:40:05.6095888+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'917ef5751c674c658fa92103b1badae9', N'Đồ dùng cho bé', NULL, NULL, NULL, CAST(N'2024-11-05T16:39:59.4677168+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:39:59.4676484+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'983f875447504355a8e576eab20b708c', N'Chăm sóc sức khỏe mẹ và bé', NULL, NULL, NULL, CAST(N'2024-11-05T16:40:34.8248199+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:40:34.8248195+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a632f0dade904b309a22bc65e43c8c81', N'Sản phẩm chăm sóc da', NULL, NULL, NULL, CAST(N'2024-11-05T16:40:30.2676778+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:40:30.2676774+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c71a62dc472d4aa180253f337fadc584', N'test2', NULL, NULL, NULL, CAST(N'2024-10-31T14:22:20.8103451+00:00' AS DateTimeOffset), CAST(N'2024-10-31T21:22:20.8102764+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:40:42.9154997+00:00' AS DateTimeOffset))
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c817f4b689924ecfa41b0b804563999c', N'test', NULL, NULL, NULL, CAST(N'2024-10-31T10:05:42.8313152+00:00' AS DateTimeOffset), CAST(N'2024-10-31T17:05:42.8311124+07:00' AS DateTimeOffset), CAST(N'2024-10-31T14:22:27.2856785+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[Gifts] ([Id], [point], [GiftName], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'08d1943d157340938b120d90a3e48b16', 20, N'Tã siêu thấm', N'1b7be0df0d734db9b05936eaaf60a8cc', NULL, NULL, NULL, CAST(N'2024-10-31T15:18:00.2463662+00:00' AS DateTimeOffset), CAST(N'2024-11-05T17:10:31.7205766+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Gifts] ([Id], [point], [GiftName], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5e5f7471829545ababfc29160bfe0f99', 120, N'Bỉm chống tràn', N'0bbbe18eb14840a99d05f81b05bf081e', NULL, NULL, NULL, CAST(N'2024-11-05T17:10:16.7897963+00:00' AS DateTimeOffset), CAST(N'2024-11-06T00:10:16.7896025+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Gifts] ([Id], [point], [GiftName], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'af2462b075a54cba818ad15f1a7fad97', 100, N'Test', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', NULL, NULL, NULL, CAST(N'2024-10-31T10:07:32.1423435+00:00' AS DateTimeOffset), CAST(N'2024-10-31T17:07:32.1421387+07:00' AS DateTimeOffset), CAST(N'2024-10-31T12:48:06.4954376+00:00' AS DateTimeOffset))
INSERT [dbo].[Gifts] ([Id], [point], [GiftName], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bcb214ed22e9403c81ffa9028da882c5', 50, N'Dầu gội cho bé', N'703b6590571b42b89ae2acb900537dd7', NULL, NULL, NULL, CAST(N'2024-10-31T12:56:49.0954138+00:00' AS DateTimeOffset), CAST(N'2024-11-05T17:10:47.6994332+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0118a1417b32466e8f6b2653bdf2c424', N'496c9b34bf6945d09eaabcf5cc54ebd8', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T21:51:16.5970417+07:00' AS DateTimeOffset), CAST(N'2024-11-05T21:51:16.5968090+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'048a7137cac147eea54df02c1f48b048', N'fb4c509e82be428a9ff6d649544ff704', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 1, 12, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:21:14.2026798+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:21:14.2026748+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'093fc9a964554c6e828ced95fbe615d3', N'fbf36d2cd3c941b79dc34e2948078140', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 1, 12, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T11:28:22.0478906+07:00' AS DateTimeOffset), CAST(N'2024-11-02T11:28:22.0478867+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'10157dab1ee14c16998e70703f953536', N'ee40068caacb4103aad8440130af5b0c', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:19:01.1214951+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:19:01.1213302+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2100387f07e2410f975bae420d6e3eba', N'7c6fb546dd654b37877c848dba677f35', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 4, 12, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T20:10:07.6077258+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:10:07.6077238+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'22ce808b7665401cb661cd605aae99d5', NULL, N'1156c4ca4eb34957966ad6444efc7165', 1, 129000, 0, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-06T09:03:41.8067367+07:00' AS DateTimeOffset), CAST(N'2024-11-06T09:03:41.8061712+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2a39de1fee2c431db67ac41bbb188256', N'a4413d4ff06d45f1981820fa025ddcfc', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:11:45.8899683+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:11:45.8895872+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2ae74633d14e4917bc72aa802b365a6c', N'26a061cd755642f9bad1330d2124953e', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T17:10:45.3091808+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:10:45.3091770+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3d1778c145334254810c313a5c21776a', NULL, N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 3, 12, 0, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-02T22:02:34.0780676+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:02:34.0778294+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3ef18faa497846299794eb0a354be025', N'0b1edfde86b84ffa803fc34ae69c1ad7', N'fa053f25c751400d83ef2a185e3d3c7d', 2, 23123, 1, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T18:02:16.8311594+07:00' AS DateTimeOffset), CAST(N'2024-11-02T18:02:16.8309457+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4440b496a7df4d8cb23746299d9644b9', N'eca0f3cbf597424e94d8a7894cedb782', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:13:23.2624035+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:13:23.2621533+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4650a099c61f49358e4ea7043d043de1', N'08e6722cd4b543a8928fd4f6f86bb75e', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 1, 12, 1, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T22:09:04.4764392+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:09:04.4764355+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5a88735840e44711b0b24eaae6183c17', N'5e47bcfa729a4a52a1cfa1c5203fadff', N'2b567a1357004fd7add478413fc3c120', 1, 1500000, 0, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-06T08:35:20.1120095+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:35:20.1120046+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6264104541dc450dbc3f5dc909ca932f', N'9f425d3cedb94b4ca6677e529c929e49', N'0bbbe18eb14840a99d05f81b05bf081e', 1, 35000, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-06T08:20:46.7465657+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:20:46.7461407+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6dc06784e58841838a5f0fcd5d9c87d4', N'7af3bc3685ad4fea88045e6295c4059a', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 1, 12, 1, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:04:36.8476387+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:04:36.8473775+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6ff02bdb8d4747ab921f0f85d322ee10', N'94f026e8d7f54058b4225c357ac8d4ba', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T22:18:13.3338239+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:18:13.3338203+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'77a13a358eb94c22851c263b63f10322', N'cc168a5156fc4e0088c7c9f25b024032', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 3, 12, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T20:39:12.2050520+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:39:12.2048812+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'786cc325718f47c38cae07925f4fcedb', N'fb4c509e82be428a9ff6d649544ff704', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T16:01:52.2197851+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:01:52.2195621+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a8c1f7a0b8e24531851dc4995111afed', N'c0a1cde1c7e943c0a35da92845005362', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 0, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:13:36.7238085+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:13:36.7238039+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:12:41.4883652+07:00' AS DateTimeOffset))
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'aa7ab00c111141a78f8559a34d2b33d3', N'6918b9c7b1ff47b49fd1c11f9c9155b4', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T17:22:33.1134184+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:22:33.1134155+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b917aae87d814402ae989b4af515b8b7', N'0b1edfde86b84ffa803fc34ae69c1ad7', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 2, 12, 1, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T10:18:47.5119188+07:00' AS DateTimeOffset), CAST(N'2024-11-02T10:18:47.5115495+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bbc3864b11d94af4afb1bfe5d4f58f99', N'fbf36d2cd3c941b79dc34e2948078140', N'fa053f25c751400d83ef2a185e3d3c7d', 18, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T11:39:14.7450980+07:00' AS DateTimeOffset), CAST(N'2024-11-02T11:39:14.7450931+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'be38347bc9734f05a74cc3488bbc1f0d', N'cc168a5156fc4e0088c7c9f25b024032', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T20:39:15.6338222+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:39:15.6338106+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c2c7a93e5fa748f5ac6fa4101fdb7ff3', N'7c6fb546dd654b37877c848dba677f35', N'fa053f25c751400d83ef2a185e3d3c7d', 7, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T16:28:23.4454794+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:28:23.4453078+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c99aa6bc0afe4ab3b4f53d426d022f28', N'94f026e8d7f54058b4225c357ac8d4ba', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 1, 12, 1, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T22:09:28.8638574+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:09:28.8638536+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cfd29fb1f51543e880949095318a4c2d', N'a4aa9c0a40dd422e818d8f5770633f5e', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', 1, 12, 1, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T22:45:31.6435702+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:45:31.6435668+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd55f739f61594276af06f64941198c5a', N'832fd770a4364f7b82e8a66675fc1bcc', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T20:04:04.7269788+07:00' AS DateTimeOffset), CAST(N'2024-11-05T20:04:04.7269764+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e45d8656f59a4411bcd55b8deb6affd5', N'9f425d3cedb94b4ca6677e529c929e49', N'703b6590571b42b89ae2acb900537dd7', 4, 149000, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-06T08:30:43.7249379+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:30:43.7249345+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e4ec6dcc7e904168bee88fd8de013fa0', N'd9f42d3afc8b44858b47db47ce3ab216', N'fa053f25c751400d83ef2a185e3d3c7d', 3, 23123, 0, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:31:07.7854945+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:31:07.7852600+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:27:57.7541290+07:00' AS DateTimeOffset))
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f7f2c351249f44c99ce8fc6c93442e5d', N'bae74700d0d34d8e83a9c90bf68c5ae6', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T17:17:52.1202466+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:17:52.1202427+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fc1ef91128ab443693b5b8499a50cb50', N'433b487be15a4581b70ff922f6bee17a', N'fa053f25c751400d83ef2a185e3d3c7d', 1, 23123, 1, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:20:44.8228970+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:20:44.8228937+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fcd1c4323cf04b29ad4e5a17563e2a65', NULL, N'1156c4ca4eb34957966ad6444efc7165', 3, 129000, 0, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-06T08:48:47.7611871+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:48:47.7611832+07:00' AS DateTimeOffset), CAST(N'2024-11-06T09:03:31.3401340+07:00' AS DateTimeOffset))
GO
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'019078f10bd44788b414aaccc423256a', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:18.6417892+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:18.6417879+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:18.6417879+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'06f8ecd0d3b843669f8706da06c38fdd', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:22:42.5114304+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:22:42.5114289+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:22:42.5114289+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'07bb51a7a7c1465f9e5d3371d6d29cf3', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:23.6079557+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:23.6079539+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:23.6079539+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'08e6722cd4b543a8928fd4f6f86bb75e', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-02T22:09:08.5466594+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 0, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T22:09:08.5465760+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:09:08.5465760+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0945ca4ca54f4aa1a085d51a2ff0792e', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:23.3781780+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:23.3781771+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:23.3781771+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'09f2b93836d44147869a18ab0e3bc01c', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-02T18:00:46.0169223+07:00' AS DateTimeOffset), 2, 0, 24, 24, N'123 hung vuong 123', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T18:00:46.0167532+07:00' AS DateTimeOffset), CAST(N'2024-11-02T18:00:46.0167532+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0b1edfde86b84ffa803fc34ae69c1ad7', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-02T18:02:21.5511137+07:00' AS DateTimeOffset), 0, 1, 46270, 46270, N'123 hung vuong 123', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, CAST(N'2024-11-02T18:02:21.5511090+07:00' AS DateTimeOffset), CAST(N'2024-11-02T18:02:49.1584543+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'10ca6c5b4b804cedab2d9c379a9d9b06', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:52:18.5745253+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:52:18.5745228+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:52:18.5745228+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'141a66009ed044e79685af8cc099b444', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:22.4999434+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:22.4999415+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:22.4999415+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'14b841aba0e941cabfaeec9c9b496254', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T01:34:28.1634707+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:34:28.1634668+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:34:28.1634668+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'15ea6943f8b84b9ba6fef5c5e0ae09f7', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:14:19.5354951+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:14:19.5354915+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:14:19.5354915+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'18552b725e5c447280b85ed0d951a096', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:52:19.0867077+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:52:19.0867065+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:52:19.0867065+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1d79e5db151243109aff9adb51d6fe01', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T01:34:31.1455554+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:34:31.1455512+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:34:31.1455512+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'24ecd2b19c6445feb72a9a7b23a5414b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:18:07.0469427+07:00' AS DateTimeOffset), 2, 0, 23159, 23159, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:18:07.0469408+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:18:07.0469408+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'26a061cd755642f9bad1330d2124953e', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T17:10:50.2619973+07:00' AS DateTimeOffset), 0, 1, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T17:10:50.2619910+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:11:12.0595340+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2935ddc492ac4de0bf88c7169ab81f53', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:20.6722526+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:20.6722498+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:20.6722498+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2ac468e076a64a59acb9f926c2b7da60', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:20.9878505+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:20.9878486+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:20.9878486+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2b2b5080558c47c7827f3ce30bedf162', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T01:35:35.2272549+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:35:35.2272520+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:35:35.2272520+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2b42a9d172074df093914bdf7d117c19', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:15:06.4171768+07:00' AS DateTimeOffset), 2, 0, 23123, 20117.010000000002, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, N'["111111"]', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:15:06.4169331+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:15:06.4169331+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2cf11fdd3fe44b72bdea2f44310cce11', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T20:22:17.2195226+07:00' AS DateTimeOffset), 2, 0, 161909, 161909, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T20:22:17.2195190+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:22:17.2195190+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2d8cb0d564614a7c98da8089a3b82723', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T20:22:00.1448001+07:00' AS DateTimeOffset), 2, 0, 161909, 161909, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T20:22:00.1447068+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:22:00.1447068+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2db199259f0e4647861c0d344f3e893b', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:22:43.1067953+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:22:43.1067944+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:22:43.1067944+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'317bbe85c98b450da4b99cd6461c275d', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:24.0865466+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:24.0865452+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:24.0865452+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'327138b7fc374bcf9324e0728eaf4916', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:22.8465656+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:22.8465643+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:22.8465643+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3381321f706c4b41bb2ec065a913aeac', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:14:17.1881431+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:14:17.1881393+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:14:17.1881393+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3456ca41403d447ba039878de329805d', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:30:09.4192572+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:30:09.4192552+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:30:09.4192552+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'34629ac0d3d74c848c4b5c608f9d4f51', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T20:39:18.9157649+07:00' AS DateTimeOffset), 2, 0, 23159, 23159, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T20:39:18.9157615+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:39:18.9157615+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'38d854e9435e43e88e5f5ad20aa2e437', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:52:20.2981023+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:52:20.2981004+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:52:20.2981004+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3b0006ef0f2d42c7bc952b28ef5e4fe2', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:18:42.4484364+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, N'[]', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:18:42.4484259+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:18:42.4484259+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3b2223801b8843f89a81fc90ab18e788', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:15:19.8083255+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:15:19.8083222+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:15:19.8083222+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3f63aeae4fd84f9cb015767c2a6510a3', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T12:04:43.1386334+07:00' AS DateTimeOffset), 2, 0, 46246, 46246, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T12:04:43.1386299+07:00' AS DateTimeOffset), CAST(N'2024-11-03T12:04:43.1386299+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'43304033169e443db61ca70a4d6035fd', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:18:08.8335249+07:00' AS DateTimeOffset), 2, 0, 23159, 23159, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:18:08.8335214+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:18:08.8335214+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'433b487be15a4581b70ff922f6bee17a', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:20:49.9825700+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 2, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:20:49.9825657+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:20:49.9825657+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'496c9b34bf6945d09eaabcf5cc54ebd8', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T21:51:21.6571167+07:00' AS DateTimeOffset), 0, 1, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T21:51:21.6571094+07:00' AS DateTimeOffset), CAST(N'2024-11-05T21:51:45.2372733+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5b9b5ad6d8c74fd880644c5edef887c6', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:19:36.7112109+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:19:36.7112075+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:19:36.7112075+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5c327e4dc7d54e4e94ff89b7c433c98c', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T01:34:41.6798888+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:34:41.6798858+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:34:41.6798858+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5e47bcfa729a4a52a1cfa1c5203fadff', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-06T08:35:57.2658837+07:00' AS DateTimeOffset), 0, 0, 1500000, 1350000, N'123 hung vuong 123', 1, N'từ 09/11/2024 đến 11/11/2024', NULL, 1, 0, 0, N'["MPA7SN"]', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-06T08:35:57.2658798+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:35:57.2658798+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6458047e9b9c4277998b5a3f2934798a', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:13:49.5295709+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:13:49.5295680+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:13:49.5295680+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6918b9c7b1ff47b49fd1c11f9c9155b4', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T17:22:36.2277705+07:00' AS DateTimeOffset), 0, 1, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T17:22:36.2277661+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:22:59.9483626+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6d044249a5fa4331ae79bb6d6177356c', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:17.3249722+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:17.3249703+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:17.3249703+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'777ebde87ad34b25bdd7c00f86d5f013', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T10:58:35.6306559+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T10:58:35.6305510+07:00' AS DateTimeOffset), CAST(N'2024-11-03T10:58:35.6305510+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'78c964c7da24458c8eb697713e9fc0be', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T17:18:39.1851251+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T17:18:39.1851224+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:18:39.1851224+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'79346e57307a421897ed538238f3c3de', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:15:28.8615185+07:00' AS DateTimeOffset), 2, 0, 23123, 20117.010000000002, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, N'["111111"]', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:15:28.8615151+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:15:28.8615151+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7af3bc3685ad4fea88045e6295c4059a', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T01:27:18.8844544+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:27:18.8844502+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:27:18.8844502+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7c6fb546dd654b37877c848dba677f35', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T20:28:08.1006481+07:00' AS DateTimeOffset), 2, 0, 161909, 161909, N'B03CDCCBA8DB', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T20:28:08.1006404+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:28:08.1006404+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'81ca1b06b5174a559f14448d39c24729', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:52:18.8794507+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:52:18.8794478+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:52:18.8794478+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'832fd770a4364f7b82e8a66675fc1bcc', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T21:31:55.3414307+07:00' AS DateTimeOffset), 0, 1, 23123, 23123, N'B03CDCCBA8DB', 0, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T21:31:55.3412895+07:00' AS DateTimeOffset), CAST(N'2024-11-05T21:32:01.3446917+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'841d9b9bc64c441b9bb87b179e75396f', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:19.2914691+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:19.2914674+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:19.2914674+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'865532e026d940dfb4b1ecda636b5764', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:22:43.6024002+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:22:43.6023990+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:22:43.6023990+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8fe31f08d06e4dd888952e0421dafb13', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T12:01:22.5942967+07:00' AS DateTimeOffset), 2, 0, 46246, 46246, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T12:01:22.5941892+07:00' AS DateTimeOffset), CAST(N'2024-11-03T12:01:22.5941892+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'94f026e8d7f54058b4225c357ac8d4ba', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-02T22:18:15.7192957+07:00' AS DateTimeOffset), 0, 1, 23135, 23135, N'123 hung vuong 123', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, CAST(N'2024-11-02T22:18:15.7192914+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:18:51.9839121+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9c2553785a5a47e8b8bff4022ba16e06', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:23.1687852+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:23.1687843+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:23.1687843+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9ebc629397224bf2a69f4b727dc8f05c', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T11:56:33.1963306+07:00' AS DateTimeOffset), 2, 0, 46246, 46246, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T11:56:33.1961942+07:00' AS DateTimeOffset), CAST(N'2024-11-03T11:56:33.1961942+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9ed06cc4016e4e5a81cd114dfade7823', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:18.0006141+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:18.0006117+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:18.0006117+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9f425d3cedb94b4ca6677e529c929e49', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-06T08:31:59.0525743+07:00' AS DateTimeOffset), 0, 1, 631000, 631000, N'B03CDCCBA8DB', 1, N'từ 09/11/2024 đến 11/11/2024', NULL, 1, 0, 0, N'[]', N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-06T08:31:59.0524447+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:33:54.4796268+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a38ef7ada0d14383b0622b719e29c91a', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:19.9838481+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:19.9838456+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:19.9838456+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a4413d4ff06d45f1981820fa025ddcfc', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:11:51.4037247+07:00' AS DateTimeOffset), 0, 1, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T22:11:51.4036167+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:12:15.4248812+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a4aa9c0a40dd422e818d8f5770633f5e', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:29:52.1078399+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:29:52.1077422+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:29:52.1077422+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'aadea9866a2e48ff9a640cb487345cc0', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:16:58.4525261+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, N'[]', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:16:58.4525226+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:16:58.4525226+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ad2b17377fe84f679619a53e7613a813', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T20:15:09.7011955+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T20:15:09.7010699+07:00' AS DateTimeOffset), CAST(N'2024-11-05T20:15:09.7010699+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b12bdb59c3f34edf8779df327d824991', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T12:10:00.1719336+07:00' AS DateTimeOffset), 2, 0, 46246, 46246, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T12:10:00.1719304+07:00' AS DateTimeOffset), CAST(N'2024-11-03T12:10:00.1719304+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b30536345c954364ae6c4b8437fd5598', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:30:05.8006521+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:30:05.8006481+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:30:05.8006481+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b30e297c3f824bc2a46adbcd099990e9', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:15:26.9974719+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:15:26.9974650+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:15:26.9974650+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b8b7365e67d24d8dbf01108b612ab364', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:16.8783440+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:16.8783428+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:16.8783428+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bae74700d0d34d8e83a9c90bf68c5ae6', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T17:18:43.1181555+07:00' AS DateTimeOffset), 0, 1, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T17:18:43.1181527+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:19:10.4822149+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bb77f25b8b3847de9ff197491fff29e9', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:20.3203219+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:20.3203198+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:20.3203198+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bb98ec623b494fb2bf1f2b09667d9e72', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:22:40.4552471+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:22:40.4552458+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:22:40.4552458+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c0a1cde1c7e943c0a35da92845005362', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:22:53.3866587+07:00' AS DateTimeOffset), 2, 0, 23123, 20117.010000000002, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, N'["111111"]', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:22:53.3864657+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:22:53.3864657+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c60a562298f6434692c09a7fb2ae53e5', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:14:19.1405348+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:14:19.1405316+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:14:19.1405316+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c63350813309493493bcd95a5421f653', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:30:08.8834299+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:30:08.8834256+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:30:08.8834256+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c70c0d56f040479682a05436dd681666', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:15.4567225+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:15.4567209+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:15.4567209+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c9c1344392304f32b9189eb6aeb1bfff', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:15:21.6336911+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:15:21.6336875+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:15:21.6336875+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cc168a5156fc4e0088c7c9f25b024032', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:18:23.7073125+07:00' AS DateTimeOffset), 0, 1, 23159, 23159, N'B03CDCCBA8DB', 0, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T15:18:23.7073114+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:18:23.8746507+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ceeb6c001ca54aca82619bafe257162b', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:22:43.4040079+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:22:43.4040065+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:22:43.4040065+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd7139e1966644913be3abaa27c706058', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-02T22:09:31.5579260+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T22:09:31.5579232+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:09:31.5579232+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd8a1c532ba9d43a798ae117a4aece2b7', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:13:46.5546733+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:13:46.5546703+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:13:46.5546703+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd9f42d3afc8b44858b47db47ce3ab216', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T12:11:35.0093237+07:00' AS DateTimeOffset), 2, 0, 69369, 46246, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T12:11:35.0093206+07:00' AS DateTimeOffset), CAST(N'2024-11-03T12:11:35.0093206+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e09d0a72054f447cb243989bbcd2af5a', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:15:22.1889468+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:15:22.1889418+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:15:22.1889418+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e697d54e464643b0b2efc452c45aa4c6', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:20:33.9783651+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:20:33.9783616+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:20:33.9783616+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ea592be69a624bd7b08cad9aac3065fa', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T01:35:39.4170359+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'Milk Store', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:35:39.4170330+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:35:39.4170330+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ea8358e760364a8c9d525bb290b27467', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:30:07.7092638+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:30:07.7092606+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:30:07.7092606+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'eca0f3cbf597424e94d8a7894cedb782', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:25:59.4009812+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:25:59.4008459+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:25:59.4008459+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ecddd33ec5114bf5a8d2906d7d2c88ca', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:23.8710665+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:23.8710656+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:23.8710656+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ee40068caacb4103aad8440130af5b0c', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:20:27.1635378+07:00' AS DateTimeOffset), 0, 1, 23123, 23123, N'B03CDCCBA8DB', 0, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T15:20:27.1635345+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:20:27.2568490+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ef23b888f1854ce4851334b528f549a5', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:18:19.8067278+07:00' AS DateTimeOffset), 2, 0, 23159, 23159, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:18:19.8067193+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:18:19.8067193+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ef4571b847e7465299497404b0946765', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:18.2896455+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:18.2896435+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:18.2896435+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ef67ec5e80fb4516849ad7e20a4b5404', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:17.6662520+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:17.6662508+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:17.6662508+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f017c23a54e94d85af5b778a9c547b36', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:17:16.3639756+07:00' AS DateTimeOffset), 2, 0, 23123, 20117.010000000002, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, N'["111111"]', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T22:17:16.3639674+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:17:16.3639674+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f2decfc40eef4d1ea1656eb0e7034ced', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:19:03.6847311+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:19:03.6847276+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:19:03.6847276+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f3705b69e22b437ea1ee2df6133797c0', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:18:02.1409524+07:00' AS DateTimeOffset), 2, 0, 23159, 23159, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T15:18:02.1408425+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:18:02.1408425+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f4ad9002f41549fc83aaae8d998817f9', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:19.6419052+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:19.6419037+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:19.6419037+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f60e0d24b3b749e1a584b686efd4d7bd', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T01:35:15.5631537+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:35:15.5631508+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:35:15.5631508+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fab988cae438440bbc88ec04129852ed', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:14:18.5930154+07:00' AS DateTimeOffset), 2, 0, 23123, 23123, N'B03CDCCBA8DB', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:14:18.5930122+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:14:18.5930122+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fb347e76cb804cc0a074534d0ae974c0', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:22:42.8939660+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:22:42.8939638+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:22:42.8939638+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fb4c509e82be428a9ff6d649544ff704', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T16:02:07.2527362+07:00' AS DateTimeOffset), 0, 1, 23135, 23135, N'B03CDCCBA8DB', 1, N'từ 08/11/2024 đến 10/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-05T16:02:07.2526740+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:02:27.4827952+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fb59bee591934bc5a45fae01a5942ebd', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-02T23:30:08.4023972+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'B03CDCCBA8DB', 1, N'từ 05/11/2024 đến 07/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-02T23:30:08.4023949+07:00' AS DateTimeOffset), CAST(N'2024-11-02T23:30:08.4023949+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fbf36d2cd3c941b79dc34e2948078140', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T01:12:09.2794494+07:00' AS DateTimeOffset), 2, 0, 416226, 416226, N'Milk Store', 0, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T01:12:09.2792850+07:00' AS DateTimeOffset), CAST(N'2024-11-03T01:12:09.2792850+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [OrderStatuss], [PaymentStatuss], [TotalAmount], [DiscountedAmount], [ShippingAddress], [PaymentMethod], [estimatedDeliveryDate], [deliveryDate], [IsInventoryUpdated], [IsPointAdded], [PointsAdded], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fd1251eb244948acb7598e2addc0b361', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-03T00:25:18.9753959+07:00' AS DateTimeOffset), 2, 0, 12, 12, N'123 hung vuong 123', 1, N'từ 06/11/2024 đến 08/11/2024', NULL, 1, 0, 0, NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-03T00:25:18.9753939+07:00' AS DateTimeOffset), CAST(N'2024-11-03T00:25:18.9753939+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'00f4453bf03e414b824be1102361d869', N'09236fa2145d4397b1d2e123702c7acb', N'07af7ca14b71438fae1c6379d85043b8', NULL, NULL, NULL, CAST(N'2024-11-01T12:32:00.1334840+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:32:00.1334840+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'23bf76e83b584f228a84a2a30f0ab1d3', N'3a738be4666841bd91e31bd91f960dd8', N'52169c28bdf142edb2915706dca36a2a', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:03.3797200+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:03.3797200+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2843aec229984dd7b8d5b9c8cb590513', N'3a738be4666841bd91e31bd91f960dd8', N'2b567a1357004fd7add478413fc3c120', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:03.3772000+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:03.3772000+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'29d1718bea70404887135f82799c882e', N'e4f1615fccfa4961adc25fc59ae16869', N'a917ad1477ea401ab45a8bc9d9a053a2', NULL, NULL, NULL, CAST(N'2024-11-01T12:33:58.1807464+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:33:58.1807464+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'29e370f16e094be4bc2cededc18e5e6c', N'86a86a3a1c23450685cc01b97fb8c886', N'8e2cd3bc464a4730b1fd3657c4c08628', NULL, NULL, NULL, CAST(N'2024-11-06T00:07:45.0473371+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:45.0473371+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'37a79056b424435e9134be1d6cf21a92', N'3be8b9a56f33475bbeef011f3d18a56c', N'703b6590571b42b89ae2acb900537dd7', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:40.1866709+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:40.1866709+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'435eff2ca2d343339e10d3b5165e30bf', N'e4f1615fccfa4961adc25fc59ae16869', N'07af7ca14b71438fae1c6379d85043b8', NULL, NULL, NULL, CAST(N'2024-11-01T12:33:58.1831629+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:33:58.1831629+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4aa41dfea75049ae852d114899fdf362', N'86a86a3a1c23450685cc01b97fb8c886', N'66165c0dd8274096a8ec87cbdf17b114', NULL, NULL, NULL, CAST(N'2024-11-06T00:07:45.0442685+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:45.0442685+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8a042eb406044a89bf81ae1270decd96', N'45505eed760d4d30a1f7c360fa66fd80', N'a917ad1477ea401ab45a8bc9d9a053a2', NULL, NULL, NULL, CAST(N'2024-11-01T12:33:31.8128966+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:33:31.8128966+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8ba7b942124f421a8c299e5aa7d9008d', N'59494409d5f643809e7dd0ae11c80f4a', N'1156c4ca4eb34957966ad6444efc7165', NULL, NULL, NULL, CAST(N'2024-11-06T00:07:20.5179840+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:20.5179840+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8f2d11dd70c34a33a8c028d9435ebfd6', N'e4f1615fccfa4961adc25fc59ae16869', N'95dfa9ca552c4103b35a3aaac6b51adf', NULL, NULL, NULL, CAST(N'2024-11-01T12:33:58.1780009+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:33:58.1780009+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'92e736d5f6c04bd794950c18c93a5f39', N'1931a941c41f453b9be5739600c37c5e', N'66165c0dd8274096a8ec87cbdf17b114', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:55.7366110+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:55.7366110+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a0d6af37a23148939924cc2995df8554', N'3be8b9a56f33475bbeef011f3d18a56c', N'1b7be0df0d734db9b05936eaaf60a8cc', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:40.1835887+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:40.1835887+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a4a90774aa994683b3fbefddd8371dff', N'dca3b783032442ba89500f93ed71f7e8', N'0bbbe18eb14840a99d05f81b05bf081e', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:19.2711804+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:19.2711804+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a9bd1381d6844e27baeb4b0a4615069c', N'09820cb8622948ec84ce2db370c96fd1', N'07af7ca14b71438fae1c6379d85043b8', NULL, NULL, NULL, CAST(N'2024-11-03T23:13:30.7846957+07:00' AS DateTimeOffset), CAST(N'2024-11-03T23:13:30.7846957+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b9ddd7a7b2e6417aa8fd00fb82351944', N'dca3b783032442ba89500f93ed71f7e8', N'28d01b60c68449deb2f4aa114e3dbe9b', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:19.2743696+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:19.2743696+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c87c6fc930064ab9abd15ff25a81e8d4', N'1931a941c41f453b9be5739600c37c5e', N'8e2cd3bc464a4730b1fd3657c4c08628', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:55.7390047+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:55.7390047+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c958741b86de4b7bb12d62f4f9a0c8d5', N'45505eed760d4d30a1f7c360fa66fd80', N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', NULL, NULL, NULL, CAST(N'2024-11-01T12:33:31.8093000+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:33:31.8093000+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'dd9c2e59722e499fa74bb21a5125c0fe', N'59494409d5f643809e7dd0ae11c80f4a', N'9d0573250c404b6580123058ca971a0d', NULL, NULL, NULL, CAST(N'2024-11-06T00:07:20.5151608+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:20.5151608+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ed1935fa24ad441dae968157f84b62dd', N'25497149c0ac474c99bf8085fe1de4ab', N'a917ad1477ea401ab45a8bc9d9a053a2', NULL, NULL, NULL, CAST(N'2024-11-01T12:34:20.7893318+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:34:20.7893318+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[PostProduct] ([Id], [PostId], [ProductId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'eedd2c71fc41446bbc16224d12f34512', N'dca3b783032442ba89500f93ed71f7e8', N'25f48265e28544b5a7c44de2cf09738a', NULL, NULL, NULL, CAST(N'2024-11-06T00:08:19.2768474+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:19.2768474+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'09236fa2145d4397b1d2e123702c7acb', N'string', N'string', N'string', N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-01T12:32:00.1269690+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:32:00.1269662+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:06:58.7104962+07:00' AS DateTimeOffset))
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'09820cb8622948ec84ce2db370c96fd1', N'adsfa', N'sfasdf', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-03T23:13:30.7767081+07:00' AS DateTimeOffset), CAST(N'2024-11-03T23:13:30.7765599+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:00.4143365+07:00' AS DateTimeOffset))
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1931a941c41f453b9be5739600c37c5e', N'Cách chọn sữa công thức phù hợp cho bé', N'Lựa chọn sữa công thức phù hợp với độ tuổi và nhu cầu dinh dưỡng của bé là vô cùng quan trọng. Sữa cần có thành phần dinh dưỡng cân đối, dễ tiêu hóa và không gây dị ứng cho bé.', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-06T00:08:55.7324294+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:55.7324273+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'25497149c0ac474c99bf8085fe1de4ab', N'TEst 3 ', N'ádfasdf', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-01T12:34:20.7849240+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:34:20.7849201+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:01.8093064+07:00' AS DateTimeOffset))
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3a738be4666841bd91e31bd91f960dd8', N'Hướng dẫn chọn đồ chơi phát triển trí não cho bé', N'Chọn đồ chơi phù hợp với từng giai đoạn phát triển của bé giúp kích thích trí não và khả năng sáng tạo. Đồ chơi gỗ, bộ xếp hình, và đồ chơi logic là những lựa chọn tuyệt vời.', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-06T00:08:03.3728913+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:03.3728889+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3be8b9a56f33475bbeef011f3d18a56c', N'Chăm sóc sức khỏe mẹ sau sinh', N'Sau khi sinh, mẹ cần chú trọng đến chế độ dinh dưỡng và nghỉ ngơi để phục hồi sức khỏe. Uống nhiều nước, bổ sung vitamin và có chế độ tập luyện nhẹ nhàng sẽ giúp mẹ nhanh chóng lấy lại sức lực.', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-06T00:08:40.1795576+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:40.1795557+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'45505eed760d4d30a1f7c360fa66fd80', N'dfadf', N'ádfasdf', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-01T12:33:31.7934835+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:33:31.7934784+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:03.1832270+07:00' AS DateTimeOffset))
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'59494409d5f643809e7dd0ae11c80f4a', N'Cách chăm sóc da cho bé sơ sinh', N'Da của bé sơ sinh rất nhạy cảm, vì vậy việc lựa chọn các sản phẩm chăm sóc da cần được chú trọng. Sử dụng các sản phẩm từ thiên nhiên và tránh các hóa chất gây kích ứng sẽ giúp bảo vệ làn da bé an toàn.', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-06T00:07:20.5104622+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:20.5102534+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'86a86a3a1c23450685cc01b97fb8c886', N'Tầm quan trọng của việc bổ sung sữa mẹ', N'Sữa mẹ là nguồn dinh dưỡng tốt nhất cho sự phát triển của bé, cung cấp kháng thể giúp bé chống lại bệnh tật và phát triển toàn diện cả về thể chất lẫn trí tuệ.', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-06T00:07:45.0389017+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:07:45.0388991+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'dca3b783032442ba89500f93ed71f7e8', N'Lợi ích của việc cho bé đi dạo hằng ngày', N'Việc đưa bé ra ngoài đi dạo mỗi ngày giúp bé khám phá thế giới xung quanh, phát triển thị giác và hô hấp. Ánh sáng tự nhiên còn giúp cơ thể tổng hợp vitamin D, hỗ trợ sự phát triển xương chắc khỏe.', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-06T00:08:19.2656329+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:08:19.2656305+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [Image], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e4f1615fccfa4961adc25fc59ae16869', N'ádasdasd', N'ádfasdf', NULL, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', NULL, NULL, CAST(N'2024-11-01T12:33:58.1637868+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:33:58.1637842+07:00' AS DateTimeOffset), CAST(N'2024-11-01T12:38:57.8555087+07:00' AS DateTimeOffset))
GO
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'08a176c1e10843108f1402c78fa82cca', N'a2d02c3c-4b70-4ee5-0a09-08dcf9bb3a91', N'a917ad1477ea401ab45a8bc9d9a053a2', 1, NULL, NULL, NULL, CAST(N'2024-10-31T22:02:04.4759769+07:00' AS DateTimeOffset), CAST(N'2024-10-31T22:02:04.4757499+07:00' AS DateTimeOffset), CAST(N'2024-11-05T23:00:53.7459818+07:00' AS DateTimeOffset))
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0b3809680d8b42ed98e3b41b061195da', N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'dbb1cf5da6ce48a9ad3bfd3dbc282b66', 1, NULL, NULL, NULL, CAST(N'2024-11-05T23:09:55.5431325+07:00' AS DateTimeOffset), CAST(N'2024-11-05T23:09:55.5428954+07:00' AS DateTimeOffset), CAST(N'2024-11-05T23:11:10.2501735+07:00' AS DateTimeOffset))
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4159aa74c7c54ae4ae60baa1ae65b62b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'95dfa9ca552c4103b35a3aaac6b51adf', 1, NULL, NULL, NULL, CAST(N'2024-11-04T08:45:12.8473565+07:00' AS DateTimeOffset), CAST(N'2024-11-04T08:45:12.8473483+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:53:23.4245238+07:00' AS DateTimeOffset))
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5be457e2275d4455a20cff10a4f5bcd9', N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'95dfa9ca552c4103b35a3aaac6b51adf', 1, NULL, NULL, NULL, CAST(N'2024-11-04T08:45:09.3316234+07:00' AS DateTimeOffset), CAST(N'2024-11-04T08:45:09.3316129+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:53:23.4245565+07:00' AS DateTimeOffset))
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'84169d79dc8b4b1a8a0e75fcdf0b7dca', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'07af7ca14b71438fae1c6379d85043b8', 1, NULL, NULL, NULL, CAST(N'2024-11-04T08:41:32.6795374+07:00' AS DateTimeOffset), CAST(N'2024-11-04T08:41:32.6791173+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:48:44.4977402+07:00' AS DateTimeOffset))
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'965ee789d8d649f785397f2f3a9b5d80', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'1156c4ca4eb34957966ad6444efc7165', 1, NULL, NULL, NULL, CAST(N'2024-11-06T08:38:28.1163362+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:38:28.1163205+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:41:19.5549487+07:00' AS DateTimeOffset))
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'aca22edcb5964a1e8950cb05272306de', N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'07af7ca14b71438fae1c6379d85043b8', 1, NULL, NULL, NULL, CAST(N'2024-11-05T21:33:40.8219374+07:00' AS DateTimeOffset), CAST(N'2024-11-05T21:33:40.8217491+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:48:44.4979812+07:00' AS DateTimeOffset))
INSERT [dbo].[PreOrders] ([Id], [UserID], [ProductID], [Status], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd7f8858b32ae4172a853ad8ce3f91e01', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'1156c4ca4eb34957966ad6444efc7165', 1, NULL, NULL, NULL, CAST(N'2024-11-06T08:38:27.4417346+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:38:27.4415006+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:41:30.2406258+07:00' AS DateTimeOffset))
GO
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'07af7ca14b71438fae1c6379d85043b8', N'TEST123s', 100, N'sgsdfg', 1, N'https://res.cloudinary.com/daf146blm/image/upload/v1730822223/mxgfzyirtf2qwkcgadbd.jpg', N'1c81516544d741e4856627f5561c0478', NULL, NULL, NULL, CAST(N'2024-10-31T15:18:32.0500727+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:20:25.8085531+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:44:22.1833015+00:00' AS DateTimeOffset))
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0bbbe18eb14840a99d05f81b05bf081e', N'Bỉm vải chống tràn', 35000, N'Bỉm vải thân thiện với môi trường, thiết kế chống tràn tối ưu.', 99, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825443/rtkntuqwlmxyotiqovid.jpg', N'70f9e6da83dd425189e1b448026ff57a', NULL, NULL, NULL, CAST(N'2024-11-05T16:50:44.0829345+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:50:44.0829316+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1156c4ca4eb34957966ad6444efc7165', N'Sữa rửa mặt cho mẹ sau sinh', 129000, N'Sữa rửa mặt an toàn, giúp làm sạch và cân bằng độ ẩm cho da mẹ sau sinh', 11, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825676/hfnmqypbyfs2qyqfvvxc.jpg', N'a632f0dade904b309a22bc65e43c8c81', NULL, NULL, NULL, CAST(N'2024-11-05T16:54:36.8291114+00:00' AS DateTimeOffset), CAST(N'2024-11-06T08:41:19.5146575+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1b7be0df0d734db9b05936eaaf60a8cc', N'Tã quần siêu thấm', 375000, N'Tã quần với khả năng thấm hút vượt trội, giúp bé thoải mái cả ngày.', 120, N'https://res.cloudinary.com/daf146blm/image/upload/v1730824917/dhoozhluvu18k7fulf4y.jpg', N'983f875447504355a8e576eab20b708c', NULL, NULL, NULL, CAST(N'2024-11-05T16:41:58.3421994+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:41:58.3421966+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'25f48265e28544b5a7c44de2cf09738a', N'Địu em bé tiện lợi', 270000, N'Địu có thể điều chỉnh theo dáng người, giúp mẹ dễ dàng di chuyển cùng bé.', 0, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825327/vhwdig8qrfr96fjsipiv.png', N'917ef5751c674c658fa92103b1badae9', NULL, NULL, NULL, CAST(N'2024-11-05T16:48:48.3404591+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:48:48.3404562+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'28d01b60c68449deb2f4aa114e3dbe9b', N'Xe đẩy du lịch siêu nhẹ', 1299000, N'Xe đẩy gọn nhẹ, dễ dàng gập gọn và mang theo khi đi du lịch.', 15, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825628/vsetuqla5nuijsry6jt7.jpg', N'917ef5751c674c658fa92103b1badae9', NULL, NULL, NULL, CAST(N'2024-11-05T16:53:49.5116218+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:53:49.5116194+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2b567a1357004fd7add478413fc3c120', N'Bộ đồ chơi nhà bếp cho bé', 1500000, N'Giúp bé phát triển kỹ năng nấu ăn thông qua trò chơi mô phỏng.', 4, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825490/neokjowpfelybksooco5.jpg', N'3d321af0e9384fe0ad652cc851cc6368', NULL, NULL, NULL, CAST(N'2024-11-05T16:51:31.6299172+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:51:31.6299145+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'52169c28bdf142edb2915706dca36a2a', N'Bộ đồ chơi gỗ thông minh', 250000, N'Đồ chơi làm từ gỗ tự nhiên giúp bé phát triển tư duy và khả năng sáng tạo.', 100, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825055/elnbj4erbzg3vw1iuf9e.jpg', N'3d321af0e9384fe0ad652cc851cc6368', NULL, NULL, NULL, CAST(N'2024-11-05T16:44:16.5356824+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:44:16.5356796+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'631174d86ef7418f868c3a7429b3d194', N'TETS', 23123, N'ádfsdafdasdfadsf', 123, N'https://res.cloudinary.com/daf146blm/image/upload/v1730384323/mhaf0fap1cmt5qjiiafl.jpg', N'c817f4b689924ecfa41b0b804563999c', NULL, NULL, NULL, CAST(N'2024-10-31T14:18:43.4427465+00:00' AS DateTimeOffset), CAST(N'2024-10-31T21:18:43.4425075+07:00' AS DateTimeOffset), CAST(N'2024-10-31T14:18:58.3064019+00:00' AS DateTimeOffset))
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'66165c0dd8274096a8ec87cbdf17b114', N'Sữa bột công thức Dielac', 150000, N'Sữa bột giàu dinh dưỡng, hỗ trợ phát triển trí não và thể chất cho bé từ 0-6 tháng.', 0, N'https://res.cloudinary.com/daf146blm/image/upload/v1730824994/jceefteqgbrw4nlrcixp.png', N'7f7e1df7adb141398a0d8b868008f5cc', NULL, NULL, NULL, CAST(N'2024-11-05T16:43:16.0300128+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:43:16.0300089+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'703b6590571b42b89ae2acb900537dd7', N'Dầu gội cho bé không cay mắt', 149000, N'Dầu gội dịu nhẹ, không gây kích ứng, thích hợp cho bé sơ sinh.', 496, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825557/je49igsbgjttjgvqmm2t.jpg', N'a632f0dade904b309a22bc65e43c8c81', NULL, NULL, NULL, CAST(N'2024-11-05T16:52:37.6681716+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:52:37.6681690+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8e2cd3bc464a4730b1fd3657c4c08628', N'Máy hút sữa điện đôi', 150000, N'Máy hút sữa nhẹ nhàng và êm ái, hỗ trợ mẹ trong quá trình nuôi con bằng sữa mẹ.', 23, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825381/zcbgyitjc3vw3mljbblw.png', N'917ef5751c674c658fa92103b1badae9', NULL, NULL, NULL, CAST(N'2024-11-05T16:49:45.0525831+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:49:45.0525799+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'921fee4e5511432ea02689f5ebb66cd6', N'Ghế ăn dặm đa năng', 890000, N'Ghế ăn có thể điều chỉnh chiều cao, giúp bé tập ăn dễ dàng và an toàn.', 5, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825110/rdrganlwpnszwjjrwms7.jpg', N'917ef5751c674c658fa92103b1badae9', NULL, NULL, NULL, CAST(N'2024-11-05T16:45:10.8395972+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:45:10.8395940+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'95dfa9ca552c4103b35a3aaac6b51adf', N'TEST123', 100, N'sgsdfg', 3, N'https://res.cloudinary.com/daf146blm/image/upload/v1730822002/qyaq9uwqdbdatirttefa.jpg', N'1c813a3ff9a54e0cbdbc1f27a5d42126', NULL, NULL, NULL, CAST(N'2024-10-31T15:18:29.6986287+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:00:26.8959062+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:50:48.6120113+00:00' AS DateTimeOffset))
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9d0573250c404b6580123058ca971a0d', N'Bộ chăm sóc da toàn diện cho bé', 89000, N'Bộ sản phẩm chăm sóc da từ thiên nhiên, không gây kích ứng, giữ cho làn da bé mềm mại.', 40, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825735/xcuovecr6r1es6f1edtu.png', N'a632f0dade904b309a22bc65e43c8c81', NULL, NULL, NULL, CAST(N'2024-11-05T16:55:37.1819717+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:55:37.1819688+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a917ad1477ea401ab45a8bc9d9a053a2', N'ccccc', 100, N'adfasdfasdf', 1, N'https://res.cloudinary.com/daf146blm/image/upload/v1730387419/migefgf7mgegrhdsivrz.jpg', N'1c813a3ff9a54e0cbdbc1f27a5d42126', NULL, NULL, NULL, CAST(N'2024-10-31T15:01:29.5431255+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:00:53.7096172+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:50:51.2553719+00:00' AS DateTimeOffset))
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b35a48c88c2743038897256fff47da04', N'Quần áo sơ sinh 100% cotton', 350000, N'Bộ quần áo sơ sinh mềm mại, thấm hút mồ hôi, an toàn cho làn da nhạy cảm của bé.', 5, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825280/dcvgzk1cots8rl1c149p.jpg', N'70f9e6da83dd425189e1b448026ff57a', NULL, NULL, NULL, CAST(N'2024-11-05T16:48:00.7582126+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:48:00.7582094+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ce2a08d11f554b1683971b68fccc439b', N'Nôi xách tay cho bé sơ sinh', 375000, N'Nôi xách tay nhẹ nhàng, tiện lợi cho mẹ và bé trong các chuyến đi.', 4, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825783/j2m1fixpoompznwe50fh.jpg', N'917ef5751c674c658fa92103b1badae9', NULL, NULL, NULL, CAST(N'2024-11-05T16:56:23.7999307+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:56:23.7999270+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cf114e3bcd0b4a5a8d0b1cc1c8f8f0b0', N'CC', 12, N'adfasdf', 5, N'https://res.cloudinary.com/daf146blm/image/upload/v1730369175/djnskl8vrljo6anukoc9.png', N'c817f4b689924ecfa41b0b804563999c', NULL, NULL, NULL, CAST(N'2024-10-31T10:06:19.2130978+00:00' AS DateTimeOffset), CAST(N'2024-10-31T17:06:19.2127286+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:55:46.5707077+00:00' AS DateTimeOffset))
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd5505074b2ea41e1b980958607668e6b', N'Kem chống rạn da cho mẹ bầu', 89000, N'Kem dưỡng da giảm nguy cơ rạn da cho phụ nữ mang thai.', 500, N'https://res.cloudinary.com/daf146blm/image/upload/v1730825165/eds7bdfmddp99ffz8mqn.jpg', N'1c3d49bc3e404c0cab354f77cb72aa53', NULL, NULL, NULL, CAST(N'2024-11-05T16:46:06.7510311+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:46:06.7510285+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'dbb1cf5da6ce48a9ad3bfd3dbc282b66', N'TestPre', 100, N'adfasdfasdf', 1, N'https://res.cloudinary.com/daf146blm/image/upload/v1730822962/p5sckmldgh8kaynq8fkf.jpg', N'1c813a3ff9a54e0cbdbc1f27a5d42126', NULL, NULL, NULL, CAST(N'2024-11-05T16:09:23.4774476+00:00' AS DateTimeOffset), CAST(N'2024-11-05T23:11:10.2325977+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:46:40.0767600+00:00' AS DateTimeOffset))
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [QuantityInStock], [ImageUrl], [CategoryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fa053f25c751400d83ef2a185e3d3c7d', N'TETS', 23123, N'ádfsdafdasdfadsf', 108, N'https://res.cloudinary.com/daf146blm/image/upload/v1730387534/o6bsv1aondntlnxcjvul.jpg', N'1c813a3ff9a54e0cbdbc1f27a5d42126', NULL, NULL, NULL, CAST(N'2024-10-31T14:18:44.4411394+00:00' AS DateTimeOffset), CAST(N'2024-10-31T22:12:11.8325004+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:00:09.9681476+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[Reviews] ([Id], [UserID], [OrderDetailID], [ProductsID], [OrderID], [Rating], [Comment], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7db68f20faa94aa49fa6b7b5ca0ecce0', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'3ef18faa497846299794eb0a354be025', N'fa053f25c751400d83ef2a185e3d3c7d', N'0b1edfde86b84ffa803fc34ae69c1ad7', 5, N'string', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, NULL, CAST(N'2024-11-05T13:57:41.2955216+07:00' AS DateTimeOffset), CAST(N'2024-11-05T13:57:41.2951882+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Roles] ([Id], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'da53c73e-44bc-4adf-f419-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T10:23:10.9024883+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:10.9024883+07:00' AS DateTimeOffset), NULL, N'Admin', N'ADMIN', NULL)
INSERT [dbo].[Roles] ([Id], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.4842137+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.4842137+07:00' AS DateTimeOffset), NULL, N'Member', N'MEMBER', NULL)
INSERT [dbo].[Roles] ([Id], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'88bef6b9-a0b3-49af-f41b-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.5605748+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.5605748+07:00' AS DateTimeOffset), NULL, N'Staff', N'STAFF', NULL)
GO
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'04a8b5b3406d48239999d0542b3fa3ea', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:05:57.4235961+07:00' AS DateTimeOffset), 1, 10000, 100930595, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T22:05:57.4235882+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:05:57.4235882+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'10859da7aacc476ca0cfb8aeeef55a03', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T17:19:10.4776445+07:00' AS DateTimeOffset), 0, 23123, 0, N'Thanh toán đơn hàngbae74700d0d34d8e83a9c90bf68c5ae6', NULL, NULL, NULL, CAST(N'2024-11-05T17:19:10.4776379+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:19:10.4776379+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'10a9825ea0584fd5966be46759a29ac4', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:46:38.0193939+07:00' AS DateTimeOffset), 1, 10000, 100760000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:46:38.0193912+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:46:38.0193912+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'13e7027a5dd44e8fba0731c9bf24d175', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:54:32.9132646+07:00' AS DateTimeOffset), 1, 100000000, 100610000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:54:32.9132581+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:54:32.9132581+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1870d38996734c88919e65585fe8865f', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:48:40.5412138+07:00' AS DateTimeOffset), 1, 10000, 10000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:48:40.5411273+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:48:40.5411273+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'18d4c011de2b4778927f0ac143d01cee', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T19:59:20.4817857+07:00' AS DateTimeOffset), 1, 10000, 100903718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T19:59:20.4817808+07:00' AS DateTimeOffset), CAST(N'2024-11-05T19:59:20.4817808+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1b0d8e9c192a4bc5910268823785f0ec', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T19:38:22.9466070+07:00' AS DateTimeOffset), 1, 10000, 100853718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T19:38:22.9466012+07:00' AS DateTimeOffset), CAST(N'2024-11-05T19:38:22.9466012+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1bc7d57a664541298065b15b612f0f28', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:51:13.6835401+07:00' AS DateTimeOffset), 1, 10000, 100790000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:51:13.6835375+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:51:13.6835375+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'235d39628c6e45999d2d27bc7023c8c5', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:49:43.3990413+07:00' AS DateTimeOffset), 1, 10000, 100780000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:49:43.3990382+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:49:43.3990382+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'322f75570002405185b72f64eee53b6c', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T17:22:59.9441582+07:00' AS DateTimeOffset), 0, 23123, 0, N'Thanh toán đơn hàng6918b9c7b1ff47b49fd1c11f9c9155b4', NULL, NULL, NULL, CAST(N'2024-11-05T17:22:59.9441518+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:22:59.9441518+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'344652b122e449d4a96cce9f60f5e51b', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-02T18:02:49.1377933+07:00' AS DateTimeOffset), 0, 46270, 0, N'Thanh toán đơn hàng0b1edfde86b84ffa803fc34ae69c1ad7', NULL, NULL, NULL, CAST(N'2024-11-02T18:02:49.1377036+07:00' AS DateTimeOffset), CAST(N'2024-11-02T18:02:49.1377036+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3bdc1f040b654e62a0504ec15c1dbf1c', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:02:54.9598990+07:00' AS DateTimeOffset), 1, 10000, 100920595, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T22:02:54.9597983+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:02:54.9597983+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'47aa1a3d9c2446c899ef1f846c9e5c44', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:52:55.2164728+07:00' AS DateTimeOffset), 1, 100000, 210000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:52:55.2164689+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:52:55.2164689+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4c738faa492c45d89680cfcfb5cc7a76', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T21:51:45.2261801+07:00' AS DateTimeOffset), 0, 23123, 0, N'Thanh toán đơn hàng496c9b34bf6945d09eaabcf5cc54ebd8', NULL, NULL, NULL, CAST(N'2024-11-05T21:51:45.2261593+07:00' AS DateTimeOffset), CAST(N'2024-11-05T21:51:45.2261593+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5db930edbab74a13ad42d2286fcd19e7', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T17:11:12.0548628+07:00' AS DateTimeOffset), 0, 23123, 0, N'Thanh toán đơn hàng26a061cd755642f9bad1330d2124953e', NULL, NULL, NULL, CAST(N'2024-11-05T17:11:12.0548521+07:00' AS DateTimeOffset), CAST(N'2024-11-05T17:11:12.0548521+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5e7bebd4a22c404ab0e2d487c2345784', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T20:00:24.2437718+07:00' AS DateTimeOffset), 1, 10000, 100913718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T20:00:24.2437653+07:00' AS DateTimeOffset), CAST(N'2024-11-05T20:00:24.2437653+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'661c751af9b3410db812cb2a7985927c', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T16:02:27.4656623+07:00' AS DateTimeOffset), 0, 23135, 0, N'Thanh toán đơn hàngfb4c509e82be428a9ff6d649544ff704', NULL, NULL, NULL, CAST(N'2024-11-05T16:02:27.4655941+07:00' AS DateTimeOffset), CAST(N'2024-11-05T16:02:27.4655941+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'66dda3ae0ff94c74b1dd2dfb32cb6f95', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:18:23.8559669+07:00' AS DateTimeOffset), 1, 23159, 100866841, N'Thanh toán đơn hàng cc168a5156fc4e0088c7c9f25b024032', NULL, NULL, NULL, CAST(N'2024-11-05T15:18:23.8559090+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:18:23.8559090+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6f518a84e5984720b6fcc2ee271d121d', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T21:32:01.3233426+07:00' AS DateTimeOffset), 1, 23123, 100900595, N'Thanh toán đơn hàng 832fd770a4364f7b82e8a66675fc1bcc', NULL, NULL, NULL, CAST(N'2024-11-05T21:32:01.3232571+07:00' AS DateTimeOffset), CAST(N'2024-11-05T21:32:01.3232571+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'76683fac763347e9b5457cf4a7e2eb5d', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T20:01:48.7749156+07:00' AS DateTimeOffset), 1, 10000, 100923718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T20:01:48.7749099+07:00' AS DateTimeOffset), CAST(N'2024-11-05T20:01:48.7749099+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'798616b33e7045a99442a97918b7e501', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:49:06.7326050+07:00' AS DateTimeOffset), 1, 10000, 100770000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:49:06.7326008+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:49:06.7326008+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7ca691e1dc124c8fa3547ef803bec33b', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:53:48.0912577+07:00' AS DateTimeOffset), 1, 100000, 610000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:53:48.0912528+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:53:48.0912528+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7e27e39772dd45c09b5f46f09f23f8e4', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T19:53:56.6029123+07:00' AS DateTimeOffset), 1, 10000, 100873718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T19:53:56.6029060+07:00' AS DateTimeOffset), CAST(N'2024-11-05T19:53:56.6029060+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7f5c32c903754d6598f8c0b5f71d2b7a', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:44:21.0424867+07:00' AS DateTimeOffset), 1, 10000, 100740000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:44:21.0424834+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:44:21.0424834+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8876d5d6a3f749a38d60b8218d6b73c0', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T19:46:53.5863013+07:00' AS DateTimeOffset), 1, 10000, 100863718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T19:46:53.5862958+07:00' AS DateTimeOffset), CAST(N'2024-11-05T19:46:53.5862958+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'910385fb5e084bd296a52b01a91449a2', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:42:33.5050768+07:00' AS DateTimeOffset), 1, 10000, 100730000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:42:33.5050727+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:42:33.5050727+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'96b900181a5a47baa44ad65a91aa3b66', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:45:44.7240171+07:00' AS DateTimeOffset), 1, 10000, 100750000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:45:44.7240138+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:45:44.7240138+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9a61d10a58c24aafbcea1fa259119a02', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T19:55:54.6721953+07:00' AS DateTimeOffset), 1, 10000, 100893718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T19:55:54.6721897+07:00' AS DateTimeOffset), CAST(N'2024-11-05T19:55:54.6721897+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'aa60eca8db3d42aa9d7741dc4cc9b0a2', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:57:34.6634150+07:00' AS DateTimeOffset), 1, 100000, 100710000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:57:34.6634093+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:57:34.6634093+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b4d01dc74c5c45a785b52084a0f2af54', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T15:20:27.2530788+07:00' AS DateTimeOffset), 1, 23123, 100843718, N'Thanh toán đơn hàng ee40068caacb4103aad8440130af5b0c', NULL, NULL, NULL, CAST(N'2024-11-05T15:20:27.2530726+07:00' AS DateTimeOffset), CAST(N'2024-11-05T15:20:27.2530726+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b753803f422249a683c1a7c71842884d', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T21:32:55.3926921+07:00' AS DateTimeOffset), 1, 10000, 100910595, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T21:32:55.3926849+07:00' AS DateTimeOffset), CAST(N'2024-11-05T21:32:55.3926849+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bd6c99787889410fb2640de9e6c7a538', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T19:54:31.2116615+07:00' AS DateTimeOffset), 1, 10000, 100883718, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-05T19:54:31.2116565+07:00' AS DateTimeOffset), CAST(N'2024-11-05T19:54:31.2116565+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c09d4c1e0b51426f908c6c0b0527d333', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:53:47.9377658+07:00' AS DateTimeOffset), 1, 100000, 510000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:53:47.9377588+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:53:47.9377588+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c7f83632100e448d9b79feeabb74ea26', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:53:47.7878357+07:00' AS DateTimeOffset), 1, 100000, 410000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:53:47.7878303+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:53:47.7878303+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e26b7bf189e14733abf8e093fd34961d', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-06T08:33:54.4551275+07:00' AS DateTimeOffset), 0, 631000, 0, N'Thanh toán đơn hàng9f425d3cedb94b4ca6677e529c929e49', NULL, NULL, NULL, CAST(N'2024-11-06T08:33:54.4550300+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:33:54.4550300+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e417a61922c44bd9b2d7de66e4eeeb62', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:53:47.0522996+07:00' AS DateTimeOffset), 1, 100000, 310000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:53:47.0522947+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:53:47.0522947+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e5e7335f500c418b92a7e3cc5ee2aa4e', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T20:11:20.2088147+07:00' AS DateTimeOffset), 1, 100000, 100890000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T20:11:20.2088108+07:00' AS DateTimeOffset), CAST(N'2024-11-03T20:11:20.2088108+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e81a96a57beb48fe960f9322f8d68a1d', N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', CAST(N'2024-11-02T22:18:51.9665197+07:00' AS DateTimeOffset), 0, 23135, 0, N'Thanh toán đơn hàng94f026e8d7f54058b4225c357ac8d4ba', NULL, NULL, NULL, CAST(N'2024-11-02T22:18:51.9664548+07:00' AS DateTimeOffset), CAST(N'2024-11-02T22:18:51.9664548+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'eeb1a19bf4a442d5802452e2ed0c79f1', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-05T22:12:15.4019047+07:00' AS DateTimeOffset), 0, 23123, 0, N'Thanh toán đơn hànga4413d4ff06d45f1981820fa025ddcfc', NULL, NULL, NULL, CAST(N'2024-11-05T22:12:15.4018986+07:00' AS DateTimeOffset), CAST(N'2024-11-05T22:12:15.4018986+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f0794a97166e48f2b5825738cc08ecd5', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T16:51:18.2437791+07:00' AS DateTimeOffset), 1, 100000, 110000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T16:51:18.2437717+07:00' AS DateTimeOffset), CAST(N'2024-11-03T16:51:18.2437717+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[TransactionHistories] ([Id], [UserId], [TransactionDate], [Type], [Amount], [BalanceAfterTransaction], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f8f629dcf8934efb8b0142e714e92418', N'28c60baa-625c-41f1-5db2-08dcfa25500b', CAST(N'2024-11-03T17:41:33.2158622+07:00' AS DateTimeOffset), 1, 10000, 100720000, N'Nạp tiền vào tài khoản', NULL, NULL, NULL, CAST(N'2024-11-03T17:41:33.2158591+07:00' AS DateTimeOffset), CAST(N'2024-11-03T17:41:33.2158591+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'48ac16f3-4cc6-410f-40ee-08dcf95b5923', N'da53c73e-44bc-4adf-f419-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.4153575+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.4153575+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b60d0559-eec3-4283-40ef-08dcf95b5923', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.5518111+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.5518111+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N'88bef6b9-a0b3-49af-f41b-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.6318851+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.6318851+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3efa43d8-9937-4080-0a08-08dcf9bb3a91', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T21:49:31.7643534+07:00' AS DateTimeOffset), CAST(N'2024-10-31T21:49:31.7643534+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a2d02c3c-4b70-4ee5-0a09-08dcf9bb3a91', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T21:50:21.8565004+07:00' AS DateTimeOffset), CAST(N'2024-10-31T21:50:21.8565004+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a9a4d4a5-bfc5-4437-0a0a-08dcf9bb3a91', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-10-31T22:19:48.0504480+07:00' AS DateTimeOffset), CAST(N'2024-10-31T22:19:48.0504480+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-11-01T10:28:54.4148710+07:00' AS DateTimeOffset), CAST(N'2024-11-01T10:28:54.4148710+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-11-01T11:12:31.8874961+07:00' AS DateTimeOffset), CAST(N'2024-11-01T11:12:31.8874961+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fd3371b0-a9cc-4a20-5db3-08dcfa25500b', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-11-01T11:38:10.9489620+07:00' AS DateTimeOffset), CAST(N'2024-11-01T11:38:10.9489620+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'89c25428-17ed-4503-8ecb-08dcfe01928d', N'56003a73-b4ee-45b4-f41a-08dcf95b58f1', NULL, NULL, NULL, CAST(N'2024-11-06T08:23:08.7779775+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:23:08.7779775+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'48ac16f3-4cc6-410f-40ee-08dcf95b5923', 0, N'Admin', NULL, NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.1669184+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.1669184+07:00' AS DateTimeOffset), NULL, 0, NULL, N'Admin@gmail.com', N'ADMIN@GMAIL.COM', N'Admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAENzovo3n+LVuN9H5ydsf0FjY52VEvIqvN8aLvXT0oNu+K3J2iBnSqa5ymAG4egnaTg==', N'X4J5BMLV55BW43VC3ILXKUOM5R3H5ZG7', N'e603b7fb-9a9c-46f5-99f9-7053825862b2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b60d0559-eec3-4283-40ef-08dcf95b5923', 0, N'Member 1', NULL, NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.4926517+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.4926517+07:00' AS DateTimeOffset), NULL, 0, NULL, N'Member@gmail.com', N'MEMBER@GMAIL.COM', N'Member@gmail.com', N'MEMBER@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEDuLYblDcQ6YVZG7QD5TfZNf7nIWenifDv344iuDoSFQ9wJ2PiQsVKkkhQ6IaU+3mw==', N'OBN3DR6RZDGEX3YJ275ME6TLRMK2OSSI', N'3696abad-dbc1-484d-b0d5-dbab15b0cb11', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', 0, N'Staff1', NULL, NULL, NULL, NULL, CAST(N'2024-10-31T10:23:11.5683730+07:00' AS DateTimeOffset), CAST(N'2024-10-31T10:23:11.5683730+07:00' AS DateTimeOffset), NULL, 0, NULL, N'Staff@gmail.com', N'STAFF@GMAIL.COM', N'Staff@gmail.com', N'STAFF@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFbRLtAxUzZyz/kuCQ/cSNGbJZk6weeYrKHHxVOY6kBt0XwkTeJrHUe775JjCUQa7A==', N'OYKT4X3DLG6HNAURLPWOHZ62I32P2ADU', N'c7709333-d567-49c7-b9db-41fc12559b46', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3efa43d8-9937-4080-0a08-08dcf9bb3a91', 0, N'Chien', NULL, NULL, NULL, NULL, CAST(N'2024-10-31T21:49:31.4997376+07:00' AS DateTimeOffset), CAST(N'2024-10-31T21:49:31.4997376+07:00' AS DateTimeOffset), NULL, 0, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N'chienskull@example.com', N'CHIENSKULL@EXAMPLE.COM', N'chienskull@example.com', N'CHIENSKULL@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEM8wlG4IgCLOEDCGj9eqe9OgPdG38obTpu7AfTrSWygJy06bdp5zIjEfPwl+q0x9Tw==', N'GFJC6PY73R3QKJ6MCULNQXTQAWVP7WR7', N'364cbda3-f16f-40a6-bbed-2fa786da5dc2', N'0914200229', 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a2d02c3c-4b70-4ee5-0a09-08dcf9bb3a91', 0, N'Chien', NULL, NULL, NULL, NULL, CAST(N'2024-10-31T21:50:21.7604748+07:00' AS DateTimeOffset), CAST(N'2024-10-31T21:50:21.7604748+07:00' AS DateTimeOffset), NULL, 0, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N'chienskull@gmail.com', N'CHIENSKULL@GMAIL.COM', N'chienskull@gmail.com', N'CHIENSKULL@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEEjPFi+9whJdk0X7Tc7khic4jXXlJObb8fdY3sITl24XSOiLwozz4KeRkUphje2MlQ==', N'KUENZKYG7K2E3CY3U5URWLSEULVKZJPZ', N'167d025c-01ad-4a39-ae06-f12acc0eb85f', N'0914200229', 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a9a4d4a5-bfc5-4437-0a0a-08dcf9bb3a91', 0, N'Nguyễn Công Chiến', NULL, NULL, NULL, NULL, CAST(N'2024-10-31T22:19:47.9568739+07:00' AS DateTimeOffset), CAST(N'2024-10-31T22:19:47.9568739+07:00' AS DateTimeOffset), NULL, 0, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N'ncchien553@gmail.com', N'NCCHIEN553@GMAIL.COM', N'ncchien553@gmail.com', N'NCCHIEN553@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEMJhsj4TFUaquNsC1iYJEq4XNZasW0OwkKLdr543rxevEFPIhW0QWiZB2H3Z2Eh7nA==', N'ODB32SIDCCSODFR4QGSQCGS4U5MU3QM7', N'ff5a963c-fc05-407c-a25f-b4c6b79dd35c', N'0914200229', 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', 0, N'Chien', N'123 hung vuong 123', NULL, N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', NULL, CAST(N'2024-11-01T10:28:54.2316453+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:35:56.7933682+07:00' AS DateTimeOffset), NULL, 0, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N's3rcc.11@gmail.com', N'S3RCC.11@GMAIL.COM', N's3rcc.11@gmail.com', N'S3RCC.11@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEE7N5ipvO4p1+lLHDNpA+CKvWKSwnEQsQxglhyj4C9m86lsjpMr60MP+eMoBJFtZWA==', N'HWX6ICLBOAW4SYRVF3KIYLBBHDAZC576', N'fb98800d-fead-4943-be45-fce11408108a', N'099999999999', 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'28c60baa-625c-41f1-5db2-08dcfa25500b', 0, N'chien', N'B03CDCCBA8DB', NULL, N'28c60baa-625c-41f1-5db2-08dcfa25500b', NULL, CAST(N'2024-11-01T11:12:31.7866664+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:31:58.5461938+07:00' AS DateTimeOffset), NULL, 100930595, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N's3rcc.9@gmail.com', N'S3RCC.9@GMAIL.COM', N's3rcc.9@gmail.com', N'S3RCC.9@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEL0z5EkhVIjpkar5hzfh1bdhcDM4zLT9ciJ0qT9qKAZBufEkeXgchV5ggRrId+Iq8w==', N'AU6G4D3DWJ3UY24UQEWDFOAWJJZO2CVA', N'9a2cb2c4-18e3-4758-9a7e-4dc458cf518a', N'0914200229', 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fd3371b0-a9cc-4a20-5db3-08dcfa25500b', 0, N'NGuye', NULL, NULL, NULL, NULL, CAST(N'2024-11-01T11:38:10.8634919+07:00' AS DateTimeOffset), CAST(N'2024-11-01T11:38:10.8634919+07:00' AS DateTimeOffset), NULL, 0, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N'chienncse173694@fpt.edu.vn', N'CHIENNCSE173694@FPT.EDU.VN', N'chienncse173694@fpt.edu.vn', N'CHIENNCSE173694@FPT.EDU.VN', 0, N'AQAAAAIAAYagAAAAEHRcg7UzGMoNs+srgeBxuBuny7gcXRNaDCnq5TK+jD8Np995rKShXtt8HLdVVpK92w==', N'GMGPI2PS4R67GK7Z5NPTZMAOU26H4HIZ', N'270582fb-b517-4568-921a-bf5a4070a4fb', N'0914200229', 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Points], [Name], [ShippingAddress], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Balance], [ManagerId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'89c25428-17ed-4503-8ecb-08dcfe01928d', 0, N'Vũ', NULL, NULL, NULL, NULL, CAST(N'2024-11-06T08:23:08.5769670+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:23:08.5769670+07:00' AS DateTimeOffset), NULL, 0, N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N'7appci@gmail.com', N'7APPCI@GMAIL.COM', N'7appci@gmail.com', N'7APPCI@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEOxbjhVEDEen5yC4UcLYbN5HYdlVpTgoiEWnsX9fLQxuOCCvfv/Smsuj7OUwIGxRUQ==', N'P2UUVXDRQXLHNO5RCVXWHSBFI3YZ24AJ', N'8cf20f7e-c356-4b24-a4a5-f87a60bde01a', N'0914200229', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[UserTokens] ([UserId], [LoginProvider], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Value]) VALUES (N'48ac16f3-4cc6-410f-40ee-08dcf95b5923', N'Default', N'RefreshToken', NULL, NULL, NULL, CAST(N'2024-11-06T09:10:11.4700194+07:00' AS DateTimeOffset), CAST(N'2024-11-06T09:10:11.4700194+07:00' AS DateTimeOffset), NULL, N'7c0f2584-ce05-4bcd-8764-8ca97b5d94cc')
INSERT [dbo].[UserTokens] ([UserId], [LoginProvider], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Value]) VALUES (N'2b2cdcca-7da6-405d-40f0-08dcf95b5923', N'Default', N'RefreshToken', NULL, NULL, NULL, CAST(N'2024-11-06T08:40:44.8282702+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:40:44.8282702+07:00' AS DateTimeOffset), NULL, N'6d250bdb-524e-4811-a3c7-09c8c074f76e')
INSERT [dbo].[UserTokens] ([UserId], [LoginProvider], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Value]) VALUES (N'a2d02c3c-4b70-4ee5-0a09-08dcf9bb3a91', N'Default', N'RefreshToken', NULL, NULL, NULL, CAST(N'2024-10-31T21:55:50.3333866+07:00' AS DateTimeOffset), CAST(N'2024-10-31T21:55:50.3333866+07:00' AS DateTimeOffset), NULL, N'd6455fa8-e304-4aa0-a876-bf4baaeff43d')
INSERT [dbo].[UserTokens] ([UserId], [LoginProvider], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Value]) VALUES (N'a9a4d4a5-bfc5-4437-0a0a-08dcf9bb3a91', N'Default', N'RefreshToken', NULL, NULL, NULL, CAST(N'2024-11-01T10:26:55.3334078+07:00' AS DateTimeOffset), CAST(N'2024-11-01T10:26:55.3334078+07:00' AS DateTimeOffset), NULL, N'4613f3eb-3a5e-4c1b-9217-d85dafd8761e')
INSERT [dbo].[UserTokens] ([UserId], [LoginProvider], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Value]) VALUES (N'a12e8401-f21f-4fc9-5db1-08dcfa25500b', N'Default', N'RefreshToken', NULL, NULL, NULL, CAST(N'2024-11-06T08:34:49.6749724+07:00' AS DateTimeOffset), CAST(N'2024-11-06T08:34:49.6749724+07:00' AS DateTimeOffset), NULL, N'dc591c46-0744-480c-a15f-46ad88ed9c10')
INSERT [dbo].[UserTokens] ([UserId], [LoginProvider], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Value]) VALUES (N'28c60baa-625c-41f1-5db2-08dcfa25500b', N'Default', N'RefreshToken', NULL, NULL, NULL, CAST(N'2024-11-06T09:03:28.1344207+07:00' AS DateTimeOffset), CAST(N'2024-11-06T09:03:28.1344207+07:00' AS DateTimeOffset), NULL, N'fbd62f83-ba4f-4cb5-b86f-bba95204c941')
GO
INSERT [dbo].[Vouchers] ([Id], [Description], [SalePrice], [SalePercent], [LimitSalePrice], [ExpiryDate], [UsingLimit], [UsedCount], [Status], [Name], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cae13ba7f16c447fbde8646312844d9f', N'fsdafasds', 50000, 20, 20000, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), 50, 0, 0, N'Ưu đãi 20%', N'20ABXC', NULL, NULL, NULL, CAST(N'2024-11-04T09:28:50.7019895+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:11:31.0531683+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Vouchers] ([Id], [Description], [SalePrice], [SalePercent], [LimitSalePrice], [ExpiryDate], [UsingLimit], [UsedCount], [Status], [Name], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd9fca716d4c643e0ace0725dd32188e5', N'Tri ân khách hàng', 50000, 10, 40000, CAST(N'2024-11-22T00:00:00.0000000' AS DateTime2), 15, 1, 0, N'Tri ân khách hàng', N'MPA7SN', NULL, NULL, NULL, CAST(N'2024-11-03T20:12:55.3577870+07:00' AS DateTimeOffset), CAST(N'2024-11-06T00:12:08.5765436+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Vouchers] ([Id], [Description], [SalePrice], [SalePercent], [LimitSalePrice], [ExpiryDate], [UsingLimit], [UsedCount], [Status], [Name], [VoucherCode], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'dcec5cd183bd4a05b7b2ddaaf5eb7781', N'ÁDADS', 123123, 13, 123, CAST(N'2024-11-06T00:00:00.0000000' AS DateTime2), 123, 4, 0, N'ádfsdaf', N'111111', NULL, NULL, NULL, CAST(N'2024-11-04T08:58:54.0674493+07:00' AS DateTimeOffset), CAST(N'2024-11-04T08:58:54.0674500+07:00' AS DateTimeOffset), NULL)
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_Gifts_ProductId] ON [dbo].[Gifts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_OrderDetailGifts_GiftId] ON [dbo].[OrderDetailGifts]
(
	[GiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_OrderDetailGifts_OrderGiftId] ON [dbo].[OrderDetailGifts]
(
	[OrderGiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderID] ON [dbo].[OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductID] ON [dbo].[OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_OrderGifts_UserID] ON [dbo].[OrderGifts]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_PostProduct_PostId] ON [dbo].[PostProduct]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_PostProduct_ProductId] ON [dbo].[PostProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_PreOrders_ProductID] ON [dbo].[PreOrders]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_PreOrders_UserID] ON [dbo].[PreOrders]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [IX_Reviews_OrderDetailID] ON [dbo].[Reviews]
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Reviews_UserID] ON [dbo].[Reviews]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_TransactionHistories_UserId] ON [dbo].[TransactionHistories]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Users_ManagerId] ON [dbo].[Users]
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gifts]  WITH CHECK ADD  CONSTRAINT [FK_Gifts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gifts] CHECK CONSTRAINT [FK_Gifts_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderDetailGifts]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailGifts_Gifts_GiftId] FOREIGN KEY([GiftId])
REFERENCES [dbo].[Gifts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetailGifts] CHECK CONSTRAINT [FK_OrderDetailGifts_Gifts_GiftId]
GO
ALTER TABLE [dbo].[OrderDetailGifts]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailGifts_OrderGifts_OrderGiftId] FOREIGN KEY([OrderGiftId])
REFERENCES [dbo].[OrderGifts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetailGifts] CHECK CONSTRAINT [FK_OrderDetailGifts_OrderGifts_OrderGiftId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductID]
GO
ALTER TABLE [dbo].[OrderGifts]  WITH CHECK ADD  CONSTRAINT [FK_OrderGifts_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderGifts] CHECK CONSTRAINT [FK_OrderGifts_Users_UserID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[PostProduct]  WITH CHECK ADD  CONSTRAINT [FK_PostProduct_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostProduct] CHECK CONSTRAINT [FK_PostProduct_Posts_PostId]
GO
ALTER TABLE [dbo].[PostProduct]  WITH CHECK ADD  CONSTRAINT [FK_PostProduct_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostProduct] CHECK CONSTRAINT [FK_PostProduct_Products_ProductId]
GO
ALTER TABLE [dbo].[PreOrders]  WITH CHECK ADD  CONSTRAINT [FK_PreOrders_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PreOrders] CHECK CONSTRAINT [FK_PreOrders_Products_ProductID]
GO
ALTER TABLE [dbo].[PreOrders]  WITH CHECK ADD  CONSTRAINT [FK_PreOrders_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PreOrders] CHECK CONSTRAINT [FK_PreOrders_Users_UserID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category_CategoryId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_OrderDetails_OrderDetailID] FOREIGN KEY([OrderDetailID])
REFERENCES [dbo].[OrderDetails] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_OrderDetails_OrderDetailID]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users_UserID]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[TransactionHistories]  WITH CHECK ADD  CONSTRAINT [FK_TransactionHistories_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionHistories] CHECK CONSTRAINT [FK_TransactionHistories_Users_UserId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users_ManagerId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [MilkStore] SET  READ_WRITE 
GO
