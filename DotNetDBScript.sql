USE [DotNetDB]
GO
/****** Object:  Table [dbo].[Conf_Religion]    Script Date: 02-Sep-22 7:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conf_Religion](
	[ReligionId] [int] IDENTITY(1,1) NOT NULL,
	[ReligionName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAuth]    Script Date: 02-Sep-22 7:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAuth](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserTypeid] [nchar](10) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UserAuth_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserContact]    Script Date: 02-Sep-22 7:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContact](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Contact] [int] NULL,
	[Social] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_UserContact] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegistration]    Script Date: 02-Sep-22 7:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegistration](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[DateOfBirth] [date] NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [varchar](11) NULL,
	[Address] [nvarchar](50) NULL,
	[Nationality] [nvarchar](50) NULL,
	[ReligionId] [int] NULL,
	[EntryDate] [datetime] NULL,
	[UserImage] [varchar](50) NULL,
 CONSTRAINT [PK_UserRegistration] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAuth]  WITH CHECK ADD  CONSTRAINT [FK_UserAuth_UserRegistration] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserRegistration] ([UserId])
GO
ALTER TABLE [dbo].[UserAuth] CHECK CONSTRAINT [FK_UserAuth_UserRegistration]
GO
/****** Object:  StoredProcedure [dbo].[AuthSp_CheckLogin]    Script Date: 02-Sep-22 7:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC [AuthSp_CheckLogin] 'admin','123'
*/
CREATE Proc [dbo].[AuthSp_CheckLogin]
(
@UserName varchar(50),
@UPassword varchar(50)
)
AS
BEGIN
Select UserAuth.UserId,
(UserRegistration.FirstName + ' ' + ISNULL(UserRegistration.MiddleName, '') + ' '+ UserRegistration.LastName) AS FulName,
UserImage,''
from UserAuth INNER JOIN
UserRegistration ON UserAuth.UserId = UserRegistration.UserId
where IsActive = 1 and UserAuth.UserName = @UserName and UserPassword = @UPassword
END
GO
/****** Object:  StoredProcedure [dbo].[AuthSp_InsertURegistration]    Script Date: 02-Sep-22 7:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[AuthSp_InsertURegistration]
(
@UserName varchar(50),
@FirstName varchar(50),
@MiddleName varchar(50),
@LastName varchar(50),
@Gender int,
@DateofBirth varchar(50),
@Email  varchar(50),
@ContactNo  varchar(50),
@Address  varchar(250),
@Nationality  varchar(50),
@ReligionId int,
@UserImage  varchar(50)
)
AS
BEGIN


INSERT INTO dbo.UserRegistration
(UserName,FirstName,MiddleName,LastName,Gender,DateofBirth,Email
,ContactNo,Address,Nationality,ReligionId,EntryDate,UserImage)

VALUES
(@UserName,@FirstName,@MiddleName,@LastName,@Gender,@DateofBirth
,@Email,@ContactNo,@Address,@Nationality,@ReligionId,GETDATE(),@UserImage)


END
GO
