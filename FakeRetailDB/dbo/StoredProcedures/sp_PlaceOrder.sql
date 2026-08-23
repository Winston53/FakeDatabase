
CREATE   PROCEDURE dbo.sp_PlaceOrder
    @CustomerID INT,
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @UnitPrice DECIMAL(10,2);
    DECLARE @StockQty INT;
    DECLARE @NewOrderID INT;
    
    SELECT @UnitPrice = UnitPrice, @StockQty = StockQty 
    FROM dbo.Products 
    WHERE ProductID = @ProductID AND IsActive = 1;
    
    IF @UnitPrice IS NULL
    BEGIN
        RAISERROR('Product not found or inactive.', 16, 1);
        RETURN;
    END
    
    IF @StockQty < @Quantity
    BEGIN
        RAISERROR('Insufficient stock.', 16, 1);
        RETURN;
    END
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
        INSERT INTO dbo.Orders (CustomerID, TotalAmount, Status)
        VALUES (@CustomerID, @Quantity * @UnitPrice, 'Pending');
        
        SET @NewOrderID = SCOPE_IDENTITY();
        
        INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity, UnitPrice)
        VALUES (@NewOrderID, @ProductID, @Quantity, @UnitPrice);
        
        UPDATE dbo.Products 
        SET StockQty = StockQty - @Quantity 
        WHERE ProductID = @ProductID;
        
        COMMIT TRANSACTION;
        
        SELECT @NewOrderID AS OrderID;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO

