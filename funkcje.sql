---1---
BEGIN
	SELECT AVG(pay.Rate) AS wynagrodzenie FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay
	SELECT * FROM [AdventureWorks2017].[HumanResources].[Employee] employee JOIN [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay
	ON pay.BusinessEntityID = employee.BusinessEntityID WHERE pay.Rate < (SELECT AVG(pay.Rate) FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay)
END

---2---
CREATE FUNCTION zam (@nr_zam INT)
RETURNS datetime
AS
	BEGIN
		DECLARE @zam datetime;
		SELECT @zam=ShipDate FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] WHERE SalesOrderID=@nr_zam;
		RETURN @zam
	END;
	
---3---
CREATE PROCEDURE Product_Info( @product_name nvarchar(50))
AS 
	BEGIN
 	SELECT Product.ProductID,product.name,product.MakeFlag FROM [AdventureWorks2017].[Production].[Product] Product 
	WHERE Product.Name = @product_name
END;

---4---
CREATE FUNCTION CardNUM (@order_number NVARCHAR(25))
RETURNS TABLE AS
RETURN
	(SELECT credit_card.CardNumber FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] Sales
	JOIN [AdventureWorks2017].[Sales].[CreditCard] Credit_Card ON Sales.CreditCardID = credit_card.CreditCardID 
	WHERE Sales.SalesOrderNumber = @order_number)
		
---5---
CREATE PROCEDURE dzielenie (@num1 INT,@num2 INT)
AS
DECLARE @wynik FLOAT;
	IF @num1>@num2
		BEGIN
			SET @wynik = @num1/@num2;
			SELECT @wynik as dzielenie_wynik
			RETURN @wynik;
		END
	ELSE
		BEGIN
			RAISERROR('Niewlasciwie zdefiniowales dane wejsciowe',11,1)
	END
