--begin tran
 
DECLARE @rotCode NCHAR(5)
DECLARE @routes TABLE (rotCode NCHAR(5))
INSERT INTO @routes (rotCode) VALUES ('RP001')
--INSERT INTO @routes (rotCode) VALUES ('00433')
--INSERT INTO @routes (rotCode) VALUES ('00437')
 
DECLARE @eodCodeLast INT
DECLARE @dmdCodeLast nchar(16)
DECLARE @dmdCodeNew INT
DECLARE @movCodeNew INT
DECLARE @movCodeNewCheckIn NCHAR(16)
DECLARE @movCodeNewUnload NCHAR(16)

DECLARE @I INT; SET @I = 1;
   
--SELECT @rotCode = MIN(rotCode) FROM @routes 
WHILE @I <= 20000
BEGIN
 
    --BEGIN TRAN
	BEGIN TRY
		INSERT INTO reasonCustomer (rotCode
								,cusCode
								,reaCode
								,racDate
								,lgnCode
								,jrnCode
								,racProcess
								,racDeleted
								,racSystemDate)

		SELECT 
		rotCode = (SELECT TOP 1 rotCode FROM route ORDER BY NEWID())
		,cusCode = (SELECT TOP 1 cusCode FROM customer ORDER BY NEWID())
		,reaCode = (SELECT TOP 1 reaCode FROM reason ORDER BY NEWID())
		--,racDate = (select cast(cast(RAND()*100000 as int) as datetime))
		,racDate = (SELECT DateAdd(d, ROUND(DateDiff(d, '2010-01-01', '2016-12-31') * RAND(CHECKSUM(NEWID())), 0), DATEADD(second,CHECKSUM(NEWID())%48000, '2010-01-01')))
		,lgnCode = (SELECT TOP 1 lgnCode FROM login ORDER BY NEWID())
		,jrnCode = (SELECT TOP 1 jrnCode FROM journey ORDER BY NEWID())
		,racProcess = (SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END)
		,racDeleted = (SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END)
		,racSystemDate = ((select cast(cast(RAND()*100000 as int) as datetime)))
      
      END TRY
      BEGIN CATCH
		SELECT ERROR_MESSAGE();
      END CATCH
    --COMMIT
     
    -- pasar a la siguiente ruta
    SET @I = @I + 1
END
 
--SELECT  * FROM    DEV_XSales_Mobile_441..collectionUp
--commit
--rollback
  