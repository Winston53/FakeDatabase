CREATE TABLE [dbo].[Categories] (
    [CategoryID]   INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (50)  NOT NULL,
    [Description]  NVARCHAR (255) NULL,
    [CreatedAt]    DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);


GO

