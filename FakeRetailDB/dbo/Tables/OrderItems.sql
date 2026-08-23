CREATE TABLE [dbo].[OrderItems] (
    [OrderItemID] INT             IDENTITY (1, 1) NOT NULL,
    [OrderID]     INT             NOT NULL,
    [ProductID]   INT             NOT NULL,
    [Quantity]    INT             NOT NULL,
    [UnitPrice]   DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderItemID] ASC),
    CONSTRAINT [CHK_OrderItems_Quantity_Positive] CHECK ([Quantity]>(0)),
    CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]) ON DELETE CASCADE,
    CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
);


GO

