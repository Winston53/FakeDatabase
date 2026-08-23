CREATE TABLE [dbo].[Customers] (
    [CustomerID] INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50)  NOT NULL,
    [LastName]   NVARCHAR (50)  NOT NULL,
    [Email]      NVARCHAR (100) NOT NULL,
    [Phone]      NVARCHAR (20)  NULL,
    [CreatedAt]  DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);


GO

