Use [AdventureWorksLT2017]
Go

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT *
FROM SalesLT.SalesOrderHeader

--Detalle de productos vendidos 
SELECT 
    p.Name AS NombreProducto,
    sod.OrderQty AS CantidadVendida
FROM SalesLT.SalesOrderHeader soh
JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN SalesLT.Product p ON sod.ProductID = p.ProductID
WHERE soh.SalesOrderID = 71797;

--Top 3 Clientes
SELECT TOP 3 
    c.FirstName, 
    c.LastName,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalCompra
FROM SalesLT.SalesOrderHeader soh
JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID
WHERE MONTH(soh.OrderDate) = 6 AND YEAR(soh.OrderDate) = 2008
GROUP BY c.FirstName, c.LastName
ORDER BY TotalCompra DESC;

--Producto más vendido 
SELECT
    Mes,
    Producto,
    CantidadVendida
FROM
    (
        SELECT
            MONTH(soh.OrderDate) AS Mes,
            p.Name AS Producto,
            SUM(sod.OrderQty) AS CantidadVendida,
            ROW_NUMBER() OVER (PARTITION BY MONTH(soh.OrderDate) ORDER BY SUM(sod.OrderQty) DESC) AS Ranking
        FROM
            SalesLT.SalesOrderHeader soh
            JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
            JOIN SalesLT.Product p ON sod.ProductID = p.ProductID
        WHERE
            YEAR(soh.OrderDate) = 2008
        GROUP BY
            MONTH(soh.OrderDate),
            p.Name
    ) AS SubQuery
WHERE
    Ranking = 1
ORDER BY
    Mes;


--Mes con mayores ventas
SELECT
    DATENAME(MONTH, DATEADD(MONTH, MONTH(soh.OrderDate) - 1, 0)) AS Mes,
    SUM(sod.OrderQty * sod.UnitPrice) AS VentaTotal
FROM
    SalesLT.SalesOrderHeader soh
    JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE
    YEAR(soh.OrderDate) = 2008
GROUP BY
    MONTH(soh.OrderDate)
ORDER BY
    VentaTotal DESC;