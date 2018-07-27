--1
SELECT *
FROM City
WHERE POPULATION > 100000
AND CountryCode='MX'

--2
DELETE FROM City WHERE POPULATION < 100

--3
UPDATE City SET NAME=countrycode
WHERE District IN (SELECT DISTINCT District FROM City)

--4
--Paises donde tengo clientes
SELECT c.Code
	  ,c.Name	AS 'NombreCte'
	  ,a.Name	AS 'Pais'
FROM Country AS a
JOIN City AS b ON a.CountryCode=b.CountryCode
JOIN Customer AS c ON a.ID=c.cityID

--Paises donde no se tienen clientes
SELECT c.Code
	  ,c.Name	AS 'NombreCte'
	  ,a.Name	AS 'Pais'
FROM Country AS a
LEFT JOIN City AS b ON a.CountryCode=b.CountryCode
LEFT JOIN Customer AS c ON a.ID=c.cityID
WHERE a.Name IS NULL

--5
SELECT COUNT(ID)
FROM Customer
WHERE MONTH(CreationTime) BETWEEN MONTH(CreationTime)-3 AND MONTH(CreationTime)
GROUP BY CreationTime

--6
SELECT TOP 5 b.Name AS 'Ciudad'
             ,b.CountryCode
             ,COUNT(ID) AS 'NumClientes'
FROM City AS b 
JOIN Customer AS c ON a.ID=c.cityID
GROUP BY b.Name,b.CountryCode
ORDER BY NumClientes ASC

--7
SELECT TOP 5 c.Name AS 'NombreCte'
		    ,COUNT(i.ID) AS 'NumVentas'
		    ,SUM(Amount) AS 'TotalVentas'
FROM Invoice AS i
JOIN Customer AS c ON i.CustomerID=c.ID
GROUP BY c.NAME
ORDER BY NumVentas ASC, TotalVentas ASC

--8
SELECT c.ID
	   ,c.Name AS 'NombreCte'
FROM Customer AS c
LEFT JOIN Invoice AS i ON i.CustomerID=c.ID
WHERE MONTH(GETDATE())-MONTH(i.CreationTime) > 3
AND i.ID IS NULL

--9
SELECT o.Name AS 'NombrePais'
       ,AVG(Amount) AS 'Venta_promedio'
FROM Invoice AS i
JOIN  Customer AS c ON i.CustomerID=c.ID
JOIN City AS t ON t.ID=c.CityID
JOIN Country AS o ON o.CountryCode=t.CountryCode
GROUP BY o.NAME

--10
UPDATE c SET Estatus=0
FROM Customer AS c
LEFT JOIN Invoice AS i ON i.CustomerID=c.ID
 WHERE MONTH(GETDATE())-MONTH(i.CreationTime) > 6
 AND i.ID IS NULL
 
 --11
 SELECT c.Name AS 'NombreCte'
		,COUNT(i.ID) AS 'NumVentas'
		,SUM(Amount) AS 'TotalVentas'
FROM Invoice AS i
JOIN Customer AS c ON i.CustomerID=c.ID
 WHERE i.Estatus=1
 AND c.Estatus=1
GROUP BY c.NAME
ORDER BY NumVentas ASC, TotalVentas ASC
UNION ALL
 SELECT c.Name AS 'NombreCte'
		,COUNT(i.ID) AS 'NumVentas'
		,SUM(Amount) AS 'TotalVentas'
FROM Invoice AS i
JOIN Customer AS c ON i.CustomerID=c.ID
 WHERE i.Estatus=2
 AND c.Estatus=1
GROUP BY c.NAME
ORDER BY NumVentas ASC, TotalVentas ASC

--12
UPDATE i SET Reference=CountryCode
FROM Invoice AS i
JOIN  Customer AS c ON i.CustomerID=c.ID
JOIN City AS t ON t.ID=c.CityID
JOIN Country AS o ON o.CountryCode=t.CountryCode

--13
DELETE FROM Invoices WHERE Estatus=3 AND YEAR(GETDATE())-YEAR(CreationTime)>3