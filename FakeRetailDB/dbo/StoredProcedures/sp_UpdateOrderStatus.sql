
CREATE   PROCEDURE dbo.sp_UpdateOrderStatus
    @OrderID INT,
    @NewStatus NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @NewStatus NOT IN ('Pending','Processing','Shipped','Cancelled')
    BEGIN
        RAISERROR('Invalid status value.', 16, 1);
        RETURN;
    END
    
    UPDATE dbo.Orders 
    SET Status = @NewStatus 
    WHERE OrderID = @OrderID;
    
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('Order not found.', 16, 1);
        RETURN;
    END
END;

GO

