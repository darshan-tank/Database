USE [master]
GO
/****** Object:  Database [Helperland]    Script Date: 3/21/2022 9:31:53 PM ******/
CREATE DATABASE [Helperland]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Helperland', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Helperland.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Helperland_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Helperland_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Helperland] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Helperland].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Helperland] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Helperland] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Helperland] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Helperland] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Helperland] SET ARITHABORT OFF 
GO
ALTER DATABASE [Helperland] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Helperland] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Helperland] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Helperland] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Helperland] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Helperland] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Helperland] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Helperland] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Helperland] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Helperland] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Helperland] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Helperland] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Helperland] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Helperland] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Helperland] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Helperland] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Helperland] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Helperland] SET RECOVERY FULL 
GO
ALTER DATABASE [Helperland] SET  MULTI_USER 
GO
ALTER DATABASE [Helperland] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Helperland] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Helperland] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Helperland] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Helperland] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Helperland', N'ON'
GO
ALTER DATABASE [Helperland] SET QUERY_STORE = OFF
GO
USE [Helperland]
GO
/****** Object:  Table [dbo].[City]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactUsId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[SubjectType] [nvarchar](100) NOT NULL,
	[Subject] [nvarchar](500) NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[UploadFileName] [nvarchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Status] [int] NULL,
	[Priority] [int] NULL,
	[AssignedToUser] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactUsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUsAttachment]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUsAttachment](
	[ContactUsAttachmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[FileName] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_ContactUsAttachment] PRIMARY KEY CLUSTERED 
(
	[ContactUsAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtraServices]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraServices](
	[ServiceExtraId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceExtraName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceExtraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteAndBlocked]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteAndBlocked](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TargetUserId] [int] NOT NULL,
	[IsFavorite] [bit] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
 CONSTRAINT [PK_FavoriteAndBlocked] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestId] [int] NOT NULL,
	[RatingFrom] [int] NOT NULL,
	[RatingTo] [int] NOT NULL,
	[Ratings] [decimal](4, 2) NULL,
	[Comments] [nvarchar](2000) NULL,
	[RatingDate] [datetime] NOT NULL,
	[IsApproved] [bit] NULL,
	[VisibleOnHomeScreen] [bit] NOT NULL,
	[OnTimeArrival] [decimal](2, 1) NOT NULL,
	[Friendly] [decimal](2, 1) NOT NULL,
	[QualityOfService] [decimal](2, 1) NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequest](
	[ServiceRequestId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ServiceStartDate] [datetime] NOT NULL,
	[ZipCode] [nvarchar](10) NOT NULL,
	[ServiceFrequency] [tinyint] NULL,
	[ServiceHourlyRate] [decimal](8, 2) NULL,
	[ServiceHours] [float] NOT NULL,
	[ExtraHours] [float] NULL,
	[SubTotal] [decimal](8, 2) NOT NULL,
	[Discount] [decimal](8, 2) NULL,
	[TotalCost] [decimal](8, 2) NOT NULL,
	[Comments] [nvarchar](500) NULL,
	[PaymentTransactionRefNo] [nvarchar](50) NULL,
	[PaymentDue] [bit] NOT NULL,
	[JobStatus] [tinyint] NULL,
	[ServiceProviderId] [int] NULL,
	[SPAcceptedDate] [datetime] NULL,
	[HasPets] [bit] NOT NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[RefundedAmount] [decimal](8, 2) NULL,
	[Distance] [decimal](18, 2) NOT NULL,
	[HasIssue] [bit] NULL,
	[PaymentDone] [bit] NULL,
	[RecordVersion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ServiceRequest] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequestAddress]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequestAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestId] [int] NULL,
	[AddressLine1] [nvarchar](200) NULL,
	[AddressLine2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_ServiceRequestAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequestExtra]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequestExtra](
	[ServiceRequestExtraId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestId] [int] NOT NULL,
	[ServiceExtraId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceRequestExtra] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestExtraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceSetting]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionType] [int] NOT NULL,
	[Interval] [int] NOT NULL,
	[ScheduleTime] [time](7) NOT NULL,
	[LastPoll] [datetime] NOT NULL,
 CONSTRAINT [PK_ServiceSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceStatus]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[RoleId] [int] NULL,
	[Gender] [int] NULL,
	[DateOfBirth] [datetime] NULL,
	[WebSite] [nvarchar](1000) NULL,
	[UserProfilePicture] [nvarchar](200) NULL,
	[IsRegisteredUser] [bit] NOT NULL,
	[PaymentGatewayUserRef] [nvarchar](200) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[WorksWithPets] [bit] NOT NULL,
	[LanguageId] [int] NULL,
	[NationalityId] [int] NULL,
	[ResetKey] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Status] [int] NULL,
	[IsOnline] [bit] NOT NULL,
	[BankTokenId] [nvarchar](100) NULL,
	[TaxNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddress]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AddressLine1] [nvarchar](200) NOT NULL,
	[AddressLine2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zipcode]    Script Date: 3/21/2022 9:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zipcode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ZipcodeValue] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Zipcode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [CityName], [StateId]) VALUES (1, N'Troisdrof', 1)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[ExtraServices] ON 

INSERT [dbo].[ExtraServices] ([ServiceExtraId], [ServiceExtraName]) VALUES (1, N'Inside cabinet')
INSERT [dbo].[ExtraServices] ([ServiceExtraId], [ServiceExtraName]) VALUES (2, N'Inside fridge')
INSERT [dbo].[ExtraServices] ([ServiceExtraId], [ServiceExtraName]) VALUES (3, N'Inside oven')
INSERT [dbo].[ExtraServices] ([ServiceExtraId], [ServiceExtraName]) VALUES (4, N'Laundry wash & dry')
INSERT [dbo].[ExtraServices] ([ServiceExtraId], [ServiceExtraName]) VALUES (5, N'Interior windows')
SET IDENTITY_INSERT [dbo].[ExtraServices] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteAndBlocked] ON 

INSERT [dbo].[FavoriteAndBlocked] ([Id], [UserId], [TargetUserId], [IsFavorite], [IsBlocked]) VALUES (1, 1, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[FavoriteAndBlocked] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [ServiceRequestId], [RatingFrom], [RatingTo], [Ratings], [Comments], [RatingDate], [IsApproved], [VisibleOnHomeScreen], [OnTimeArrival], [Friendly], [QualityOfService]) VALUES (1, 3, 1, 2, CAST(13.50 AS Decimal(4, 2)), N'Nice Service.', CAST(N'2022-03-18T13:25:51.003' AS DateTime), 1, 0, CAST(4.5 AS Decimal(2, 1)), CAST(4.0 AS Decimal(2, 1)), CAST(5.0 AS Decimal(2, 1)))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequest] ON 

INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (3, 1, 0, CAST(N'2022-03-17T14:00:00.000' AS DateTime), N'320029', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 0, CAST(6102.00 AS Decimal(8, 2)), CAST(1220.00 AS Decimal(8, 2)), CAST(4880.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, 2, NULL, 0, 3, CAST(N'2022-03-15T14:34:21.643' AS DateTime), CAST(N'2022-03-18T12:26:57.110' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (4, 1, 0, CAST(N'2022-03-16T14:00:00.000' AS DateTime), N'320029', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), N'Service request cancelled by Admin.', NULL, 0, NULL, 2, NULL, 0, 2, CAST(N'2022-03-16T16:23:11.030' AS DateTime), CAST(N'2022-03-16T16:23:11.030' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (5, 1, 0, CAST(N'2022-03-16T17:00:00.000' AS DateTime), N'320029', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 2, CAST(10170.00 AS Decimal(8, 2)), CAST(2034.00 AS Decimal(8, 2)), CAST(8136.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2022-03-16T16:23:40.627' AS DateTime), CAST(N'2022-03-16T16:23:40.627' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (6, 1, 0, CAST(N'2022-03-18T16:00:00.000' AS DateTime), N'320029', NULL, CAST(2034.00 AS Decimal(8, 2)), 4, 1.5, CAST(11187.00 AS Decimal(8, 2)), CAST(2237.00 AS Decimal(8, 2)), CAST(8949.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, 2, NULL, 0, 4, CAST(N'2022-03-18T18:08:30.067' AS DateTime), CAST(N'2022-03-18T18:08:30.067' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ServiceRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequestAddress] ON 

INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (3, 3, N'VijayNagar', N'A-120', N'Troisdrof', N'Troisdrof', N'320029', N'8511221782', N'customer@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (4, 4, N'VijayNagar', N'A-120', N'Troisdrof', N'Troisdrof', N'320029', N'8511221782', N'customer@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (5, 5, N'VijayNagar', N'A-120', N'Troisdrof', N'Troisdrof', N'320029', N'8511221782', N'customer@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (6, 6, N'VijayNagar', N'A-120', N'Troisdrof', N'Troisdrof', N'320029', N'8511221782', N'customer@yopmail.com', 1)
SET IDENTITY_INSERT [dbo].[ServiceRequestAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequestExtra] ON 

INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (2, 4, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (3, 4, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (4, 4, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (5, 5, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (6, 5, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (7, 5, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (8, 5, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (9, 6, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (10, 6, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (11, 6, 4)
SET IDENTITY_INSERT [dbo].[ServiceRequestExtra] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceStatus] ON 

INSERT [dbo].[ServiceStatus] ([StatusId], [StatusName]) VALUES (1, N'New')
INSERT [dbo].[ServiceStatus] ([StatusId], [StatusName]) VALUES (2, N'Cancelled')
INSERT [dbo].[ServiceStatus] ([StatusId], [StatusName]) VALUES (3, N'Completed')
INSERT [dbo].[ServiceStatus] ([StatusId], [StatusName]) VALUES (4, N'Accepted')
SET IDENTITY_INSERT [dbo].[ServiceStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [StateName]) VALUES (1, N'Troisdrof')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1, N'Vijay', N'Sharma', N'customer@yopmail.com', N'12345678Dd@', N'8511111781', 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-03-15T12:09:24.000' AS DateTime), CAST(N'2022-03-15T12:09:24.000' AS DateTime), 0, 0, 1, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (2, N'Darshan', N'Tank', N'provider@yopmail.com', N'12345678Dd@', N'8511111781', 2, NULL, 1, CAST(N'2000-02-09T00:00:00.000' AS DateTime), NULL, N'/images/avatar-iron.png', 0, NULL, N'320029', 0, NULL, 1, NULL, CAST(N'2022-03-15T12:11:09.000' AS DateTime), CAST(N'2022-03-15T12:11:09.000' AS DateTime), 0, 0, 1, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (3, N'Vijay', N'Tank', N'adminhelperland@yopmail.com', N'12345678Dd@', N'8511111781', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-03-15T14:04:30.000' AS DateTime), CAST(N'2022-03-15T14:04:30.000' AS DateTime), 0, 0, 1, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (4, N'Vijay', N'Chauhan', N'provider1@yopmail.com', N'12345678Dd@', N'8511111781', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-03-19T09:57:41.000' AS DateTime), CAST(N'2022-03-19T09:57:41.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAddress] ON 

INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (1014, 2, N'Samta', N'Subhanpura', N'Troisdrof', N'Troisdrof', N'320029', 0, 0, N'8511111781', N'provider@yopmail.com', NULL)
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (1015, 1, N'Samta', N'A-112', N'Troisdrof', N'Troisdrof', N'320029', 0, 1, N'8511221178', N'customer@yopmail.com', NULL)
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (1016, 1, N'VijayNagar', N'A-120', N'Troisdrof', N'Troisdrof', N'320029', 0, 0, N'8511221782', N'customer@yopmail.com', NULL)
SET IDENTITY_INSERT [dbo].[UserAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Zipcode] ON 

INSERT [dbo].[Zipcode] ([Id], [ZipcodeValue], [CityId]) VALUES (1, N'555666', 1)
SET IDENTITY_INSERT [dbo].[Zipcode] OFF
GO
ALTER TABLE [dbo].[ContactUs] ADD  CONSTRAINT [DF_ContactUs_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_IsApproved]  DEFAULT ((1)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_VisibleOnHomeScreen]  DEFAULT ((0)) FOR [VisibleOnHomeScreen]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_OnTimeArrival]  DEFAULT ((0)) FOR [OnTimeArrival]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_Friendly]  DEFAULT ((0)) FOR [Friendly]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_QualityOfService]  DEFAULT ((0)) FOR [QualityOfService]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_PaymentDue]  DEFAULT ((0)) FOR [PaymentDue]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_IsPet]  DEFAULT ((0)) FOR [HasPets]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_Distance]  DEFAULT ((0)) FOR [Distance]
GO
ALTER TABLE [dbo].[ServiceRequestAddress] ADD  CONSTRAINT [DF_ServiceRequestAddress_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsRegisteredUser]  DEFAULT ((0)) FOR [IsRegisteredUser]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_WorksWithPets]  DEFAULT ((0)) FOR [WorksWithPets]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsOnline]  DEFAULT ((0)) FOR [IsOnline]
GO
ALTER TABLE [dbo].[UserAddress] ADD  CONSTRAINT [DF_UserAddresses_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[UserAddress] ADD  CONSTRAINT [DF_UserAddresses_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[FavoriteAndBlocked]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteAndBlocked_FavoriteAndBlocked] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[FavoriteAndBlocked] CHECK CONSTRAINT [FK_FavoriteAndBlocked_FavoriteAndBlocked]
GO
ALTER TABLE [dbo].[FavoriteAndBlocked]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteAndBlocked_User] FOREIGN KEY([TargetUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[FavoriteAndBlocked] CHECK CONSTRAINT [FK_FavoriteAndBlocked_User]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_ServiceRequest] FOREIGN KEY([ServiceRequestId])
REFERENCES [dbo].[ServiceRequest] ([ServiceRequestId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_ServiceRequest]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User] FOREIGN KEY([RatingFrom])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User1] FOREIGN KEY([RatingTo])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User1]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_User]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_User1] FOREIGN KEY([ServiceProviderId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_User1]
GO
ALTER TABLE [dbo].[ServiceRequestAddress]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequestAddress_ServiceRequest] FOREIGN KEY([ServiceRequestId])
REFERENCES [dbo].[ServiceRequest] ([ServiceRequestId])
GO
ALTER TABLE [dbo].[ServiceRequestAddress] CHECK CONSTRAINT [FK_ServiceRequestAddress_ServiceRequest]
GO
ALTER TABLE [dbo].[ServiceRequestExtra]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequestExtra_ServiceExtraId] FOREIGN KEY([ServiceExtraId])
REFERENCES [dbo].[ExtraServices] ([ServiceExtraId])
GO
ALTER TABLE [dbo].[ServiceRequestExtra] CHECK CONSTRAINT [FK_ServiceRequestExtra_ServiceExtraId]
GO
ALTER TABLE [dbo].[ServiceRequestExtra]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequestExtra_ServiceRequest] FOREIGN KEY([ServiceRequestId])
REFERENCES [dbo].[ServiceRequest] ([ServiceRequestId])
GO
ALTER TABLE [dbo].[ServiceRequestExtra] CHECK CONSTRAINT [FK_ServiceRequestExtra_ServiceRequest]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [FK_UserAddresses_User]
GO
ALTER TABLE [dbo].[Zipcode]  WITH CHECK ADD  CONSTRAINT [FK_Zipcode_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Zipcode] CHECK CONSTRAINT [FK_Zipcode_City]
GO
USE [master]
GO
ALTER DATABASE [Helperland] SET  READ_WRITE 
GO
