
CREATE   PROCEDURE dbo.sp_GetCustomerOrderSummary
    @CustomerID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        c.CustomerID,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        COUNT(DISTINCT o.OrderID) AS TotalOrders,
        ISNULL(SUM(o.TotalAmount), 0) AS TotalSpent,
        MAX(o.OrderDate) AS LastOrderDate
    FROM dbo.Customers c
    LEFT JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
    WHERE @CustomerID IS NULL OR c.CustomerID = @CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.LastName
    ORDER BY TotalSpent DESC;
END;

GO

