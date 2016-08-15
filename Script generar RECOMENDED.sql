
DECLARE @I INT; SET @I = 1;
WHILE @I <= 20000
BEGIN
	BEGIN TRY
		INSERT INTO recommended (proCode
						,rotCode
						,cusCode
						,untCode
						,jrnCode
						,recQuantity
						,recSentToDemand
						,recSystemDate)

		SELECT 
		proCode = (SELECT TOP 1 proCode FROM product ORDER BY NEWID())
		,rotCode = (SELECT TOP 1 rotCode FROM route ORDER BY NEWID())
,cusCode = (SELECT TOP 1 cusCode FROM customer ORDER BY NEWID())
,untCode = (SELECT TOP 1 untCode FROM unit ORDER BY NEWID())
,jrnCode = (SELECT TOP 1 jrnCode FROM journey ORDER BY NEWID())
,recQuantity = (SELECT  cast(RAND()*1000 as MONEY))
,recSentToDemand = (SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END)
,recSystemDate = (SELECT DateAdd(d, ROUND(DateDiff(d, '2010-01-01', '2016-12-31') * RAND(CHECKSUM(NEWID())), 0), DATEADD(second,CHECKSUM(NEWID())%48000, '2010-01-01')))
		
      END TRY
      BEGIN CATCH
		SELECT ERROR_MESSAGE();
      END CATCH
    SET @I = @I + 1
END
 