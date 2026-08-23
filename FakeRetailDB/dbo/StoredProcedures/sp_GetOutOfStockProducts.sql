CREATE PROCEDURE [dbo].[sp_GetOutOfStockProducts]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        p.ProductID,
        p.ProductName,
        c.CategoryName,
        p.StockQty
    FROM dbo.Products p
    INNER JOIN dbo.Categories c ON p.CategoryID = c.CategoryID
    WHERE p.StockQty = 0
      AND p.IsActive = 1;
END;