CREATE TABLE [dbo].[Orders] (
    [OrderID]     INT             IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT             NOT NULL,
    [OrderDate]   DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [TotalAmount] DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Status]      NVARCHAR (20)   DEFAULT ('Pending') NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [CHK_Orders_Status] CHECK ([Status]='Cancelled' OR [Status]='Shipped' OR [Status]='Processing' OR [Status]='Pending'),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
);


GO

CREATE NONCLUSTERED INDEX [IX_Orders_OrderDate]
    ON [dbo].[Orders]([OrderDate] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Orders_CustomerID]
    ON [dbo].[Orders]([CustomerID] ASC);


GO

