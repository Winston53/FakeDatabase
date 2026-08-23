
CREATE   PROCEDURE dbo.sp_GetLowStockProducts
    @Threshold INT = 20
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        p.ProductID,
        p.ProductName,
        c.CategoryName,
        p.StockQty,
        p.UnitPrice
    FROM dbo.Products p
    INNER JOIN dbo.Categories c ON p.CategoryID = c.CategoryID
    WHERE p.StockQty <= @Threshold
      AND p.IsActive = 1
    ORDER BY p.StockQty ASC;
END;

GO

