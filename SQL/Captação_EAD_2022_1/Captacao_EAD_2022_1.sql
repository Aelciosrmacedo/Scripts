SELECT
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO,
	SUM(TAB.EAD2021) AS EAD2021,
	SUM(TAB.EAD2022) AS EAD2022,
	'Data Comparativa' = FORMAT(DATEADD(YEAR, -1, GETDATE()), 'dd/MM/yyyy')
FROM
(
	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		'Geral' AS POLO,
		PL.RA,
		0 AS 'EAD2021',
		1 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2022/1 EAD'
		AND S.CODSTATUS = 17
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(GETDATE() AS DATE)

	UNION

	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		'Geral' AS POLO,
		PL.RA,
		1 AS 'EAD2021',
		0 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2021EAD'
		AND S.CODSTATUS NOT IN(38, 39)
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(DATEADD(YEAR, -1, GETDATE()) AS DATE)
) AS TAB
GROUP BY
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO
	
UNION

/* POLO CAMPO MOUR�O */
SELECT
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO,	
	SUM(TAB.EAD2021) AS EAD2021,
	SUM(TAB.EAD2022) AS EAD2022,
	'Data Comparativa' = FORMAT(DATEADD(YEAR, -1, GETDATE()), 'dd/MM/yyyy')
FROM
(
	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		CP.DESCRICAO AS POLO,
		PL.RA,
		0 AS 'EAD2021',
		1 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2022/1 EAD'
		AND CP.CODCAMPUS = '0001'
		AND S.CODSTATUS = 17
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(GETDATE() AS DATE)

	UNION

	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		CP.DESCRICAO AS POLO,
		PL.RA,
		1 AS 'EAD2021',
		0 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2021EAD'
		AND CP.CODCAMPUS = '0001' 
		AND S.CODSTATUS NOT IN(38, 39)
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(DATEADD(YEAR, -1, GETDATE()) AS DATE)
) AS TAB
GROUP BY
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO

UNION

/* POLO GOIOERE */
SELECT
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO,
	SUM(TAB.EAD2021) AS EAD2021,
	SUM(TAB.EAD2022) AS EAD2022,
	'Data Comparativa' = FORMAT(DATEADD(YEAR, -1, GETDATE()), 'dd/MM/yyyy')
FROM
(
	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		CP.DESCRICAO AS POLO,
		PL.RA,
		0 AS 'EAD2021',
		1 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2022/1 EAD'
		AND CP.CODCAMPUS = '0002'
		AND S.CODSTATUS = 17
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(GETDATE() AS DATE)

	UNION

	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		CP.DESCRICAO AS POLO,
		PL.RA,
		1 AS 'EAD2021',
		0 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2021EAD'
		AND CP.CODCAMPUS = '0002' 
		AND S.CODSTATUS NOT IN(38, 39)
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(DATEADD(YEAR, -1, GETDATE()) AS DATE)
) AS TAB
GROUP BY
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO

UNION

/* POLO TERRA BOA */
SELECT
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO,
	SUM(TAB.EAD2021) AS EAD2021,
	SUM(TAB.EAD2022) AS EAD2022,
	'Data Comparativa' = FORMAT(DATEADD(YEAR, -1, GETDATE()), 'dd/MM/yyyy')
FROM
(
	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		CP.DESCRICAO AS POLO,
		PL.RA,
		0 AS 'EAD2021',
		1 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2022/1 EAD'
		AND CP.CODCAMPUS = '0008'
		AND S.CODSTATUS = 17
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(GETDATE() AS DATE)

	UNION

	SELECT
		P.CODPERLET AS PERIODOLETIVO,
		C.CODCURSO,
		C.NOME AS CURSO,
		CP.DESCRICAO AS POLO,
		PL.RA,
		1 AS 'EAD2021',
		0 AS 'EAD2022'
	FROM
		Corpore..SMATRICPL PL (NOLOCK) 
		LEFT JOIN Corpore..SHABILITACAOALUNO HA (NOLOCK) 
			ON HA.CODCOLIGADA = PL.CODCOLIGADA
			AND HA.IDHABILITACAOFILIAL = PL.IDHABILITACAOFILIAL
			AND HA.RA = PL.RA
		LEFT JOIN Corpore..SHABILITACAOFILIAL HF (NOLOCK) 
			ON HF.CODCOLIGADA = HA.CODCOLIGADA
			AND HF.IDHABILITACAOFILIAL = HA.IDHABILITACAOFILIAL
		LEFT JOIN Corpore..SCURSO C (NOLOCK) 
			ON C.CODCOLIGADA = HF.CODCOLIGADA
			AND C.CODCURSO = HF.CODCURSO
		LEFT JOIN Corpore..SSTATUS S (NOLOCK) 
			ON S.CODCOLIGADA = PL.CODCOLIGADA
			AND S.CODSTATUS = PL.CODSTATUS
		LEFT JOIN Corpore..SPLETIVO P (NOLOCK)
			ON P.CODCOLIGADA = PL.CODCOLIGADA
			AND P.IDPERLET = PL.IDPERLET
		LEFT JOIN Corpore..STIPOINGRESSO TI (NOLOCK)
			ON TI.CODCOLIGADA = HA.CODCOLIGADA
			AND TI.CODTIPOINGRESSO = HA.CODTIPOINGRESSO
		LEFT JOIN Corpore..STIPOMATRICULA TM (NOLOCK)
			ON TM.CODCOLIGADA = PL.CODCOLIGADA
			AND TM.CODTIPOMAT = PL.CODTIPOMAT
		LEFT JOIN Corpore..SCAMPUS CP (NOLOCK)
			ON CP.CODCAMPUS = HA.CODCAMPUS
	WHERE
		PL.CODCOLIGADA = 1
		AND P.CODPERLET = '2021EAD'
		AND CP.CODCAMPUS = '0008' 
		AND S.CODSTATUS NOT IN(38, 39)
		AND TM.CODTIPOMAT IN(5, 6, 7, 8, 9, 11, 12, 13, 17, 19)
		AND CAST(PL.DTMATRICULA AS DATE) <= CAST(DATEADD(YEAR, -1, GETDATE()) AS DATE)
) AS TAB
GROUP BY
	TAB.CODCURSO,
	TAB.CURSO,
	TAB.POLO
ORDER BY
	TAB.POLO


