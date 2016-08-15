BEGIN TRAN

SELECT  count(*) FROM    reasonCustomer

SELECT  * FROM    reasonCustomer ORDER BY racDate

SELECT  * FROM    reason
SELECT  count(*) FROM    recommended
SELECT  * FROM    assetLogUp
SELECT  * FROM    routeTracking
--random 
SELECT TOP 1 reaCode FROM reason ORDER BY NEWID()

--random customer
SELECT TOP 1 cusCode FROM customer ORDER BY NEWID()

--random route
SELECT TOP 1 rotCode FROM route ORDER BY NEWID() 
--random login
SELECT TOP 1 lgnCode FROM login ORDER BY NEWID()

--random login
SELECT TOP 1 jrnCode FROM journey ORDER BY NEWID()
--random product
SELECT TOP 1 proCode FROM product ORDER BY NEWID()
--random productUnit
SELECT TOP 1 untCode FROM unit ORDER BY NEWID()

--random bool
SELECT CASE WHEN rand()*10 < 5 THEN 0 ELSE 1 END

--random money
SELECT  cast(RAND()*10000 as MONEY)

--random int
SELECT  cast(RAND()*10000 as INT)


--random date
SELECT DateAdd(d, ROUND(DateDiff(d, '2010-01-01', '2016-12-31') * RAND(CHECKSUM(NEWID())), 0), DATEADD(second,CHECKSUM(NEWID())%48000, '2010-01-01'))
      
--SELECT DATEADD(day, (ABS(CHECKSUM(NEWID())) % 65530), 0)
--select RAND(), RAND()*10000, cast(cast(RAND()*100000 as int) as datetime)
--select cast(cast(RAND()*100000 as int) as datetime)
--select cast(cast(cast('1 Jan 2010' as datetime) as int) as datetime)
--Select cast(cast('1 Jan 2010' as datetime) as int)




ROLLBACK

