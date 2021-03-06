USE [master]
GO
/****** Object:  Database [CIS3365]    Script Date: 4/6/2022 8:57:38 PM ******/
CREATE DATABASE [CIS3365]
 CONTAINMENT = NONE
ALTER DATABASE [CIS3365] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CIS3365].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CIS3365] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CIS3365] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CIS3365] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CIS3365] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CIS3365] SET ARITHABORT OFF 
GO
ALTER DATABASE [CIS3365] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CIS3365] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CIS3365] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CIS3365] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CIS3365] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CIS3365] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CIS3365] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CIS3365] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CIS3365] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CIS3365] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CIS3365] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CIS3365] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CIS3365] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CIS3365] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CIS3365] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CIS3365] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CIS3365] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CIS3365] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CIS3365] SET  MULTI_USER 
GO
ALTER DATABASE [CIS3365] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CIS3365] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CIS3365] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CIS3365] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CIS3365] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CIS3365] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CIS3365] SET QUERY_STORE = OFF
GO
USE [CIS3365]
GO
/****** Object:  Table [dbo].[Contact_method]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_method](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Method] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](25) NOT NULL,
	[Lname] [nvarchar](25) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phonenum] [nvarchar](10) NULL,
	[BD] [date] NULL,
	[Unique_code] [nvarchar](5) NOT NULL,
	[Address_line1] [nvarchar](75) NULL,
	[Customer_typeID] [int] NULL,
	[CountryID] [int] NULL,
	[Amount_discount_have] [int] NULL,
	[City] [nvarchar](50) NULL,
	[Zipcode] [nvarchar](10) NULL,
	[Customer_statusID] [int] NULL,
	[Promo_signup_statusID] [int] NULL,
	[Amount_discount_used] [int] NULL,
	[Registration_date] [date] NULL,
	[StateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_feedback]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[StoreID] [int] NULL,
	[Feedback] [nvarchar](100) NOT NULL,
	[Customer_feedback_statusID] [int] NOT NULL,
	[Feedback_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_feedback_status]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_feedback_status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_interaction]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_interaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Note] [nvarchar](50) NULL,
	[Customer_interaction_statusID] [int] NULL,
	[Used_discount] [int] NULL,
	[Date] [date] NULL,
	[StoreID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_interaction_status]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_interaction_status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_note]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_note](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_social]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_social](
	[Social_typeID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Link] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[Social_typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_social_type]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_social_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_status]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Comment] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_type]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](25) NOT NULL,
	[Lname] [nvarchar](25) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phonenum] [nvarchar](10) NULL,
	[BD] [date] NULL,
	[Change_discount] [bit] NOT NULL,
	[Address_line1] [nvarchar](75) NULL,
	[CountryID] [int] NULL,
	[Employee_typeID] [int] NULL,
	[City] [nvarchar](50) NULL,
	[Zipcode] [nvarchar](10) NULL,
	[Employee_statusID] [int] NULL,
	[StateID] [int] NULL,
	[Hired_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_note]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_note](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[Note] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_status]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_type]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident_list]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident_list](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Incident_typeID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Note] [nvarchar](50) NOT NULL,
	[Other_employee] [nvarchar](50) NULL,
	[CustomerID] [int] NULL,
	[Cost] [smallmoney] NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident_type]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preferred_barber]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preferred_barber](
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preferred_method]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preferred_method](
	[Contact_methodID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[Contact_methodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promo_signup_status]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promo_signup_status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [smallmoney] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Shortened_name] [nvarchar](10) NOT NULL,
	[Fullname] [nvarchar](100) NOT NULL,
	[CountryID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Store_name] [nvarchar](50) NOT NULL,
	[Address_line1] [nvarchar](75) NULL,
	[CountryID] [int] NULL,
	[City] [nvarchar](50) NULL,
	[Zipcode] [nvarchar](10) NULL,
	[Phonenum] [nvarchar](10) NULL,
	[StateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](255) NOT NULL,
	[Time_create] [datetime] NOT NULL,
	[Time_used] [datetime] NULL,
	[Token_statusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token_status]    Script Date: 4/6/2022 8:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token_status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact_method] ON 

INSERT [dbo].[Contact_method] ([ID], [Method]) VALUES (1, N'Phone call')
INSERT [dbo].[Contact_method] ([ID], [Method]) VALUES (2, N'Text')
INSERT [dbo].[Contact_method] ([ID], [Method]) VALUES (3, N'Email')
INSERT [dbo].[Contact_method] ([ID], [Method]) VALUES (4, N'Mailing')
INSERT [dbo].[Contact_method] ([ID], [Method]) VALUES (5, N'None')
INSERT [dbo].[Contact_method] ([ID], [Method]) VALUES (6, N'Physical')
SET IDENTITY_INSERT [dbo].[Contact_method] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([ID], [Name]) VALUES (1, N'Afghanistan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (2, N'Albania')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (3, N'Algeria')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (4, N'Andorra')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (5, N'Angola')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (6, N'Antigua and Barbuda')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (7, N'Argentina')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (8, N'Armenia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (9, N'Australia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (10, N'Austria')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (11, N'Azerbaijan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (12, N'Bahamas')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (13, N'Bahrain')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (14, N'Bangladesh')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (15, N'Barbados')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (16, N'Belarus')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (17, N'Belgium')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (18, N'Belize')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (19, N'Benin')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (20, N'Bhutan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (21, N'Bolivia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (22, N'Bosnia and Herzegovina')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (23, N'Botswana')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (24, N'Brazil')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (25, N'Brunei Darussalam')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (26, N'Bulgaria')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (27, N'Burkina Faso')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (28, N'Burundi')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (29, N'Cabo Verde')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (30, N'Cambodia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (31, N'Cameroon')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (32, N'Canada')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (33, N'Central African Republic')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (34, N'Chad')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (35, N'Chile')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (36, N'China')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (37, N'Colombia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (38, N'Comoros')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (39, N'Congo')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (40, N'Costa Rica')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (41, N'Côte d''Ivoire')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (42, N'Croatia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (43, N'Cuba')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (44, N'Cyprus')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (45, N'Czechia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (46, N'Democratic People''s Republic of Korea')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (47, N'Democratic Republic of the Congo')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (48, N'Denmark')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (49, N'Djibouti')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (50, N'Dominica')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (51, N'Dominican Republic')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (52, N'Ecuador')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (53, N'Egypt')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (54, N'El Salvador')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (55, N'Equatorial Guinea')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (56, N'Eritrea')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (57, N'Estonia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (58, N'Eswatini')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (59, N'Ethiopia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (60, N'Fiji')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (61, N'Finland')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (62, N'France')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (63, N'Gabon')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (64, N'Gambia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (65, N'Georgia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (66, N'Germany')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (67, N'Ghana')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (68, N'Greece')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (69, N'Grenada')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (70, N'Guatemala')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (71, N'Guinea')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (72, N'Guinea-Bissau')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (73, N'Guyana')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (74, N'Haiti')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (75, N'Honduras')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (76, N'Hungary')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (77, N'Iceland')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (78, N'India')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (79, N'Indonesia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (80, N'Iran')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (81, N'Iraq')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (82, N'Ireland')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (83, N'Israel')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (84, N'Italy')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (85, N'Jamaica')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (86, N'Japan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (87, N'Jordan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (88, N'Kazakhstan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (89, N'Kenya')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (90, N'Kiribati')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (91, N'Kuwait')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (92, N'Kyrgyzstan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (93, N'Lao People''s Democratic Republic')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (94, N'Latvia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (95, N'Lebanon')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (96, N'Lesotho')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (97, N'Liberia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (98, N'Libya')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (99, N'Liechtenstein')
GO
INSERT [dbo].[Country] ([ID], [Name]) VALUES (100, N'Lithuania')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (101, N'Luxembourg')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (102, N'Madagascar')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (103, N'Malawi')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (104, N'Malaysia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (105, N'Maldives')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (106, N'Mali')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (107, N'Malta')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (108, N'Marshall Islands')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (109, N'Mauritania')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (110, N'Mauritius')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (111, N'Mexico')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (112, N'Micronesia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (113, N'Monaco')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (114, N'Mongolia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (115, N'Montenegro')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (116, N'Morocco')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (117, N'Mozambique')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (118, N'Myanmar')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (119, N'Namibia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (120, N'Nauru')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (121, N'Nepal')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (122, N'Netherlands')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (123, N'New Zealand')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (124, N'Nicaragua')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (125, N'Niger')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (126, N'Nigeria')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (127, N'North Macedonia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (128, N'Norway')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (129, N'Oman')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (130, N'Pakistan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (131, N'Palau')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (132, N'Panama')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (133, N'Papua New Guinea')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (134, N'Paraguay')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (135, N'Peru')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (136, N'Philippines')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (137, N'Poland')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (138, N'Portugal')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (139, N'Qatar')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (140, N'Republic of Korea')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (141, N'Republic of Moldova')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (142, N'Romania')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (143, N'Russian Federation')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (144, N'Rwanda')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (145, N'Saint Kitts and Nevis')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (146, N'Saint Lucia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (147, N'Saint Vincent and the Grenadines')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (148, N'Samoa')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (149, N'San Marino')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (150, N'Sao Tome and Principe')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (151, N'Saudi Arabia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (152, N'Senegal')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (153, N'Serbia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (154, N'Seychelles')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (155, N'Sierra Leone')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (156, N'Singapore')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (157, N'Slovakia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (158, N'Slovenia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (159, N'Solomon Islands')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (160, N'Somalia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (161, N'South Africa')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (162, N'South Sudan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (163, N'Spain')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (164, N'Sri Lanka')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (165, N'Sudan (the)')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (166, N'Suriname')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (167, N'Sweden')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (168, N'Switzerland')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (169, N'Syrian Arab Republic')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (170, N'Tajikistan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (171, N'Thailand')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (172, N'Timor-Leste')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (173, N'Togo')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (174, N'Tonga')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (175, N'Trinidad and Tobago')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (176, N'Tunisia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (177, N'Turkey')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (178, N'Turkmenistan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (179, N'Tuvalu')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (180, N'Uganda')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (181, N'Ukraine')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (182, N'United Arab Emirates')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (183, N'United Kingdom of Great Britain and Northern Ireland')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (184, N'United Republic of Tanzania')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (185, N'United States of America')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (186, N'Uruguay')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (187, N'Uzbekistan')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (188, N'Vanuatu')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (189, N'Venezuela')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (190, N'Viet Nam')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (191, N'Yemen')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (192, N'Zambia')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (193, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (2, N'Tye', N'Weiss', N'yanahdi@gmail.com', N'9048912930', CAST(N'1979-12-15' AS Date), N'A4B8J', N'10099 Main St', 2, 185, 8, N'Houston', N'77089', 1, 2, 0, CAST(N'2021-04-02' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (3, N'Sam', N'Allen', N'allen.samuel@gmail.com', N'2818980799', CAST(N'1993-01-12' AS Date), N'B7JF5', N'3011 Ferndale St', 1, 185, 0, N'Houston', N'77098', 1, 1, 1, CAST(N'2021-04-03' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (4, N'Eric', N'Mendez', N'ericmendez93@yahoo.com', N'8327689388', CAST(N'2001-05-25' AS Date), N'A7HB6', N'7463 Fairview Dr', 2, 185, 1, N'Houston', N'77478', 2, 1, 0, CAST(N'2021-04-03' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (5, N'Larry', N'Ledet', N'larryledet@sbcglobal.net', N'2816303732', CAST(N'1984-07-06' AS Date), N'F8B3K', N'2688 Arnold St', 2, 185, 0, N'Houston', N'77503', 1, 1, 1, CAST(N'2021-04-03' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (6, N'Michael', N'Burgower', N'burgower3@gmail.com', N'2818418635', CAST(N'1995-03-05' AS Date), N'4Y84J', N'10165 Burgoyne Rd', 2, 185, 1, N'Houston', N'77505', 3, 2, 0, CAST(N'2021-04-03' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (7, N'Trey', N'Montez', N'Treymo2000@yahoo.com', N'8328883553', CAST(N'1991-06-07' AS Date), N'8JCY4', N'626 Old Lake Rd', 2, 185, 1, N'Houston', N'77029', 1, 1, 0, CAST(N'2021-04-03' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (8, N'Pratik', N'Patel', N'pratikpatel0720@gmail.com', N'2283138486', CAST(N'2005-08-12' AS Date), N'7SNG9', N'5768 Meadowick Dr', 2, 185, 1, N'Houston', N'77070', 1, 2, 0, CAST(N'2021-04-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (9, N'Simon', N'Cruz', N'scruz40@hotmail.com', N'8325287745', CAST(N'1999-09-05' AS Date), N'7SY4N', N'727 Duke St #2A', 2, 185, 1, N'Houston', N'77396', 1, 2, 0, CAST(N'2021-04-14' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (10, N'Matt', N'Mitchel', N'moneymitchel@icloud.com', N'7137485112', CAST(N'2008-02-21' AS Date), N'U7DC7', N'8026 Meadow Place Dr', 1, 185, 0, N'Houston', N'77065', 1, 2, 1, CAST(N'2021-04-14' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (11, N'Drew', N'Gieseke', N'drewgieseke@gmail.com', N'5732397217', CAST(N'2000-01-13' AS Date), N'V63JD', N'4635 Woodrow Way', 2, 185, 1, N'Houston', N'77006', 1, 2, 0, CAST(N'2021-04-14' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (12, N'Antonio', N'Gonzales', N'antgonzales2@gmail.com', N'7867743132', CAST(N'1998-04-13' AS Date), N'DJF5J', N'494 Gambler Lane', 2, 185, 1, N'Houston', N'77060', 1, 2, 0, CAST(N'2021-04-14' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (13, N'Roudy', N'Ferns', N'roudyferns@gmail.com', N'4806486862', CAST(N'1994-05-16' AS Date), N'4YT6F', N'4564 Bird Spring Lane', 2, 185, 1, N'Houston', N'77063', 1, 2, 0, CAST(N'2021-05-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (14, N'Charles', N'Brooks', N'charlesl.brooks@gmail.com', N'2819289848', CAST(N'1995-07-20' AS Date), N'3U892', N'656 Circle Drive', 2, 185, 1, N'Houston', N'77020', 1, 2, 0, CAST(N'2021-05-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (15, N'Lance', N'Gilliam', N'lancetheiv@gmail.com', N'7134177040', CAST(N'2000-10-13' AS Date), N'28CV6', N'3986 Patterson Street', 2, 185, 1, N'Houston', N'77002', 3, 1, 0, CAST(N'2021-05-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (16, N'Michael', N'Hertzberg', N'hertzberg@gmail.com', N'2036670578', CAST(N'1999-04-15' AS Date), N'CB4FJ', N'3300 Adams Drive #152', 2, 185, 1, N'Houston', N'77002', 1, 2, 0, CAST(N'2021-05-11' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (17, N'Chase', N'Robinson', N'chase.robinson18@gmail.com', N'4097610380', CAST(N'1995-07-03' AS Date), N'CU8N8', N'1604 Walker St', 2, 185, 1, N'Houston', N'77010', 2, 2, 0, CAST(N'2021-05-11' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (18, N'Hector', N'Castillo', N'hector.c88@gmail.com', N'7135754965', CAST(N'1994-03-07' AS Date), N'FU83V', N'4375 Wines Lane', 2, 185, 1, N'Houston', N'77099', 2, 2, 0, CAST(N'2021-05-11' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (19, N'David', N'Saucedo', N'david.saucedo7@gmail.com', N'2818274091', CAST(N'1992-06-09' AS Date), N'X639H', N'10541 Farm-to-Market 1960 Rd W', 2, 185, 1, N'Houston', N'77070', 1, 2, 0, CAST(N'2021-05-11' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (20, N'Jason', N'Manlobe', N'manlobe4822@gmail.com', N'7134809808', CAST(N'2010-02-02' AS Date), N'Z8J4F', N'8300 Burnet Rd', 2, 185, 1, N'Houston', N'78758', 1, 2, 0, CAST(N'2021-05-11' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (21, N'Jason', N'Jesko', N'jason@theurbanforesters.com', N'8327769066', CAST(N'2000-05-06' AS Date), N'DJ93C', N'6646 Addicks Satsuma Rd', 2, 185, 1, N'Houston', N'77084', 1, 1, 0, CAST(N'2021-05-27' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (22, N'Sean', N'Forbes', N'sforbes@nhblaw.com', N'8326462140', CAST(N'1993-08-06' AS Date), N'RT87V', N'5727 Westheimer Rd', 2, 185, 1, N'Houston', N'77057', 1, 2, 0, CAST(N'2021-05-27' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (23, N'Gary', N'Guion', N'gguion5200@gmail.com', N'8177579600', CAST(N'2003-09-08' AS Date), N'B8Z6F', N'14054 Memorial Dr', 1, 185, 0, N'Houston', N'77079', 1, 2, 1, CAST(N'2021-06-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (24, N'Timothy', N'Pham', N'timpham@me.com', N'7133844240', CAST(N'2004-11-28' AS Date), N'Z9KFJ', N'10101 Hammerly Blvd', 2, 185, 1, N'Houston', N'77080', 1, 2, 0, CAST(N'2021-06-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (25, N'Daniel', N'Hayes', N'hayes004@gmail.com', N'8326895767', CAST(N'1995-12-10' AS Date), N'OP97F', N'16255 S Post Oak Rd', 2, 185, 1, N'Houston', N'77053', 2, 1, 0, CAST(N'2021-06-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (26, N'Brett', N'Loewenstein', N'brettloewenstein@gmail.com', N'7134747212', CAST(N'1977-10-25' AS Date), N'67V89', N'1401 Woodlands Pkwy', 2, 185, 1, N'Houston', N'77380', 1, 2, 0, CAST(N'2021-06-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (27, N'matt', N'marcus', N'chefmattmarcus@gmail.com', N'8454308479', CAST(N'1970-05-23' AS Date), N'23V7F', N'807 W Gray St #2251', 2, 185, 1, N'Houston', N'77019', 1, 1, 0, CAST(N'2021-06-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (28, N'Jim', N'Zimmerman', N'j.zimmerman6@gmail.com', N'3177502544', CAST(N'2001-06-07' AS Date), N'B8X8F', N'8500 S Main St', 2, 185, 1, N'Houston', N'77025', 1, 2, 0, CAST(N'2021-06-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (29, N'Mono', N'Gutierrez', N'gutierrez88gonzalez@gmail.com', N'3853137046', CAST(N'1993-04-10' AS Date), N'AS84F', N'1201 Lake Woodlands Dr', 1, 185, 1, N'Houston', N'77380', 1, 2, 0, CAST(N'2021-08-02' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (30, N'Tal', N'Gribbins', N'talgribbins@gmail.com', N'7135624139', CAST(N'1966-12-27' AS Date), N'0UFVF', N'2424 Rogerdale Rd', 1, 185, 0, N'Houston', N'77042', 1, 1, 1, CAST(N'2021-08-02' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (31, N'Austin', N'Reed', N'ausreed@yahoo.com', N'5128848142', CAST(N'1980-09-13' AS Date), N'7EF3C', N'24 Waterway Ave #125', 2, 185, 1, N'Houston', N'77380', 2, 2, 0, CAST(N'2021-08-02' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (32, N'Kevin', N'Colbert', N'kevinlcolbert2@gmail.com', N'7132066426', CAST(N'1972-07-06' AS Date), N'B8DF4', N'3107 Ravens Lake Cir', 2, 185, 1, N'Houston', N'77573', 1, 2, 0, CAST(N'2021-08-22' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (33, N'Javier', N'Rodriguez', N'jrrodz1986@gmail.com', N'7138203893', CAST(N'1982-01-17' AS Date), N'F8YC7', N'10250 Hwy 6', 2, 185, 1, N'Houston', N'77459', 1, 2, 0, CAST(N'2021-08-22' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (34, N'Chad', N'Henley', N'kauseway@gmail.com', N'7133023959', CAST(N'1992-03-20' AS Date), N'HU873', N'7850 Easthaven Blvd', 2, 185, 1, N'Houston', N'77017', 1, 2, 0, CAST(N'2021-09-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (35, N'Alexis', N'Crespo', N'alexiscrespo@yahoo.com', N'3054097167', CAST(N'2006-06-20' AS Date), N'GH7D7', N'10701 Corporate Dr', 2, 185, 1, N'Houston', N'77477', 1, 2, 0, CAST(N'2021-09-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (36, N'John', N'Nagorski', N'nagorski.john@gmail.com', N'2105054739', CAST(N'2002-07-21' AS Date), N'87CX8', N'4701 Washington Ave', 2, 185, 1, N'Houston', N'77007', 1, 2, 0, CAST(N'2021-09-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (37, N'Sherman', N'Modeste', N'shermanmodeste@gmail.com', N'4049314930', CAST(N'2005-04-20' AS Date), N'YU99X', N'6915 Cypresswood Dr', 2, 185, 1, N'Houston', N'77379', 1, 2, 0, CAST(N'2021-09-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (38, N'Aiden', N'Tanbon', N'aidentan72@gmail.com', N'8065435227', CAST(N'2000-08-21' AS Date), N'12HUB', N'16535 Southwest Fwy', 2, 185, 1, N'Houston', N'77479', 1, 2, 0, CAST(N'2021-09-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (39, N'Anthony', N'Pugh', N'anthony.pugh1@gmail.com', N'2485140653', CAST(N'2001-10-12' AS Date), N'VU89D', N'5525 Weslayan St', 2, 185, 1, N'Houston', N'77005', 1, 2, 0, CAST(N'2021-10-13' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (40, N'Max', N'Dweck', N'maxrdweck@gmail.com', N'2023215252', CAST(N'1978-12-20' AS Date), N'IO89D', N'1115 E 11th St', 2, 185, 1, N'Houston', N'77009', 1, 2, 0, CAST(N'2021-10-13' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (41, N'Joshua', N'Josekutty', N'js_jsh@yahoo.com', N'8325945671', CAST(N'2000-11-22' AS Date), N'PO8D6', N'1040 N Shepherd Dr', 2, 185, 0, N'Houston', N'77008', 1, 2, 1, CAST(N'2021-10-13' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (42, N'John', N'Rodriguez', N'johnathonrdz@gmail.com', N'8329730737', CAST(N'2009-01-11' AS Date), N'XC87F', N'4148 Chapel Street', 2, 185, 1, N'Houston', N'77450', 1, 2, 0, CAST(N'2021-11-08' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (43, N'William', N'Arning', N'bill.arning@gmail.com', N'6173599643', CAST(N'1992-02-20' AS Date), N'FG87D', N'1738 Candlelight Drive', 2, 185, 1, N'Houston', N'77493', 2, 2, 0, CAST(N'2021-12-26' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (44, N'Christopher', N'Valero', N'golfnerd95@gmail.com', N'5126733623', CAST(N'1997-10-20' AS Date), N'54HF8', N'208 Travis St', 2, 185, 1, N'Houston', N'77002', 1, 2, 0, CAST(N'2021-12-26' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (45, N'Bill', N'Bettingen', N'william.bettingen@gmail.com', N'9499339939', CAST(N'2005-04-20' AS Date), N'25TF1', N'4725 Telephone Rd', 2, 185, 1, N'Houston', N'77087', 1, 2, 0, CAST(N'2021-12-26' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (46, N'Jeffrey', N'Lange', N'jeff.w.lange@gmail.com', N'2039063154', CAST(N'2004-07-12' AS Date), N'26HB8', N'4101 Greenbriar Dr #315', 2, 185, 1, N'Houston', N'77098', 1, 2, 0, CAST(N'2021-12-26' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (47, N'Noel', N'Pullokaran', N'noel.pullokaran@yahoo.com', N'8323681067', CAST(N'2001-03-15' AS Date), N'LA30F', N'4646 Riverstone Blvd', 2, 185, 1, N'Houston', N'77459', 1, 2, 0, CAST(N'2021-12-26' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (48, N'Hugo', N'Teste', N'hugoteste@hotmail.com', N'2812174138', CAST(N'1991-08-20' AS Date), N'VB489', N'4059 Westheimer Rd #320', 2, 185, 1, N'Houston', N'77027', 1, 2, 0, CAST(N'2022-01-05' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (49, N'Casey', N'Miller', N'casemiller4@gmail.com', N'2816603047', CAST(N'2006-06-07' AS Date), N'F3X69', N'7350 Harwin Dr', 2, 185, 1, N'Houston', N'77036', 1, 2, 0, CAST(N'2022-02-25' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (50, N'Thomas', N'Cooke', N'thomascooke2002@yahoo.com', N'2026796802', CAST(N'2002-02-10' AS Date), N'UI72D', N'680 West Sam Houston Pkwy N #1820', 2, 185, 1, N'Houston', N'77042', 1, 2, 0, CAST(N'2022-04-01' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (55, N'Dan', N'ApiTesttoken', N'thisthingsuck@gmail.com', NULL, CAST(N'2001-03-12' AS Date), N'FWZSN', N'444333 new road', NULL, NULL, 0, NULL, NULL, 1, 2, 0, CAST(N'2022-04-02' AS Date), 95)
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Unique_code], [Address_line1], [Customer_typeID], [CountryID], [Amount_discount_have], [City], [Zipcode], [Customer_statusID], [Promo_signup_statusID], [Amount_discount_used], [Registration_date], [StateID]) VALUES (56, N'admin add f', N'admin add l', N'email@email.com', N'8323334444', CAST(N'2000-01-01' AS Date), N'XYZ12', N'123 main st', 1, 185, 5, N'houston', N'77075', 1, 2, 0, CAST(N'2022-05-05' AS Date), 95)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_feedback] ON 

INSERT [dbo].[Customer_feedback] ([ID], [CustomerID], [StoreID], [Feedback], [Customer_feedback_statusID], [Feedback_date]) VALUES (1, 2, 1, N'Took too long', 5, CAST(N'2021-05-10' AS Date))
INSERT [dbo].[Customer_feedback] ([ID], [CustomerID], [StoreID], [Feedback], [Customer_feedback_statusID], [Feedback_date]) VALUES (2, 3, 2, N'Strange smell', 5, CAST(N'2021-07-12' AS Date))
INSERT [dbo].[Customer_feedback] ([ID], [CustomerID], [StoreID], [Feedback], [Customer_feedback_statusID], [Feedback_date]) VALUES (3, 2, 2, N'Very clean', 5, CAST(N'2021-11-19' AS Date))
INSERT [dbo].[Customer_feedback] ([ID], [CustomerID], [StoreID], [Feedback], [Customer_feedback_statusID], [Feedback_date]) VALUES (4, 4, 2, N'Like the atmosphere', 4, CAST(N'2022-01-02' AS Date))
INSERT [dbo].[Customer_feedback] ([ID], [CustomerID], [StoreID], [Feedback], [Customer_feedback_statusID], [Feedback_date]) VALUES (5, 12, 2, N'Rude employee', 3, CAST(N'2022-02-10' AS Date))
INSERT [dbo].[Customer_feedback] ([ID], [CustomerID], [StoreID], [Feedback], [Customer_feedback_statusID], [Feedback_date]) VALUES (6, 4, 1, N'My barber was so friendly', 2, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Customer_feedback] ([ID], [CustomerID], [StoreID], [Feedback], [Customer_feedback_statusID], [Feedback_date]) VALUES (7, 12, 1, N'That same employee looked at me funny, they should be fired', 1, CAST(N'2022-04-02' AS Date))
SET IDENTITY_INSERT [dbo].[Customer_feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_feedback_status] ON 

INSERT [dbo].[Customer_feedback_status] ([ID], [Status]) VALUES (1, N'Reviewing')
INSERT [dbo].[Customer_feedback_status] ([ID], [Status]) VALUES (2, N'Reviewed')
INSERT [dbo].[Customer_feedback_status] ([ID], [Status]) VALUES (3, N'Checked')
INSERT [dbo].[Customer_feedback_status] ([ID], [Status]) VALUES (4, N'Received')
INSERT [dbo].[Customer_feedback_status] ([ID], [Status]) VALUES (5, N'Finished')
SET IDENTITY_INSERT [dbo].[Customer_feedback_status] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_interaction] ON 

INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (1, 1, 3, N'Will come late', 2, 1, CAST(N'2022-04-02' AS Date), 1)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (2, 5, 5, N'Will come early', 1, 0, CAST(N'2022-04-02' AS Date), 2)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (3, 6, 5, NULL, 3, 1, CAST(N'2022-04-02' AS Date), 1)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (4, 8, 10, NULL, 1, 1, CAST(N'2022-04-02' AS Date), 2)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (5, 8, 11, NULL, 1, 0, CAST(N'2022-04-02' AS Date), 3)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (6, 8, 10, NULL, 3, 0, CAST(N'2022-04-02' AS Date), 2)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (7, 5, 23, NULL, 1, 1, CAST(N'2022-04-02' AS Date), 3)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (8, 8, 25, NULL, 2, 0, CAST(N'2022-04-02' AS Date), 2)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (9, 3, 30, NULL, 1, 1, CAST(N'2022-04-02' AS Date), 3)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (10, 7, 36, NULL, 3, 0, CAST(N'2022-04-02' AS Date), 3)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (11, 1, 41, NULL, 1, 1, CAST(N'2022-04-02' AS Date), 3)
INSERT [dbo].[Customer_interaction] ([ID], [ServiceID], [CustomerID], [Note], [Customer_interaction_statusID], [Used_discount], [Date], [StoreID]) VALUES (12, 1, 47, NULL, 1, 0, CAST(N'2022-04-02' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Customer_interaction] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_interaction_status] ON 

INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (1, N'Scheduled')
INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (2, N'Cancelled')
INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (3, N'Finished')
INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (4, N'Completed')
INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (5, N'Denied')
INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (6, N'Pending')
INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (7, N'On hold')
INSERT [dbo].[Customer_interaction_status] ([ID], [Name]) VALUES (8, N'Cleared')
SET IDENTITY_INSERT [dbo].[Customer_interaction_status] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_note] ON 

INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (1, N'Love to get buzzcut', 3)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (2, N'Prefer Alejandro for cut', 6)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (3, N'Prefer to talk a lot', 8)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (4, N'Like to ask a lot of questions', 15)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (5, N'Love to talk about gaming', 23)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (6, N'Falls asleep during cut sometimes', 26)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (7, N'Prefer combover style with fade', 7)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (8, N'Asks for shampoo after haircut', 9)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (9, N'Likes to use pomade after haircut', 20)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (10, N'Medium fade style and thin out the top', 13)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (11, N'Haircut and beard trim', 18)
INSERT [dbo].[Customer_note] ([ID], [Note], [CustomerID]) VALUES (12, N'Haircut and fullshave', 12)
SET IDENTITY_INSERT [dbo].[Customer_note] OFF
GO
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (1, 2, N'facebook.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (2, 2, N'twitter.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 2, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (1, 4, N'facebook.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (2, 6, N'twitter.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (1, 11, N'facebook.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 11, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (2, 13, N'twitter.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (1, 18, N'facebook.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (2, 18, N'twitter.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 18, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 23, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (1, 24, N'facebook.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (2, 28, N'twitter.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 28, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 30, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (1, 31, N'facebook.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 39, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (3, 41, N'instagram.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (1, 46, N'facebook.com/')
INSERT [dbo].[Customer_social] ([Social_typeID], [CustomerID], [Link]) VALUES (2, 46, N'twitter.com/')
GO
SET IDENTITY_INSERT [dbo].[Customer_social_type] ON 

INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (1, N'Facebook')
INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (2, N'Twitter')
INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (3, N'Instagram')
INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (4, N'Snapchat')
INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (5, N'Discord')
INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (6, N'Other')
INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (7, N'LinkedIn')
INSERT [dbo].[Customer_social_type] ([ID], [Type]) VALUES (8, N'Linktree')
SET IDENTITY_INSERT [dbo].[Customer_social_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_status] ON 

INSERT [dbo].[Customer_status] ([ID], [Name], [Comment]) VALUES (1, N'Active', NULL)
INSERT [dbo].[Customer_status] ([ID], [Name], [Comment]) VALUES (2, N'Inactive', NULL)
INSERT [dbo].[Customer_status] ([ID], [Name], [Comment]) VALUES (3, N'Blacklisted', NULL)
SET IDENTITY_INSERT [dbo].[Customer_status] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_type] ON 

INSERT [dbo].[Customer_type] ([ID], [Name]) VALUES (1, N'New')
INSERT [dbo].[Customer_type] ([ID], [Name]) VALUES (2, N'Current')
SET IDENTITY_INSERT [dbo].[Customer_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (1, N'Aidan', N'Davies', N'aidanrhysdavies@gmail.com', N'2817971385', CAST(N'1979-12-15' AS Date), 0, N'217 Aldine Bender Rd', 185, 3, N'Houston', N'77060', 1, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (2, N'Dave', N'Shah', N'davekshah@gmail.com', N'2816864322', CAST(N'1993-01-12' AS Date), 0, N'1921 County Road 129', 185, 1, N'Houston', N'77581', 2, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (3, N'Grant', N'McCracken', N'starguygrant@mac.com', N'5094968328', CAST(N'1999-05-24' AS Date), 0, N'6728 Weslayan St', 185, 2, N'Houston', N'77005', 1, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (4, N'Keilan', N'Eggleston', N'keilan.eggleston@gmail.com', N'8327993396', CAST(N'1984-07-06' AS Date), 0, N'4650 Bissonnet St', 185, 1, N'Houston', N'77401', 1, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (5, N'Gaurav', N'Nayak', N'ga.ravnayak@gmail.com', N'7135305163', CAST(N'1995-03-05' AS Date), 0, N'5339 Weslayan St', 185, 1, N'Houston', N'77005', 2, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (6, N'Jason', N'Millsap', N'jmillsap42@yahoo.com', N'7138755428', CAST(N'1991-06-07' AS Date), 0, N'1248 Witte Rd', 185, 2, N'Houston', N'77055', 1, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (7, N'Robert', N'Cote', N'robert_cote-2015@outlook.com', N'2816208843', CAST(N'1994-02-23' AS Date), 0, N'12010 Jones Rd', 185, 1, N'Houston', N'77070', 1, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (8, N'Charles', N'Young', N'542charlieyoung@gmail.com', N'6305424151', CAST(N'1999-09-05' AS Date), 0, N'13115 Northwest Fwy', 185, 2, N'Houston', N'77040', 4, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (9, N'Stephen', N'Shepherd', N'shep1487@gmail.com', N'8323166668', CAST(N'1992-10-13' AS Date), 0, N'110 Vintage Park Blvd #270', 185, 1, N'Houston', N'77070', 1, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (10, N'Brandy', N'Chu', N'cutthroatmontrose@gmail.com', N'2026719543', CAST(N'1988-05-25' AS Date), 1, N'4508 Graustark St #127', 185, 1, N'Houston', N'77006', 1, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (11, N'Brandon', N'Davis', N'cutthroatwashington@gmail.com', N'6237643097', CAST(N'1987-07-14' AS Date), 1, N'4915 Fm 2920 Rd Ste.150', 185, 1, N'Houston', N'77388', 3, 95, CAST(N'2015-01-01' AS Date))
INSERT [dbo].[Employee] ([ID], [Fname], [Lname], [Email], [Phonenum], [BD], [Change_discount], [Address_line1], [CountryID], [Employee_typeID], [City], [Zipcode], [Employee_statusID], [StateID], [Hired_date]) VALUES (12, N'Alejandro', N'Lopez', N'cutthroatmontrose@gmail.com', N'5129544814', CAST(N'1990-01-16' AS Date), 1, N'1320 Montrose Blvd #226', 185, 1, N'Houston', N'77019', 1, 95, CAST(N'2015-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_note] ON 

INSERT [dbo].[Employee_note] ([ID], [EmployeeID], [Note]) VALUES (1, 1, N'Likes to work on the weekend')
INSERT [dbo].[Employee_note] ([ID], [EmployeeID], [Note]) VALUES (2, 2, N'Calls off often')
INSERT [dbo].[Employee_note] ([ID], [EmployeeID], [Note]) VALUES (3, 3, N'Comes in late regularly')
INSERT [dbo].[Employee_note] ([ID], [EmployeeID], [Note]) VALUES (4, 7, N'Takes really long break')
INSERT [dbo].[Employee_note] ([ID], [EmployeeID], [Note]) VALUES (5, 5, N'Doesn''t clean up after themselves')
SET IDENTITY_INSERT [dbo].[Employee_note] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_status] ON 

INSERT [dbo].[Employee_status] ([ID], [Name]) VALUES (1, N'Working')
INSERT [dbo].[Employee_status] ([ID], [Name]) VALUES (2, N'Fired')
INSERT [dbo].[Employee_status] ([ID], [Name]) VALUES (3, N'Vacation')
INSERT [dbo].[Employee_status] ([ID], [Name]) VALUES (4, N'PTO')
INSERT [dbo].[Employee_status] ([ID], [Name]) VALUES (5, N'Quit')
INSERT [dbo].[Employee_status] ([ID], [Name]) VALUES (6, N'Off')
INSERT [dbo].[Employee_status] ([ID], [Name]) VALUES (7, N'Pending hire')
SET IDENTITY_INSERT [dbo].[Employee_status] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_type] ON 

INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (1, N'Full-time')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (2, N'Part-time')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (3, N'Contract')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (5, N'Seasonal')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (6, N'Leased')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (7, N'Temporary')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (8, N'Full-time Exempt')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (9, N'Full-time Non-Exempt')
INSERT [dbo].[Employee_type] ([ID], [Name]) VALUES (10, N'Limited Part-time')
SET IDENTITY_INSERT [dbo].[Employee_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Incident_list] ON 

INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (1, 2, 1, N'Had a big arguement with another employee', N'5', NULL, NULL, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (2, 1, 4, N'Cut customer, asked for compensation', NULL, 4, 50.0000, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (3, 1, 4, N'Cut customer wrong style, asked for compensation', NULL, 25, 15.0000, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (4, 1, 3, N'Almost had a fight with another customer', NULL, 32, NULL, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (5, 3, 4, N'Tripped and made a mess', NULL, NULL, NULL, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (6, 1, 6, N'Customer complained about employee cutspeed', NULL, NULL, NULL, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (7, 1, 2, N'Cancelled an appointment by accident', NULL, 15, NULL, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (11, 1, 5, N'Late for scheduled cut, asked for compensation', NULL, 22, 5.0000, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (12, 1, 6, N'Punched a customer', NULL, 28, 500.0000, CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Incident_list] ([ID], [Incident_typeID], [EmployeeID], [Note], [Other_employee], [CustomerID], [Cost], [Date]) VALUES (13, 1, 7, N'Huge arguement with customer, asked for refund', NULL, 31, 45.0000, CAST(N'2022-04-02' AS Date))
SET IDENTITY_INSERT [dbo].[Incident_list] OFF
GO
SET IDENTITY_INSERT [dbo].[Incident_type] ON 

INSERT [dbo].[Incident_type] ([ID], [Name]) VALUES (1, N'Customer')
INSERT [dbo].[Incident_type] ([ID], [Name]) VALUES (2, N'Employee')
INSERT [dbo].[Incident_type] ([ID], [Name]) VALUES (3, N'Other')
INSERT [dbo].[Incident_type] ([ID], [Name]) VALUES (4, N'In-house')
SET IDENTITY_INSERT [dbo].[Incident_type] OFF
GO
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (2, 2)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (3, 4)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (4, 5)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (5, 6)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (6, 6)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (8, 5)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (9, 8)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (12, 5)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (15, 7)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (16, 5)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (18, 8)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (21, 7)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (24, 5)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (27, 7)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (33, 5)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (41, 10)
INSERT [dbo].[Preferred_barber] ([CustomerID], [EmployeeID]) VALUES (42, 4)
GO
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 2)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 3)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 4)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 5)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 6)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (1, 7)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (1, 9)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (1, 10)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 10)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (3, 10)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (3, 15)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 25)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (1, 30)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 30)
INSERT [dbo].[Preferred_method] ([Contact_methodID], [CustomerID]) VALUES (2, 33)
GO
SET IDENTITY_INSERT [dbo].[Promo_signup_status] ON 

INSERT [dbo].[Promo_signup_status] ([ID], [Name]) VALUES (1, N'Yes')
INSERT [dbo].[Promo_signup_status] ([ID], [Name]) VALUES (2, N'No')
INSERT [dbo].[Promo_signup_status] ([ID], [Name]) VALUES (3, N'Ask later')
SET IDENTITY_INSERT [dbo].[Promo_signup_status] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (1, N'Haircut service includes any type of fades or scissor work.', N'Haircut', 37.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (2, N'Buzz cut includes one guard all around. NO FADING.', N'Buzzcut', 25.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (3, N'Straight razor shave of head.', N'Head shave', 32.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (4, N'Straight razor shave under neck and around beard line. Includes hot towel service.', N'Partial Shave', 32.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (5, N'No Desc', N'Haircut + Full Shave', 72.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (6, N'No Desc', N'Haircut + Partial Shave', 72.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (7, N'No Desc', N'Shampoo', 5.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (8, N'Beard trim service includes using clippers or shears to trim or shape facial hair. Includes straight razor over cheeks only.', N'Beard trim', 25.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (9, N'Full Shave service includes using pre-shave oils and hot towels to prepare the skin for an old school straight razor shave.', N'Full Shave', 42.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (10, N'No Desc', N'Haircut + Beard Trim', 52.0000)
INSERT [dbo].[Service] ([ID], [Description], [Name], [Price]) VALUES (11, N'No Desc', N'Buzzcut + Beard Trim', 37.0000)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AA', N'Armed Forces of the Americas', 185, 1)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AB', N'Alberta', 32, 2)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AE', N'Armed Forces of Europe', 185, 3)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AK', N'Alaska', 185, 4)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AL', N'Alabama', 185, 5)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AP', N'Armed Forces of the Pacific', 185, 6)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AR', N'Arkansas', 185, 7)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AS', N'American Samoa', 185, 8)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'AZ', N'Arizona', 185, 9)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'BC', N'British Columbia', 32, 10)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'CA', N'California', 185, 11)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'CO', N'Colorado', 185, 12)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'CT', N'Connecticut', 185, 13)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'DC', N'Washington, DC', 185, 14)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'DE', N'Delaware', 185, 15)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'FL', N'Florida', 185, 16)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'GA', N'Georgia', 185, 17)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'GU', N'Guam', 185, 18)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'HI', N'Hawaii', 185, 19)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'IA', N'Iowa', 185, 20)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'ID', N'Idaho', 185, 21)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'IL', N'Illinois', 185, 22)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'IN', N'Indiana', 185, 23)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'KS', N'Kansas', 185, 24)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'KY', N'Kentucky', 185, 25)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'LA', N'Louisiana', 185, 26)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MA', N'Massachusetts', 185, 27)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MB', N'Manitoba', 32, 28)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MD', N'Maryland', 185, 29)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'ME', N'Maine', 185, 30)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MI', N'Michigan', 185, 31)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MN', N'Minnesota', 185, 32)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MO', N'Missouri', 185, 33)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MP', N'Northern Mariana Islands', 185, 34)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MS', N'Mississippi', 185, 35)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MT', N'Montana', 185, 36)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-AG', N'Aguascalientes', 111, 37)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-BN', N'Baja California', 111, 38)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-BS', N'Baja California Sur', 111, 39)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-CA', N'Coahuila', 111, 40)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-CH', N'Chihuahua', 111, 41)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-CL', N'Colima', 111, 42)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-CM', N'Campeche', 111, 43)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-CP', N'Chiapas', 111, 44)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-DF', N'Federal District', 111, 45)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-DU', N'Durango', 111, 46)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-GR', N'Guerrero', 111, 47)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-GT', N'Guanajuato', 111, 48)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-HI', N'Hidalgo', 111, 49)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-JA', N'Jalisco', 111, 50)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-MC', N'Michoacán', 111, 51)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-MR', N'Morelos', 111, 52)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-MX', N'Mexico State', 111, 53)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-NA', N'Nayarit', 111, 54)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-NL', N'Nuevo León', 111, 55)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-OA', N'Oaxaca', 111, 56)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-PU', N'Puebla', 111, 57)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-QE', N'Querétaro', 111, 58)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-QR', N'Quintana Roo', 111, 59)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-SI', N'Sinaloa', 111, 60)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-SL', N'San Luis Potosí', 111, 61)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-SO', N'Sonora', 111, 62)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-TB', N'Tabasco', 111, 63)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-TL', N'Tlaxcala', 111, 64)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-TM', N'Tamaulipas', 111, 65)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-VE', N'Veracruz', 111, 66)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-YU', N'Yucatán', 111, 67)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'MX-ZA', N'Zacatecas', 111, 68)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NB', N'New Brunswick', 32, 69)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NC', N'North Carolina', 185, 70)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'ND', N'North Dakota', 185, 71)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NE', N'Nebraska', 185, 72)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NH', N'New Hampshire', 185, 73)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NJ', N'New Jersey', 185, 74)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NL', N'Newfoundland and Labrador ', 32, 75)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NM', N'New Mexico', 185, 76)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NS', N'Nova Scotia', 32, 77)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NT', N'Northwest Territories', 32, 78)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NU', N'Nunavut', 32, 79)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NV', N'Nevada', 185, 80)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'NY', N'New York', 185, 81)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'OH', N'Ohio', 185, 82)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'OK', N'Oklahoma', 185, 83)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'ON', N'Ontario', 32, 84)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'OR', N'Oregon', 185, 85)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'PA', N'Pennsylvania', 185, 86)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'PE', N'Prince Edward Island', 32, 87)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'PR', N'Puerto Rico', 185, 88)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'QC', N'Quebec', 32, 89)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'RI', N'Rhode Island', 185, 90)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'SC', N'South Carolina', 185, 91)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'SD', N'South Dakota', 185, 92)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'SK', N'Saskatchewan', 32, 93)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'TN', N'Tennessee', 185, 94)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'TX', N'Texas', 185, 95)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'UT', N'Utah', 185, 96)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'VA', N'Virginia', 185, 97)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'VI', N'US Virgin Islands', 185, 98)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'VT', N'Vermont', 185, 99)
GO
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'WA', N'Washington', 185, 100)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'WI', N'Wisconsin', 185, 101)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'WV', N'West Virginia', 185, 102)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'WY', N'Wyoming', 185, 103)
INSERT [dbo].[State] ([Shortened_name], [Fullname], [CountryID], [ID]) VALUES (N'YT', N'Yukon', 32, 104)
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([ID], [Store_name], [Address_line1], [CountryID], [City], [Zipcode], [Phonenum], [StateID]) VALUES (1, N'Heights', N'244 W 19th St', 185, N'Houston', N'77008', N'7134465163', 95)
INSERT [dbo].[Store] ([ID], [Store_name], [Address_line1], [CountryID], [City], [Zipcode], [Phonenum], [StateID]) VALUES (2, N'Washington', N'2203 Washington Ave', 185, N'Houston', N'77007', N'7138647000', 95)
INSERT [dbo].[Store] ([ID], [Store_name], [Address_line1], [CountryID], [City], [Zipcode], [Phonenum], [StateID]) VALUES (3, N'Montrose', N'1508 Westheimer Rd', 185, N'Houston', N'77006', N'7133060963', 95)
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[Token] ON 

INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (1, N'A123JA123N', CAST(N'2022-03-03T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (2, N'A1KHASD738', CAST(N'2022-03-05T00:00:00.000' AS DateTime), CAST(N'2022-03-30T10:12:12.947' AS DateTime), 3)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (3, N'A123JA123N', CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (4, N'32QQ2B8T95', CAST(N'2022-03-31T14:53:28.933' AS DateTime), NULL, 1)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (5, N'2I9TAARP48', CAST(N'2022-03-31T15:02:14.110' AS DateTime), NULL, 1)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (6, N'6J16MLVDBN', CAST(N'2022-03-31T15:07:41.347' AS DateTime), CAST(N'2022-03-31T15:12:12.947' AS DateTime), 3)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (7, N'ITX6HJVC5N', CAST(N'2022-03-31T15:28:22.360' AS DateTime), CAST(N'2022-03-31T18:52:40.190' AS DateTime), 3)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (8, N'YH37N94IUE', CAST(N'2022-03-31T18:00:24.190' AS DateTime), NULL, 1)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (9, N'89A83JQ6R9', CAST(N'2022-03-31T18:01:18.300' AS DateTime), CAST(N'2022-03-31T18:01:18.307' AS DateTime), 3)
INSERT [dbo].[Token] ([ID], [Token], [Time_create], [Time_used], [Token_statusID]) VALUES (10, N'047R7U9SNF', CAST(N'2022-04-02T09:30:24.670' AS DateTime), CAST(N'2022-04-02T09:33:24.293' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Token] OFF
GO
SET IDENTITY_INSERT [dbo].[Token_status] ON 

INSERT [dbo].[Token_status] ([ID], [Name]) VALUES (1, N'Active')
INSERT [dbo].[Token_status] ([ID], [Name]) VALUES (2, N'Expired')
INSERT [dbo].[Token_status] ([ID], [Name]) VALUES (3, N'Used')
SET IDENTITY_INSERT [dbo].[Token_status] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__1FA4E363BEB68DDC]    Script Date: 4/6/2022 8:57:39 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Unique_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__1FA4E363E3E083B6]    Script Date: 4/6/2022 8:57:39 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Unique_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ('1') FOR [Customer_statusID]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ('2') FOR [Promo_signup_statusID]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [Amount_discount_used]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [Registration_date]
GO
ALTER TABLE [dbo].[Customer_feedback] ADD  DEFAULT ((4)) FOR [Customer_feedback_statusID]
GO
ALTER TABLE [dbo].[Customer_feedback] ADD  DEFAULT (getdate()) FOR [Feedback_date]
GO
ALTER TABLE [dbo].[Customer_interaction] ADD  DEFAULT ('1') FOR [Customer_interaction_statusID]
GO
ALTER TABLE [dbo].[Customer_interaction] ADD  DEFAULT ((0)) FOR [Used_discount]
GO
ALTER TABLE [dbo].[Customer_interaction] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ('1') FOR [Employee_statusID]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [Hired_date]
GO
ALTER TABLE [dbo].[Incident_list] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Token] ADD  DEFAULT ('1') FOR [Token_statusID]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([Customer_statusID])
REFERENCES [dbo].[Customer_status] ([ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([Customer_typeID])
REFERENCES [dbo].[Customer_type] ([ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([Promo_signup_statusID])
REFERENCES [dbo].[Promo_signup_status] ([ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([ID])
GO
ALTER TABLE [dbo].[Customer_feedback]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Customer_feedback]  WITH CHECK ADD FOREIGN KEY([Customer_feedback_statusID])
REFERENCES [dbo].[Customer_feedback_status] ([ID])
GO
ALTER TABLE [dbo].[Customer_feedback]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Customer_interaction]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Customer_interaction]  WITH CHECK ADD FOREIGN KEY([Customer_interaction_statusID])
REFERENCES [dbo].[Customer_interaction_status] ([ID])
GO
ALTER TABLE [dbo].[Customer_interaction]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Customer_interaction]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Customer_note]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Customer_social]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Customer_social]  WITH CHECK ADD FOREIGN KEY([Social_typeID])
REFERENCES [dbo].[Customer_social_type] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Employee_typeID])
REFERENCES [dbo].[Employee_type] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Employee_statusID])
REFERENCES [dbo].[Employee_status] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([ID])
GO
ALTER TABLE [dbo].[Employee_note]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Incident_list]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Incident_list]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Incident_list]  WITH CHECK ADD FOREIGN KEY([Incident_typeID])
REFERENCES [dbo].[Incident_type] ([ID])
GO
ALTER TABLE [dbo].[Preferred_barber]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Preferred_barber]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Preferred_method]  WITH CHECK ADD FOREIGN KEY([Contact_methodID])
REFERENCES [dbo].[Contact_method] ([ID])
GO
ALTER TABLE [dbo].[Preferred_method]  WITH CHECK ADD FOREIGN KEY([Contact_methodID])
REFERENCES [dbo].[Contact_method] ([ID])
GO
ALTER TABLE [dbo].[Preferred_method]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([ID])
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([Token_statusID])
REFERENCES [dbo].[Token_status] ([ID])
GO
USE [master]
GO
ALTER DATABASE [CIS3365] SET  READ_WRITE 
GO
