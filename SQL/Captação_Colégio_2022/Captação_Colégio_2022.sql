SELECT
	DADOS.*,
	MC.META_2022,
	CONCAT(CAST((CAST(DADOS.MATRICULADOS2022 AS DECIMAL) / CAST(MC.META_2022 AS DECIMAL)) * 100 AS DECIMAL (10,1)), '%')  AS '% META'
FROM
(
	SELECT
		TAB1.CODTURMA,
		TAB1.TURMA,
		TAB2.MATRICULADOS2021,
		TAB1.MATRICULADOS2022
	FROM
	(
		SELECT DISTINCT
			CASE 
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim I' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim II' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim III' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='MATERNAL' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='BERÇÁRIO' THEN 'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 1' THEN 'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 2' THEN 'GRUPO 2'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 3' THEN 'GRUPO 3'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 4' THEN 'GRUPO 4'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 5' THEN 'GRUPO 5'
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='1º Ano' THEN 'ENS. FUND. I - 1º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='2º Ano' THEN 'ENS. FUND. I - 2º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='3º Ano' THEN 'ENS. FUND. I - 3º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='4º Ano' THEN 'ENS. FUND. I - 4º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='5º Ano' THEN 'ENS. FUND. I - 5º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='6º Ano' THEN 'ENS. FUND. II - 6º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='7º Ano' THEN 'ENS. FUND. II - 7º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='8º Ano' THEN 'ENS. FUND. II - 8º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='9º Ano' THEN 'ENS. FUND. II - 9º ANO '
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='1º Ano' THEN 'PRIMEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='2º Ano' THEN 'SEGUNDO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano' THEN 'TERCEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano - Noturno ' THEN 'EXTENSIVO'
				WHEN H.NOME = 'Extensivo' THEN 'EXTENSIVO'
				ELSE H.NOME
			END AS TURMA,
			CASE 
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim I'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim II'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim III'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='MATERNAL'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='BERÇÁRIO'			THEN 2 --'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 1'				THEN 2 --'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 2'				THEN 3 --'GRUPO 2'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 3'				THEN 4 --'GRUPO 3'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 4'				THEN 5 --'GRUPO 4'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 5'				THEN 6 --'GRUPO 5'
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='1º Ano'				THEN 7 --'ENS. FUND. I - 1º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='2º Ano'				THEN 8 --'ENS. FUND. I - 2º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='3º Ano'				THEN 9 --'ENS. FUND. I - 3º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='4º Ano'				THEN 10 --'ENS. FUND. I - 4º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='5º Ano'				THEN 11 --'ENS. FUND. I - 5º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='6º Ano'				THEN 12 --'ENS. FUND. II - 6º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='7º Ano'				THEN 13 --'ENS. FUND. II - 7º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='8º Ano'				THEN 14 --'ENS. FUND. II - 8º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='9º Ano'				THEN 15 --'ENS. FUND. II - 9º ANO '
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='1º Ano'				THEN 16 --'PRIMEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='2º Ano'				THEN 17 --'SEGUNDO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano'				THEN 18 --'TERCEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano - Noturno ' THEN   19 --'EXTENSIVO'
				WHEN H.NOME = 'Extensivo' THEN 19 --'EXTENSIVO'
				ELSE 0
			END AS CODTURMA,
			S.DESCRICAO AS STATUS,
			COUNT(PL.RA) AS MATRICULADOS2022
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
			LEFT JOIN CORPORE..SHABILITACAO H
				ON H.CODCOLIGADA = HF.CODCOLIGADA
				AND H.CODCURSO = HF.CODCURSO
				AND H.CODHABILITACAO = HF.CODHABILITACAO
		WHERE
			PL.CODCOLIGADA = 1
			AND P.CODPERLET = 'E2022'
			AND C.CODCURSO NOT IN('09', '50', '51')
			AND PL.CODSTATUS = 1
			AND CAST(PL.DTMATRICULA AS DATE) <= CAST(GETDATE() AS DATE) /* Compara Data VS Data */
		GROUP BY
			C.NOME,
			H.NOME,
			S.DESCRICAO
	) AS TAB1
	
	LEFT JOIN
	
	(
		SELECT DISTINCT
			CASE 
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim I' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim II' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim III' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='MATERNAL' THEN 'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='BERÇÁRIO' THEN 'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 1' THEN 'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 2' THEN 'GRUPO 2'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 3' THEN 'GRUPO 3'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 4' THEN 'GRUPO 4'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 5' THEN 'GRUPO 5'
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='1º Ano' THEN 'ENS. FUND. I - 1º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='2º Ano' THEN 'ENS. FUND. I - 2º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='3º Ano' THEN 'ENS. FUND. I - 3º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='4º Ano' THEN 'ENS. FUND. I - 4º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='5º Ano' THEN 'ENS. FUND. I - 5º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='6º Ano' THEN 'ENS. FUND. II - 6º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='7º Ano' THEN 'ENS. FUND. II - 7º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='8º Ano' THEN 'ENS. FUND. II - 8º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='9º Ano' THEN 'ENS. FUND. II - 9º ANO '
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='1º Ano' THEN 'PRIMEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='2º Ano' THEN 'SEGUNDO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano' THEN 'TERCEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano - Noturno ' THEN 'EXTENSIVO'
				WHEN H.NOME = 'Extensivo' THEN 'EXTENSIVO'
				WHEN H.NOME = 'Semi Extensivo' THEN 'EXTENSIVO'
				ELSE H.NOME
			END AS TURMA,
			CASE 
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim I'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim II'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='Jardim III'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='MATERNAL'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='BERÇÁRIO'			THEN 2 --'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 1'				THEN 2 --'BERÇARIO + GRUPO 1'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 2'				THEN 3 --'GRUPO 2'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 3'				THEN 4 --'GRUPO 3'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 4'				THEN 5 --'GRUPO 4'
				WHEN C.NOME ='Educação Infantil'                  AND H.NOME ='grupo 5'				THEN 6 --'GRUPO 5'
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='1º Ano'				THEN 7 --'ENS. FUND. I - 1º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='2º Ano'				THEN 8 --'ENS. FUND. I - 2º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='3º Ano'				THEN 9 --'ENS. FUND. I - 3º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='4º Ano'				THEN 10 --'ENS. FUND. I - 4º ANO '
				WHEN C.NOME ='Ensino Fundamental - 1º ao 5º ano ' AND H.NOME ='5º Ano'				THEN 11 --'ENS. FUND. I - 5º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='6º Ano'				THEN 12 --'ENS. FUND. II - 6º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='7º Ano'				THEN 13 --'ENS. FUND. II - 7º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='8º Ano'				THEN 14 --'ENS. FUND. II - 8º ANO '
				WHEN C.NOME ='Ensino Fundamental - 6º ao 9º ano ' AND H.NOME ='9º Ano'				THEN 15 --'ENS. FUND. II - 9º ANO '
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='1º Ano'				THEN 16 --'PRIMEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='2º Ano'				THEN 17 --'SEGUNDO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano'				THEN 18 --'TERCEIRO ANO'
				WHEN C.NOME ='Ensino Médio '                      AND H.NOME ='3º Ano - Noturno ' THEN   19 --'EXTENSIVO'
				WHEN H.NOME = 'Extensivo' THEN 19 --'EXTENSIVO'
				WHEN H.NOME = 'Semi Extensivo' THEN 19
				ELSE 0
			END AS CODTURMA,
			S.DESCRICAO AS STATUS,
			COUNT(PL.RA) AS MATRICULADOS2021
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
			LEFT JOIN CORPORE..SHABILITACAO H (NOLOCK)
				ON H.CODCOLIGADA = HF.CODCOLIGADA
				AND H.CODCURSO = HF.CODCURSO
				AND H.CODHABILITACAO = HF.CODHABILITACAO
		WHERE
			PL.CODCOLIGADA = 1
			AND P.CODPERLET = 'E2021'
			AND C.CODCURSO NOT IN('09', '50', '51')
			AND PL.CODSTATUS = 1
			AND CAST(PL.DTMATRICULA AS DATE) <= CAST(DATEADD(YEAR, -1, GETDATE()) AS DATE) /* Compara Data VS Data */
		GROUP BY
			C.NOME,
			H.NOME,
			S.DESCRICAO
	
	) AS TAB2
	ON TAB2.CODTURMA  = TAB1.CODTURMA

GROUP BY
	TAB1.TURMA,
	TAB1.CODTURMA,
	TAB1.MATRICULADOS2022,
	TAB2.MATRICULADOS2021) AS DADOS
	JOIN INTDATA..META_MATRICULAS_COLEGIO AS MC
		ON MC.CODTURMA = DADOS.CODTURMA
ORDER BY
	DADOS.CODTURMA



