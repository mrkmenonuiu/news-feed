USE [master]
GO
/****** Object:  Database [NewsFeed]    Script Date: 10/21/2020 22:54:50 ******/
CREATE DATABASE [NewsFeed] ON  PRIMARY 
( NAME = N'NewsFeed', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\NewsFeed.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NewsFeed_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\NewsFeed_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NewsFeed] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsFeed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsFeed] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [NewsFeed] SET ANSI_NULLS OFF
GO
ALTER DATABASE [NewsFeed] SET ANSI_PADDING OFF
GO
ALTER DATABASE [NewsFeed] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [NewsFeed] SET ARITHABORT OFF
GO
ALTER DATABASE [NewsFeed] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [NewsFeed] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [NewsFeed] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [NewsFeed] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [NewsFeed] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [NewsFeed] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [NewsFeed] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [NewsFeed] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [NewsFeed] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [NewsFeed] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [NewsFeed] SET  DISABLE_BROKER
GO
ALTER DATABASE [NewsFeed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [NewsFeed] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [NewsFeed] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [NewsFeed] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [NewsFeed] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [NewsFeed] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [NewsFeed] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [NewsFeed] SET  READ_WRITE
GO
ALTER DATABASE [NewsFeed] SET RECOVERY SIMPLE
GO
ALTER DATABASE [NewsFeed] SET  MULTI_USER
GO
ALTER DATABASE [NewsFeed] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [NewsFeed] SET DB_CHAINING OFF
GO
USE [NewsFeed]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 10/21/2020 22:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON
INSERT [dbo].[UserTypes] ([UserTypeID], [TypeName], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Admin', 1, N'Admin', CAST(0x0000AB3500000000 AS DateTime), NULL, NULL)
INSERT [dbo].[UserTypes] ([UserTypeID], [TypeName], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (2, N'General', 1, N'Admin', CAST(0x0000AB3500000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 10/21/2020 22:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserType] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [UserType], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Admin', N'123', N'Rashedul Islam', 1, 1, N'Admin', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [UserType], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (2, N'hannan', N'123', N'Rashedul Islam', 2, 1, N'Admin', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [UserType], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Karim', N'123', N'Rashedul Islam', 1, 1, N'Admin', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserLikeDislikeMappings]    Script Date: 10/21/2020 22:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLikeDislikeMappings](
	[UserLikeDislikeMappingID] [int] IDENTITY(1,1) NOT NULL,
	[CommentID] [int] NULL,
	[UserID] [int] NOT NULL,
	[IsLike] [bit] NOT NULL,
	[IsDislike] [bit] NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserLikeDislikeMappings] PRIMARY KEY CLUSTERED 
(
	[UserLikeDislikeMappingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserLikeDislikeMappings] ON
INSERT [dbo].[UserLikeDislikeMappings] ([UserLikeDislikeMappingID], [CommentID], [UserID], [IsLike], [IsDislike], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1, 3, 1, 1, 0, 1, N'admin', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[UserLikeDislikeMappings] ([UserLikeDislikeMappingID], [CommentID], [UserID], [IsLike], [IsDislike], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (2, 3, 2, 0, 1, 1, N'hannan', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[UserLikeDislikeMappings] ([UserLikeDislikeMappingID], [CommentID], [UserID], [IsLike], [IsDislike], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (3, 3, 3, 1, 0, 1, N'karim', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[UserLikeDislikeMappings] ([UserLikeDislikeMappingID], [CommentID], [UserID], [IsLike], [IsDislike], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (4, 4, 2, 1, 0, 1, N'karim', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[UserLikeDislikeMappings] ([UserLikeDislikeMappingID], [CommentID], [UserID], [IsLike], [IsDislike], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (5, 4, 3, 0, 1, 1, N'karim', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[UserLikeDislikeMappings] OFF
/****** Object:  Table [dbo].[Posts]    Script Date: 10/21/2020 22:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PostText] [text] NOT NULL,
	[PostedUserID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([PostID], [PostText], [PostedUserID], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (13, N'Test Post', 1, 1, N'Admin', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[Posts] ([PostID], [PostText], [PostedUserID], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (14, N' Test New Post For General People', 1, 1, N'Admin', CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  Table [dbo].[Comments]    Script Date: 10/21/2020 22:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentText] [text] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CommentUserID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON
INSERT [dbo].[Comments] ([CommentID], [CommentText], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy], [CommentUserID], [PostID]) VALUES (3, N'Not related to context', 1, N'admin', CAST(0x0000AB3500000000 AS DateTime), NULL, NULL, 1, 13)
INSERT [dbo].[Comments] ([CommentID], [CommentText], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy], [CommentUserID], [PostID]) VALUES (4, N'Good Post', 1, N'admin', CAST(0x0000AB3500000000 AS DateTime), NULL, NULL, 2, 14)
INSERT [dbo].[Comments] ([CommentID], [CommentText], [Status], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy], [CommentUserID], [PostID]) VALUES (5, N'Good Post Related to content', 1, N'admin', CAST(0x0000AB3500000000 AS DateTime), NULL, NULL, 2, 13)
SET IDENTITY_INSERT [dbo].[Comments] OFF
/****** Object:  ForeignKey [FK_User_UserType]    Script Date: 10/21/2020 22:54:50 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserType])
REFERENCES [dbo].[UserTypes] ([UserTypeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_UserType]
GO
/****** Object:  ForeignKey [FK_UserLikeDislikeMappings_Users]    Script Date: 10/21/2020 22:54:50 ******/
ALTER TABLE [dbo].[UserLikeDislikeMappings]  WITH CHECK ADD  CONSTRAINT [FK_UserLikeDislikeMappings_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserLikeDislikeMappings] CHECK CONSTRAINT [FK_UserLikeDislikeMappings_Users]
GO
/****** Object:  ForeignKey [FK_Post_User]    Script Date: 10/21/2020 22:54:50 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([PostedUserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Post_User]
GO
/****** Object:  ForeignKey [FK_Comment_Post]    Script Date: 10/21/2020 22:54:50 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_Post]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 10/21/2020 22:54:50 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([CommentUserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_User]
GO
