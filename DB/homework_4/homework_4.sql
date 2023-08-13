--В рамках БД "онлайн-магазин" напишите след/запросы:

--Найти мин/стоимость товаров для каждой категории
SELECT MIN (Price) AS min_price,
       CategoryID
FROM Products
GROUP BY CategoryID

--Вывести ТОП-3 стран по количеству доставленных заказов
SELECT
    COUNT (OrderID) AS count_orders,
    Customers.Country
FROM [Customers]
    JOIN Orders ON Customers.CustomerID=Orders.CustomerID
GROUP BY Country
ORDER BY count_orders DESC
    LIMIT 3

--Вывести названия категорий, в которых более 10 товаров
SELECT
    COUNT (ProductName) AS count_products,
    CategoryName
FROM [Products]
    JOIN Categories ON Products.CategoryID=Categories.CategoryID
GROUP BY CategoryName
HAVING count_products >=10

--Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone = ''
WHERE Country='USA'

--Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
    COUNT (OrderID) AS count_orders,
    Employees.LastName,
    Employees.FirstName
FROM [Orders]
    JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Employees.EmployeeID
HAVING count_orders <=15

--Вывести товар, который находится на втором месте по ко-ву заказов

SELECT COUNT(Products.ProductID) AS Count_products,
       Products.ProductName
FROM OrderDetails
         JOIN Products On OrderDetails.ProductID=Products.ProductID
GROUP BY Products.ProductID
ORDER BY Count_products DESC
    LIMIT 1 OFFSET 1