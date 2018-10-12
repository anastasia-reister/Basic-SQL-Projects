

PRINT 'Hello World'
DECLARE @myVariable INT 
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT CHAR(9) + 'I have ' + CONVERT(varchar(50),@var1)+ CHAR(13) + 'dollars...'


IF @var1 <= 3
	BEGIN
		PRINT 'Variable 1 <= ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
	END
ELSE IF @var1 > 1 AND @var1 <3
	BEGIN
		PRINT 'Variable 1 is not < ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
	END
ELSE 
	BEGIN
		PRINT 'Variable 1 is not < ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
	END

	/* This is a silent message */