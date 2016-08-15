
DECLARE @I INT; SET @I = 1;
WHILE @I <= 50000
BEGIN
	BEGIN TRY
		INSERT INTO routeTracking (
jrnCode
,rtrDate
,lgnCode
,rtrSystemDate
,rtrGPSCoordinate1
,rtrGPSCoordinate2
,rtrOrder)

		SELECT 
		
jrnCode = (SELECT TOP 1 jrnCode FROM journey ORDER BY NEWID())
,rtrDate = (SELECT DateAdd(d, ROUND(DateDiff(d, '2010-01-01', '2016-12-31') * RAND(CHECKSUM(NEWID())), 0), DATEADD(second,CHECKSUM(NEWID())%48000, '2010-01-01')))
,lgnCode = (SELECT TOP 1 lgnCode FROM login ORDER BY NEWID())
,rtrSystemDate = (SELECT DateAdd(d, ROUND(DateDiff(d, '2010-01-01', '2016-12-31') * RAND(CHECKSUM(NEWID())), 0), DATEADD(second,CHECKSUM(NEWID())%48000, '2010-01-01')))
,rtrGPSCoordinate1 = 0
,rtrGPSCoordinate2 = 0
,rtrOrder = 0
		
      END TRY
      BEGIN CATCH
		SELECT ERROR_MESSAGE();
      END CATCH
    SET @I = @I + 1
END
 