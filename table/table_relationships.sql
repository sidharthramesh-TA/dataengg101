
USE [WideWorldImporters]
GO

/****** Object:  Table [Application].[Cities]    Script Date: 7/25/2024 1:35:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Application].[Cities](
	[CityID] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[StateProvinceID] [int] NOT NULL,
	[Location] [geography] NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[Cities_Archive] )
)
GO

ALTER TABLE [Application].[Cities] ADD  CONSTRAINT [DF_Application_Cities_CityID]  DEFAULT (NEXT VALUE FOR [Sequences].[CityID]) FOR [CityID]
GO

ALTER TABLE [Application].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Application_Cities_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[Cities] CHECK CONSTRAINT [FK_Application_Cities_Application_People]
GO

ALTER TABLE [Application].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Application_Cities_StateProvinceID_Application_StateProvinces] FOREIGN KEY([StateProvinceID])
REFERENCES [Application].[StateProvinces] ([StateProvinceID])
GO

ALTER TABLE [Application].[Cities] CHECK CONSTRAINT [FK_Application_Cities_StateProvinceID_Application_StateProvinces]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a city within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'CityID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Formal name of the city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'CityName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'State or province for this city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic location of the city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'Location'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Latest available population for the City' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'LatestRecordedPopulation'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Cities that are part of any address (including geographic location)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities'
GO


USE [WideWorldImporters]
GO

/****** Object:  Table [Application].[Countries]    Script Date: 7/25/2024 1:36:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Application].[Countries](
	[CountryID] [int] NOT NULL,
	[CountryName] [nvarchar](60) NOT NULL,
	[FormalName] [nvarchar](60) NOT NULL,
	[IsoAlpha3Code] [nvarchar](3) NULL,
	[IsoNumericCode] [int] NULL,
	[CountryType] [nvarchar](20) NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[Continent] [nvarchar](30) NOT NULL,
	[Region] [nvarchar](30) NOT NULL,
	[Subregion] [nvarchar](30) NOT NULL,
	[Border] [geography] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_Countries_CountryName] UNIQUE NONCLUSTERED 
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_Countries_FormalName] UNIQUE NONCLUSTERED 
(
	[FormalName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[Countries_Archive] )
)
GO

ALTER TABLE [Application].[Countries] ADD  CONSTRAINT [DF_Application_Countries_CountryID]  DEFAULT (NEXT VALUE FOR [Sequences].[CountryID]) FOR [CountryID]
GO

ALTER TABLE [Application].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Application_Countries_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[Countries] CHECK CONSTRAINT [FK_Application_Countries_Application_People]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a country within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'CountryID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the country' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'CountryName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full formal name of the country as agreed by United Nations' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'FormalName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'3 letter alphabetic code assigned to the country by ISO' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'IsoAlpha3Code'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric code assigned to the country by ISO' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'IsoNumericCode'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of country or administrative region' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'CountryType'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Latest available population for the country' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'LatestRecordedPopulation'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the continent' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Continent'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the region' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Region'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the subregion' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Subregion'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic border of the country as described by the United Nations' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Border'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Countries that contain the states or provinces (including geographic boundaries)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries'
GO

USE [WideWorldImporters]
GO

/****** Object:  Table [Application].[DeliveryMethods]    Script Date: 7/25/2024 1:36:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Application].[DeliveryMethods](
	[DeliveryMethodID] [int] NOT NULL,
	[DeliveryMethodName] [nvarchar](50) NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[DeliveryMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_DeliveryMethods_DeliveryMethodName] UNIQUE NONCLUSTERED 
(
	[DeliveryMethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[DeliveryMethods_Archive] )
)
GO

ALTER TABLE [Application].[DeliveryMethods] ADD  CONSTRAINT [DF_Application_DeliveryMethods_DeliveryMethodID]  DEFAULT (NEXT VALUE FOR [Sequences].[DeliveryMethodID]) FOR [DeliveryMethodID]
GO

ALTER TABLE [Application].[DeliveryMethods]  WITH CHECK ADD  CONSTRAINT [FK_Application_DeliveryMethods_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[DeliveryMethods] CHECK CONSTRAINT [FK_Application_DeliveryMethods_Application_People]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a delivery method within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'DeliveryMethods', @level2type=N'COLUMN',@level2name=N'DeliveryMethodID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of methods that can be used for delivery of customer orders' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'DeliveryMethods', @level2type=N'COLUMN',@level2name=N'DeliveryMethodName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ways that stock items can be delivered (ie: truck/van, post, pickup, courier, etc.' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'DeliveryMethods'
GO

USE [WideWorldImporters]
GO

/****** Object:  Table [Application].[PaymentMethods]    Script Date: 7/25/2024 1:36:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Application].[PaymentMethods](
	[PaymentMethodID] [int] NOT NULL,
	[PaymentMethodName] [nvarchar](50) NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_PaymentMethods_PaymentMethodName] UNIQUE NONCLUSTERED 
(
	[PaymentMethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[PaymentMethods_Archive] )
)
GO

ALTER TABLE [Application].[PaymentMethods] ADD  CONSTRAINT [DF_Application_PaymentMethods_PaymentMethodID]  DEFAULT (NEXT VALUE FOR [Sequences].[PaymentMethodID]) FOR [PaymentMethodID]
GO

ALTER TABLE [Application].[PaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_Application_PaymentMethods_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[PaymentMethods] CHECK CONSTRAINT [FK_Application_PaymentMethods_Application_People]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a payment type within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'PaymentMethods', @level2type=N'COLUMN',@level2name=N'PaymentMethodID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of ways that customers can make payments or that suppliers can be paid' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'PaymentMethods', @level2type=N'COLUMN',@level2name=N'PaymentMethodName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ways that payments can be made (ie: cash, check, EFT, etc.' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'PaymentMethods'
GO

USE [WideWorldImporters]
GO

/****** Object:  Table [Application].[People]    Script Date: 7/25/2024 1:37:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Application].[People](
	[PersonID] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[PreferredName] [nvarchar](50) NOT NULL,
	[SearchName]  AS (concat([PreferredName],N' ',[FullName])) PERSISTED NOT NULL,
	[IsPermittedToLogon] [bit] NOT NULL,
	[LogonName] [nvarchar](50) NULL,
	[IsExternalLogonProvider] [bit] NOT NULL,
	[HashedPassword] [varbinary](max) NULL,
	[IsSystemUser] [bit] NOT NULL,
	[IsEmployee] [bit] NOT NULL,
	[IsSalesperson] [bit] NOT NULL,
	[UserPreferences] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[FaxNumber] [nvarchar](20) NULL,
	[EmailAddress] [nvarchar](256) NULL,
	[Photo] [varbinary](max) NULL,
	[CustomFields] [nvarchar](max) NULL,
	[OtherLanguages]  AS (json_query([CustomFields],N'$.OtherLanguages')),
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_People] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[People_Archive] )
)
GO

ALTER TABLE [Application].[People] ADD  CONSTRAINT [DF_Application_People_PersonID]  DEFAULT (NEXT VALUE FOR [Sequences].[PersonID]) FOR [PersonID]
GO

ALTER TABLE [Application].[People]  WITH CHECK ADD  CONSTRAINT [FK_Application_People_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[People] CHECK CONSTRAINT [FK_Application_People_Application_People]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a person within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'PersonID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name for this person' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'FullName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name that this person prefers to be called' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'PreferredName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name to build full text search on (computed column)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'SearchName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this person permitted to log on?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsPermittedToLogon'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Person''s system logon name' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'LogonName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is logon token provided by an external system?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsExternalLogonProvider'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Hash of password for users without external logon tokens' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'HashedPassword'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is the currently permitted to make online access?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsSystemUser'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this person an employee?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsEmployee'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this person a staff salesperson?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsSalesperson'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'User preferences related to the website (holds JSON data)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'UserPreferences'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Phone number' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Fax number  ' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'FaxNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Email address for this person' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Photo of this person' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'Photo'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Custom fields for employees and salespeople' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'CustomFields'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Other languages spoken (computed column from custom fields)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'OtherLanguages'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'People known to the application (staff, customer contacts, supplier contacts)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People'
GO

USE [WideWorldImporters]
GO

/****** Object:  Table [Application].[StateProvinces]    Script Date: 7/25/2024 1:37:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Application].[StateProvinces](
	[StateProvinceID] [int] NOT NULL,
	[StateProvinceCode] [nvarchar](5) NOT NULL,
	[StateProvinceName] [nvarchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[SalesTerritory] [nvarchar](50) NOT NULL,
	[Border] [geography] NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_StateProvinces] PRIMARY KEY CLUSTERED 
(
	[StateProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_StateProvinces_StateProvinceName] UNIQUE NONCLUSTERED 
(
	[StateProvinceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[StateProvinces_Archive] )
)
GO

ALTER TABLE [Application].[StateProvinces] ADD  CONSTRAINT [DF_Application_StateProvinces_StateProvinceID]  DEFAULT (NEXT VALUE FOR [Sequences].[StateProvinceID]) FOR [StateProvinceID]
GO

ALTER TABLE [Application].[StateProvinces]  WITH CHECK ADD  CONSTRAINT [FK_Application_StateProvinces_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[StateProvinces] CHECK CONSTRAINT [FK_Application_StateProvinces_Application_People]
GO

ALTER TABLE [Application].[StateProvinces]  WITH CHECK ADD  CONSTRAINT [FK_Application_StateProvinces_CountryID_Application_Countries] FOREIGN KEY([CountryID])
REFERENCES [Application].[Countries] ([CountryID])
GO

ALTER TABLE [Application].[StateProvinces] CHECK CONSTRAINT [FK_Application_StateProvinces_CountryID_Application_Countries]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a state or province within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Common code for this state or province (such as WA - Washington for the USA)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'StateProvinceCode'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Formal name of the state or province' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'StateProvinceName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Country for this StateProvince' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'CountryID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Sales territory for this StateProvince' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'SalesTerritory'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic boundary of the state or province' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'Border'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Latest available population for the StateProvince' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'LatestRecordedPopulation'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'States or provinces that contain cities (including geographic location)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces'
GO

USE [WideWorldImporters]
GO

/****** Object:  Table [Application].[TransactionTypes]    Script Date: 7/25/2024 1:37:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Application].[TransactionTypes](
	[TransactionTypeID] [int] NOT NULL,
	[TransactionTypeName] [nvarchar](50) NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_TransactionTypes] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_TransactionTypes_TransactionTypeName] UNIQUE NONCLUSTERED 
(
	[TransactionTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[TransactionTypes_Archive] )
)
GO

ALTER TABLE [Application].[TransactionTypes] ADD  CONSTRAINT [DF_Application_TransactionTypes_TransactionTypeID]  DEFAULT (NEXT VALUE FOR [Sequences].[TransactionTypeID]) FOR [TransactionTypeID]
GO

ALTER TABLE [Application].[TransactionTypes]  WITH CHECK ADD  CONSTRAINT [FK_Application_TransactionTypes_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[TransactionTypes] CHECK CONSTRAINT [FK_Application_TransactionTypes_Application_People]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a transaction type within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'TransactionTypes', @level2type=N'COLUMN',@level2name=N'TransactionTypeID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of the transaction type' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'TransactionTypes', @level2type=N'COLUMN',@level2name=N'TransactionTypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Types of customer, supplier, or stock transactions (ie: invoice, credit note, etc.)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'TransactionTypes'
GO


