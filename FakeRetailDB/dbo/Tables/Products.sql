CREATE TABLE [dbo].[Products] (
    [ProductID]   INT             IDENTITY (1, 1) NOT NULL,
    [ProductName] NVARCHAR (100)  NOT NULL,
    [CategoryID]  INT             NOT NULL,
    [UnitPrice]   DECIMAL (10, 2) NOT NULL,
    [StockQty]    INT             DEFAULT ((0)) NOT NULL,
    [IsActive]    BIT             DEFAULT ((1)) NOT NULL,
    [CreatedAt]   DATETIME2 (7)   DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [CHK_Products_StockQty_NonNegative] CHECK ([StockQty]>=(0)),
    CONSTRAINT [CHK_Products_UnitPrice_Positive] CHECK ([UnitPrice]>=(0)),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID])
);


GO

CREATE NONCLUSTERED INDEX [IX_Products_IsActive]
    ON [dbo].[Products]([IsActive] ASC)
    INCLUDE([ProductName], [UnitPrice]);


GO

CREATE NONCLUSTERED INDEX [IX_Products_CategoryID]
    ON [dbo].[Products]([CategoryID] ASC);


GO

