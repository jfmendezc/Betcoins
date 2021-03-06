USE [betcoins-dev]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamCompetitionGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[TeamCompetitionGroup] DROP CONSTRAINT IF EXISTS [FK_TeamCompetitionGroup_TeamCompetition]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamCompetitionGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[TeamCompetitionGroup] DROP CONSTRAINT IF EXISTS [FK_TeamCompetitionGroup_Group]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamCompetition]') AND type in (N'U'))
ALTER TABLE [dbo].[TeamCompetition] DROP CONSTRAINT IF EXISTS [FK_TeamCompetition_Team]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamCompetition]') AND type in (N'U'))
ALTER TABLE [dbo].[TeamCompetition] DROP CONSTRAINT IF EXISTS [FK_TeamCompetition_Competition]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
ALTER TABLE [dbo].[Team] DROP CONSTRAINT IF EXISTS [FK_Team_League]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT IF EXISTS [FK_Match_Team1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT IF EXISTS [FK_Match_Team]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT IF EXISTS [FK_Match_Stage]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT IF EXISTS [FK_Match_MatchType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT IF EXISTS [FK_Match_Competition]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bet]') AND type in (N'U'))
ALTER TABLE [dbo].[Bet] DROP CONSTRAINT IF EXISTS [FK_Bet_Match]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bet]') AND type in (N'U'))
ALTER TABLE [dbo].[Bet] DROP CONSTRAINT IF EXISTS [FK_Bet_Account]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountCompetition]') AND type in (N'U'))
ALTER TABLE [dbo].[AccountCompetition] DROP CONSTRAINT IF EXISTS [FK_AccountCompetition_Competition]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountCompetition]') AND type in (N'U'))
ALTER TABLE [dbo].[AccountCompetition] DROP CONSTRAINT IF EXISTS [FK_AccountCompetition_Account]
GO
DROP TABLE IF EXISTS [dbo].[TeamCompetitionGroup]
GO
DROP TABLE IF EXISTS [dbo].[TeamCompetition]
GO
DROP TABLE IF EXISTS [dbo].[Team]
GO
DROP TABLE IF EXISTS [dbo].[Stage]
GO
DROP TABLE IF EXISTS [dbo].[MatchType]
GO
DROP TABLE IF EXISTS [dbo].[Match]
GO
DROP TABLE IF EXISTS [dbo].[League]
GO
DROP TABLE IF EXISTS [dbo].[Group]
GO
DROP TABLE IF EXISTS [dbo].[Competition]
GO
DROP TABLE IF EXISTS [dbo].[Bet]
GO
DROP TABLE IF EXISTS [dbo].[AccountCompetition]
GO
DROP TABLE IF EXISTS [dbo].[Account]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Account](
	[AccountId] [varchar](100) NOT NULL,
	[FullName] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[NickName] [varchar](max) NOT NULL,
	[Picture] [varchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountCompetition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountCompetition](
	[AccountCompetitionId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [varchar](100) NOT NULL,
	[CompetitionId] [int] NOT NULL,
	[Coins] [int] NOT NULL,
	[HasSecondChance] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountCompetition] PRIMARY KEY CLUSTERED 
(
	[AccountCompetitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bet](
	[BetId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [varchar](100) NOT NULL,
	[MatchId] [int] NOT NULL,
	[Coins] [int] NOT NULL,
	[HomeTeamGoals] [int] NOT NULL,
	[VisitorTeamGoals] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Bet] PRIMARY KEY CLUSTERED 
(
	[BetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Competition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Competition](
	[CompetitionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Competition] PRIMARY KEY CLUSTERED 
(
	[CompetitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[League]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[League](
	[LeagueId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Logo] [varchar](max) NOT NULL,
 CONSTRAINT [PK_League] PRIMARY KEY CLUSTERED 
(
	[LeagueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Match](
	[MatchId] [int] IDENTITY(1,1) NOT NULL,
	[HomeTeamId] [int] NOT NULL,
	[VisitorTeamId] [int] NOT NULL,
	[StageId] [int] NOT NULL,
	[CompetitionId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[HomeTeamGoals] [int] NOT NULL,
	[VisitorTeamGoals] [int] NOT NULL,
	[HasExtraTime] [bit] NOT NULL,
	[HasPenalties] [bit] NOT NULL,
	[HomeTeamGoalsInPenalties] [int] NOT NULL,
	[VisitorTeamGoalsInPenalties] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatchType](
	[MatchTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MatchType] PRIMARY KEY CLUSTERED 
(
	[MatchTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stage](
	[StageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[StageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Team](
	[TeamId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](35) NOT NULL,
	[Emblem] [varchar](max) NOT NULL,
	[LeagueId] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamCompetition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TeamCompetition](
	[TeamCompetitionId] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[CompetitionId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TeamCompetition] PRIMARY KEY CLUSTERED 
(
	[TeamCompetitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamCompetitionGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TeamCompetitionGroup](
	[TeamCompetitionGroupId] [int] IDENTITY(1,1) NOT NULL,
	[TeamCompetitionId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[Played]  AS (([Won]+[Lost])+[Draw]),
	[Won] [int] NOT NULL,
	[Lost] [int] NOT NULL,
	[Draw] [int] NOT NULL,
	[GoalFor] [int] NOT NULL,
	[GoalAgainst] [int] NOT NULL,
	[GoalDifference] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TeamCompetitionGroup] PRIMARY KEY CLUSTERED 
(
	[TeamCompetitionGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountCompetition_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCompetition]'))
ALTER TABLE [dbo].[AccountCompetition]  WITH CHECK ADD  CONSTRAINT [FK_AccountCompetition_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountCompetition_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCompetition]'))
ALTER TABLE [dbo].[AccountCompetition] CHECK CONSTRAINT [FK_AccountCompetition_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountCompetition_Competition]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCompetition]'))
ALTER TABLE [dbo].[AccountCompetition]  WITH CHECK ADD  CONSTRAINT [FK_AccountCompetition_Competition] FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountCompetition_Competition]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountCompetition]'))
ALTER TABLE [dbo].[AccountCompetition] CHECK CONSTRAINT [FK_AccountCompetition_Competition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bet_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bet]'))
ALTER TABLE [dbo].[Bet]  WITH CHECK ADD  CONSTRAINT [FK_Bet_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bet_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bet]'))
ALTER TABLE [dbo].[Bet] CHECK CONSTRAINT [FK_Bet_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bet_Match]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bet]'))
ALTER TABLE [dbo].[Bet]  WITH CHECK ADD  CONSTRAINT [FK_Bet_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bet_Match]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bet]'))
ALTER TABLE [dbo].[Bet] CHECK CONSTRAINT [FK_Bet_Match]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Competition]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Competition] FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Competition]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Competition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_MatchType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_MatchType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[MatchType] ([MatchTypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_MatchType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_MatchType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Stage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Stage] FOREIGN KEY([StageId])
REFERENCES [dbo].[Stage] ([StageId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Stage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Stage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team] FOREIGN KEY([HomeTeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team1] FOREIGN KEY([VisitorTeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Team_League]') AND parent_object_id = OBJECT_ID(N'[dbo].[Team]'))
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_League] FOREIGN KEY([LeagueId])
REFERENCES [dbo].[League] ([LeagueId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Team_League]') AND parent_object_id = OBJECT_ID(N'[dbo].[Team]'))
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_League]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetition_Competition]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetition]'))
ALTER TABLE [dbo].[TeamCompetition]  WITH CHECK ADD  CONSTRAINT [FK_TeamCompetition_Competition] FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetition_Competition]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetition]'))
ALTER TABLE [dbo].[TeamCompetition] CHECK CONSTRAINT [FK_TeamCompetition_Competition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetition_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetition]'))
ALTER TABLE [dbo].[TeamCompetition]  WITH CHECK ADD  CONSTRAINT [FK_TeamCompetition_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetition_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetition]'))
ALTER TABLE [dbo].[TeamCompetition] CHECK CONSTRAINT [FK_TeamCompetition_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetitionGroup_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetitionGroup]'))
ALTER TABLE [dbo].[TeamCompetitionGroup]  WITH CHECK ADD  CONSTRAINT [FK_TeamCompetitionGroup_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetitionGroup_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetitionGroup]'))
ALTER TABLE [dbo].[TeamCompetitionGroup] CHECK CONSTRAINT [FK_TeamCompetitionGroup_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetitionGroup_TeamCompetition]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetitionGroup]'))
ALTER TABLE [dbo].[TeamCompetitionGroup]  WITH CHECK ADD  CONSTRAINT [FK_TeamCompetitionGroup_TeamCompetition] FOREIGN KEY([TeamCompetitionId])
REFERENCES [dbo].[TeamCompetition] ([TeamCompetitionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamCompetitionGroup_TeamCompetition]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamCompetitionGroup]'))
ALTER TABLE [dbo].[TeamCompetitionGroup] CHECK CONSTRAINT [FK_TeamCompetitionGroup_TeamCompetition]
GO
