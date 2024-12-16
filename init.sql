-- Check if the database exists, if not, create it
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'FfhubDB')
BEGIN
    CREATE DATABASE FfhubDB;
END;
GO

-- Switch to the FfhubDB
USE FfhubDB;
GO

-- Create Users table if it does not exist
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Videos')
BEGIN
    CREATE TABLE Videos (
        VideoId INT IDENTITY(1,1) PRIMARY KEY,
        Link NVARCHAR(2048) NOT NULL,
        Title NVARCHAR(200)
    );
END;
GO

-- Create Users table if it does not exist
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Tags')
BEGIN
    CREATE TABLE Tags (
    TagId INT PRIMARY KEY IDENTITY,
    TagName NVARCHAR(50) UNIQUE
);
END;
GO

-- Create Users table if it does not exist
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'VideoTags ')
BEGIN
    CREATE TABLE VideoTags (
    VideoId INT,
    TagId INT,
    PRIMARY KEY (VideoId, TagId),
    FOREIGN KEY (VideoId) REFERENCES Videos(VideoId),
    FOREIGN KEY (TagId) REFERENCES Tags(TagId)
);

END;
GO

-- -- Ensure Username column is case-sensitive (Latin1_General_BIN)
-- IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users')
-- BEGIN
--     ALTER TABLE Users
--     ALTER COLUMN Username NVARCHAR(50) COLLATE Latin1_General_BIN;
-- END;
GO