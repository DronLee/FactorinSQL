-- Так как в постановке задачи не указаны типы полей, я предположил, что поле Date имеет тип date, а не строковый.
-- И поэтому работал с этим полей как с датой.
SELECT S2.[ClientName], S2.[Month], 
	(SELECT SUM(S3.[Amount]) FROM dbo.[Supply] S3 WHERE YEAR(S3.[Date]) = 2017 AND S3.[ClientName] = S2.[ClientName] AND MONTH(S3.[Date]) <= S2.[Month])  SumAmount
	FROM 
	(
		SELECT S1.[ClientName], MONTH(S1.[Date]) [Month]
			FROM dbo.[Supply] S1 WHERE YEAR(S1.[Date]) = 2017 GROUP BY S1.[ClientName], MONTH(S1.[Date])
	) S2 ORDER BY S2.[ClientName], S2.[Month]