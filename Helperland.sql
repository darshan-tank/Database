USE [master]
GO
/****** Object:  Database [Helperland]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[ContactUsAttachment]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[ExtraServices]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[FavoriteAndBlocked]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[Rating]    Script Date: 2/26/2022 3:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestId] [int] NOT NULL,
	[RatingFrom] [int] NOT NULL,
	[RatingTo] [int] NOT NULL,
	[Ratings] [decimal](2, 1) NOT NULL,
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
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[ServiceRequestAddress]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[ServiceRequestExtra]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[ServiceSetting]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[ServiceStatus]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[UserAddress]    Script Date: 2/26/2022 3:48:02 PM ******/
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
/****** Object:  Table [dbo].[Zipcode]    Script Date: 2/26/2022 3:48:02 PM ******/
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

INSERT [dbo].[FavoriteAndBlocked] ([Id], [UserId], [TargetUserId], [IsFavorite], [IsBlocked]) VALUES (3, 1009, 1010, 1, 0)
SET IDENTITY_INSERT [dbo].[FavoriteAndBlocked] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [ServiceRequestId], [RatingFrom], [RatingTo], [Ratings], [Comments], [RatingDate], [IsApproved], [VisibleOnHomeScreen], [OnTimeArrival], [Friendly], [QualityOfService]) VALUES (2, 38, 1009, 1010, CAST(9.0 AS Decimal(2, 1)), NULL, CAST(N'2022-02-25T23:25:59.363' AS DateTime), 1, 0, CAST(3.0 AS Decimal(2, 1)), CAST(3.0 AS Decimal(2, 1)), CAST(3.0 AS Decimal(2, 1)))
INSERT [dbo].[Rating] ([RatingId], [ServiceRequestId], [RatingFrom], [RatingTo], [Ratings], [Comments], [RatingDate], [IsApproved], [VisibleOnHomeScreen], [OnTimeArrival], [Friendly], [QualityOfService]) VALUES (3, 36, 1009, 1010, CAST(6.0 AS Decimal(2, 1)), N'Nice Service', CAST(N'2022-02-25T23:38:56.097' AS DateTime), 1, 0, CAST(2.0 AS Decimal(2, 1)), CAST(2.0 AS Decimal(2, 1)), CAST(2.0 AS Decimal(2, 1)))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequest] ON 

INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (1, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T17:57:56.790' AS DateTime), CAST(N'2022-02-15T17:57:56.790' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (2, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:10:11.827' AS DateTime), CAST(N'2022-02-15T18:10:11.827' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (3, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:17:04.527' AS DateTime), CAST(N'2022-02-15T18:17:04.527' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (4, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:24:34.893' AS DateTime), CAST(N'2022-02-15T18:24:34.897' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (5, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:29:00.233' AS DateTime), CAST(N'2022-02-15T18:29:00.233' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (6, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:31:41.583' AS DateTime), CAST(N'2022-02-15T18:31:41.583' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (7, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:34:25.340' AS DateTime), CAST(N'2022-02-15T18:34:25.340' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (8, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:36:34.703' AS DateTime), CAST(N'2022-02-15T18:36:34.703' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (9, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T18:39:29.793' AS DateTime), CAST(N'2022-02-15T18:39:29.793' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (10, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-15T19:26:09.883' AS DateTime), CAST(N'2022-02-15T19:26:09.887' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (11, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-15T19:27:22.133' AS DateTime), CAST(N'2022-02-15T19:27:22.133' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (12, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 0.5, CAST(7119.00 AS Decimal(8, 2)), CAST(1423.00 AS Decimal(8, 2)), CAST(5695.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T19:28:05.870' AS DateTime), CAST(N'2022-02-15T19:28:05.870' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (13, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T20:35:59.883' AS DateTime), CAST(N'2022-02-15T20:35:59.887' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (14, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 2, CAST(10170.00 AS Decimal(8, 2)), CAST(2034.00 AS Decimal(8, 2)), CAST(8136.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T20:39:05.403' AS DateTime), CAST(N'2022-02-15T20:39:05.403' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (15, 4, 0, CAST(N'2022-02-15T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 0.5, CAST(7119.00 AS Decimal(8, 2)), CAST(1423.00 AS Decimal(8, 2)), CAST(5695.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, CAST(N'2022-02-15T20:41:23.957' AS DateTime), CAST(N'2022-02-15T20:41:23.957' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (16, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T13:52:28.687' AS DateTime), CAST(N'2022-02-21T13:52:28.687' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (17, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T13:57:41.210' AS DateTime), CAST(N'2022-02-21T13:57:41.210' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (18, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T13:59:40.903' AS DateTime), CAST(N'2022-02-21T13:59:40.903' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (19, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:02:04.440' AS DateTime), CAST(N'2022-02-21T14:02:04.440' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (20, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:05:58.293' AS DateTime), CAST(N'2022-02-21T14:05:58.293' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (21, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:09:21.057' AS DateTime), CAST(N'2022-02-21T14:09:21.057' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (22, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:12:31.273' AS DateTime), CAST(N'2022-02-21T14:12:31.273' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (23, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 0.5, CAST(7119.00 AS Decimal(8, 2)), CAST(1423.00 AS Decimal(8, 2)), CAST(5695.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:14:38.703' AS DateTime), CAST(N'2022-02-21T14:14:38.703' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (24, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:18:01.680' AS DateTime), CAST(N'2022-02-21T14:18:01.680' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (25, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:20:53.293' AS DateTime), CAST(N'2022-02-21T14:20:53.293' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (26, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:22:50.977' AS DateTime), CAST(N'2022-02-21T14:22:50.977' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (27, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:24:31.260' AS DateTime), CAST(N'2022-02-21T14:24:31.260' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (28, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 2, CAST(10170.00 AS Decimal(8, 2)), CAST(2034.00 AS Decimal(8, 2)), CAST(8136.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:26:29.717' AS DateTime), CAST(N'2022-02-21T14:26:29.717' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (29, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 2, CAST(10170.00 AS Decimal(8, 2)), CAST(2034.00 AS Decimal(8, 2)), CAST(8136.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:28:03.860' AS DateTime), CAST(N'2022-02-21T14:28:03.860' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (30, 4, 0, CAST(N'2022-02-21T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2022-02-21T14:30:51.350' AS DateTime), CAST(N'2022-02-21T14:30:51.350' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (31, 1009, 0, CAST(N'2022-02-22T14:00:00.000' AS DateTime), N'320029', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), N'I am not at home at that time.', NULL, 0, NULL, NULL, NULL, 1, 2, CAST(N'2022-02-22T13:23:11.780' AS DateTime), CAST(N'2022-02-22T13:23:11.780' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (32, 1009, 0, CAST(N'2022-02-22T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 2, CAST(10170.00 AS Decimal(8, 2)), CAST(2034.00 AS Decimal(8, 2)), CAST(8136.00 AS Decimal(8, 2)), N'N/A', NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2022-02-22T13:27:48.390' AS DateTime), CAST(N'2022-02-22T13:27:48.390' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (33, 1009, 0, CAST(N'2022-02-22T15:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2022-02-22T13:56:36.970' AS DateTime), CAST(N'2022-02-22T13:56:36.970' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (34, 1009, 0, CAST(N'2022-02-22T16:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 2.5, CAST(11187.00 AS Decimal(8, 2)), CAST(2237.00 AS Decimal(8, 2)), CAST(8949.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2022-02-22T13:57:19.157' AS DateTime), CAST(N'2022-02-22T13:57:19.157' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (35, 4, 0, CAST(N'2022-02-23T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2022-02-23T19:37:02.860' AS DateTime), CAST(N'2022-02-23T19:37:02.860' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (36, 1009, 0, CAST(N'2022-02-24T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1.5, CAST(9153.00 AS Decimal(8, 2)), CAST(1830.00 AS Decimal(8, 2)), CAST(7322.00 AS Decimal(8, 2)), N'I am not at home at that time.', NULL, 0, NULL, 1010, NULL, 0, 2, CAST(N'2022-02-24T11:54:16.547' AS DateTime), CAST(N'2022-02-24T11:54:16.547' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (37, 1009, 0, CAST(N'2022-02-26T15:00:00.000' AS DateTime), N'320029', NULL, CAST(2034.00 AS Decimal(8, 2)), 4, 2.5, CAST(13221.00 AS Decimal(8, 2)), CAST(2644.00 AS Decimal(8, 2)), CAST(10576.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2022-02-24T14:50:38.223' AS DateTime), CAST(N'2022-02-25T10:42:09.530' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceFrequency], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [JobStatus], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (38, 1009, 0, CAST(N'2022-02-27T14:00:00.000' AS DateTime), N'555666', NULL, CAST(2034.00 AS Decimal(8, 2)), 3, 1, CAST(8136.00 AS Decimal(8, 2)), CAST(1627.00 AS Decimal(8, 2)), CAST(6508.00 AS Decimal(8, 2)), NULL, NULL, 0, NULL, 1010, NULL, 0, 2, CAST(N'2022-02-24T18:48:22.770' AS DateTime), CAST(N'2022-02-25T11:17:42.003' AS DateTime), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ServiceRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequestAddress] ON 

INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (5, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (6, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (7, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (8, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (9, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (10, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (11, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (12, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (13, 2, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (14, 2, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (15, 13, N'Samta', N'Laxmipura', N'Vadodara', N'Gujarat', N'555666', N'8511111782', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (16, 15, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (17, 16, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (18, 17, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (19, 18, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (20, 19, N'Samta', N'Laxmipura', N'Vadodara', N'Gujarat', N'555666', N'8511111782', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (21, 20, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (22, 21, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (23, 22, N'Samta', N'Laxmipura', N'Vadodara', N'Gujarat', N'555666', N'8511111782', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (24, 23, N'Samta', N'Laxmipura', N'Vadodara', N'Gujarat', N'555666', N'8511111782', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (25, 24, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (26, 25, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (27, 26, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (28, 27, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (29, 28, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (30, 29, N'Samta', N'Laxmipura', N'Vadodara', N'Gujarat', N'555666', N'8511111782', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (31, 30, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (32, 31, N'Pawandham', N'A-140', N'Troisdrof', N'Troisdrof', N'320029', N'8511221212', N'darsh1@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (33, 32, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'darsh1@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (34, 33, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'darsh1@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (35, 34, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'darsh1@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (36, 35, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'eea@g.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (37, 36, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'darsh1@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (38, 37, N'Pawandham', N'A-140', N'Troisdrof', N'Troisdrof', N'320029', N'8511221212', N'darsh1@yopmail.com', 1)
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email], [Type]) VALUES (39, 38, N'samta', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', N'8511221212', N'darsh1@yopmail.com', 1)
SET IDENTITY_INSERT [dbo].[ServiceRequestAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequestExtra] ON 

INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (1, 2, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (2, 2, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (3, 2, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (4, 2, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (5, 13, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (6, 13, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (7, 13, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (8, 13, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (9, 15, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (10, 16, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (11, 16, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (12, 17, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (13, 17, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (14, 18, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (15, 18, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (16, 19, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (17, 19, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (18, 20, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (19, 20, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (20, 21, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (21, 21, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (22, 22, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (23, 22, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (24, 22, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (25, 23, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (26, 24, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (27, 24, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (28, 24, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (29, 25, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (30, 25, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (31, 25, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (32, 26, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (33, 26, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (34, 27, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (35, 27, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (36, 27, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (37, 28, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (38, 28, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (39, 28, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (40, 28, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (41, 29, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (42, 29, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (43, 29, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (44, 29, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (45, 30, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (46, 30, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (47, 31, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (48, 31, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (49, 32, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (50, 32, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (51, 32, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (52, 32, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (53, 33, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (54, 33, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (55, 33, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (56, 34, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (57, 34, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (58, 34, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (59, 34, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (60, 34, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (61, 35, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (62, 35, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (63, 35, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (64, 36, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (65, 36, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (66, 36, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (67, 37, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (68, 37, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (69, 37, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (70, 37, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (71, 37, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (72, 38, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (73, 38, 3)
SET IDENTITY_INSERT [dbo].[ServiceRequestExtra] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceStatus] ON 

INSERT [dbo].[ServiceStatus] ([StatusId], [StatusName]) VALUES (1, N'New')
INSERT [dbo].[ServiceStatus] ([StatusId], [StatusName]) VALUES (2, N'Cancelled')
INSERT [dbo].[ServiceStatus] ([StatusId], [StatusName]) VALUES (3, N'Completed')
SET IDENTITY_INSERT [dbo].[ServiceStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [StateName]) VALUES (1, N'Troisdrof')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1, N'dd', N'dd', N'ee@g.com', N'dd', N'8511111782', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-01-25T12:19:49.000' AS DateTime), CAST(N'2022-01-25T12:19:50.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (2, N'ddd', N'ddd', N'eed@g.com', N'dde', N'8511121782', 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-01-25T15:01:10.000' AS DateTime), CAST(N'2022-01-25T15:01:10.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (3, N'dddd', N'dddd', N'eedd@g.com', N'dd', N'8511121782', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-03T16:24:31.000' AS DateTime), CAST(N'2022-02-03T16:24:31.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (4, N'dda', N'dda', N'eea@g.com', N'dda', N'8511111782', 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-03T16:25:12.000' AS DateTime), CAST(N'2022-02-03T16:25:12.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1005, N'Darshan', N'Tank', N'darshan@yopmail.com', N'ddd', N'8511111782', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-16T20:10:22.000' AS DateTime), CAST(N'2022-02-16T20:10:22.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1006, N'Darshan', N'Tank', N'darshan@yopmail.com', N'dd', N'8511111782', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-16T20:10:53.000' AS DateTime), CAST(N'2022-02-16T20:10:53.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1007, N'Darshan', N'Tank', N'darshan1@yopmail.com', N'dd', N'8511111782', 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-16T20:48:21.000' AS DateTime), CAST(N'2022-02-16T20:48:21.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1008, N'Darshan', N'Tank', N'darsh@yopmail.com', N'dda', N'8511111782', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-18T18:40:16.000' AS DateTime), CAST(N'2022-02-18T18:40:16.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1009, N'Darshan', N'Tank', N'darsh1@yopmail.com', N'dd', N'8511111782', 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-18T18:46:31.000' AS DateTime), CAST(N'2022-02-18T18:46:31.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1010, N'Darshan', N'Tank', N'darsh11@yopmail.com', N'dda', N'8511111782', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-21T12:07:14.000' AS DateTime), CAST(N'2022-02-21T12:07:14.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1011, N'Darshan', N'Tank', N'darsh112@yopmail.com', N'dda', N'8511111782', 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-21T12:10:12.000' AS DateTime), CAST(N'2022-02-21T12:10:12.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [RoleId], [Gender], [DateOfBirth], [WebSite], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [ResetKey], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [IsOnline], [BankTokenId], [TaxNo]) VALUES (1012, N'Kevin', N'Patel', N'kevin@yopmail.com', N'dda', N'8511111782', 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2022-02-26T15:05:27.000' AS DateTime), CAST(N'2022-02-26T15:05:27.000' AS DateTime), 0, 0, 0, 0, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAddress] ON 

INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (1, 4, N'Samta', N'Laxmipura', N'Vadodara', N'Gujarat', N'555666', 1, 1, N'8511111782', N'eea@g.com', NULL)
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (2, 4, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', 0, 0, N'8511221212', N'eea@g.com', NULL)
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (3, 4, N'samta', N'A140', N'Troisdrof', N'Troisdrof', N'555666', 0, 0, N'8511221212', N'eea@g.com', NULL)
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (4, 1009, N'Pawandham', N'A-140', N'Troisdrof', N'Troisdrof', N'320029', 0, 0, N'8511221212', N'darsh1@yopmail.com', NULL)
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (5, 1009, N'samta flat', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', 0, 0, N'8511221212', N'darsh1@yopmail.com', NULL)
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email], [Type]) VALUES (6, 1009, N'samta', N'laxmipura', N'Troisdrof', N'Troisdrof', N'555666', 0, 0, N'8511221212', N'darsh1@yopmail.com', NULL)
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
