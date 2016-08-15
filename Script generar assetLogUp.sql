
DECLARE @I INT; SET @I = 1;
WHILE @I <= 20000
BEGIN
	BEGIN TRY
		INSERT INTO assetLogUp (astCode
,aslSystemDate
,cusCode
,rotCode
,lgnCode
,stsCode
,reaCode
,reaCodeNoBarCodeReading
,jrnCode
,aslInstall
,aslUninstall
,aslStatusChange
,aslStatusComment
,aslStatusDate
,aslBarCodeReading
,aslProcess 
,aslGPSCoordinate1
,aslGPSCoordinate2)

		SELECT 
		astCode = (SELECT TOP 1 astCode FROM asset ORDER BY NEWID())
,aslSystemDate = (SELECT DateAdd(d, ROUND(DateDiff(d, '2010-01-01', '2016-12-31') * RAND(CHECKSUM(NEWID())), 0), DATEADD(second,CHECKSUM(NEWID())%48000, '2010-01-01')))
,cusCode = (SELECT TOP 1 cusCode FROM customer ORDER BY NEWID())
,rotCode = (SELECT TOP 1 rotCode FROM route ORDER BY NEWID())
,lgnCode = (SELECT TOP 1 lgnCode FROM login ORDER BY NEWID())
,stsCode = (SELECT TOP 1 stsCode FROM status ORDER BY NEWID())
,reaCode = (SELECT TOP 1 reaCode FROM reason ORDER BY NEWID())
,reaCodeNoBarCodeReading = null
,jrnCode  = (SELECT TOP 1 jrnCode FROM journey ORDER BY NEWID())
,aslInstall = (SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END)
,aslUninstall = (SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END)
,aslStatusChange = (SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END)
,aslStatusComment = null
,aslStatusDate = null
,aslBarCodeReading = null
,aslProcess = (SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END)
,aslGPSCoordinate1 = null
,aslGPSCoordinate2 = null
		
      END TRY
      BEGIN CATCH
		SELECT ERROR_MESSAGE();
      END CATCH
    SET @I = @I + 1
END
 