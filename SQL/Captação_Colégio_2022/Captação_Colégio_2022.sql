SELECT
	--DADOS.*,
	IIF(DADOS.TURMA IS NULL, 'Integral', DADOS.TURMA) AS TURMA,
	IIF(DADOS.MATRICULADOS2021 IS NULL, 0, DADOS.MATRICULADOS2021) AS Matriculados2021,
	IIF(DADOS.MATRICULADOS2022 IS NULL, 0, DADOS.MATRICULADOS2022) AS MMATRICULADOS2022,
	--DADOS.MATRICULADOS2022,
	MC.META_2022,
	CONCAT(CAST((CAST(DADOS.MATRICULADOS2022 AS DECIMAL) / CAST(MC.META_2022 AS DECIMAL)) * 100 AS DECIMAL (10,1)), '%')  AS '% META',
	'Data Comparativa' = FORMAT(DATEADD(YEAR, -1, GETDATE()), 'dd/MM/yyyy')
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
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim I' THEN 'Integral'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim II' THEN 'IntegralL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim III' THEN 'Integral'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='MATERNAL' THEN 'Integral'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='BER��RIO' THEN 'Ber��rio + Grupo 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 1' THEN 'Ber��rio + Grupo 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 2' THEN 'Grupo 2'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 3' THEN 'Grupo 3'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 4' THEN 'Grupo 4'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 5' THEN 'Grupo 5'
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='1� Ano' THEN 'Ens. Fund. I - 1� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='2� Ano' THEN 'Ens. Fund. I - 2� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='3� Ano' THEN 'Ens. Fund. I - 3� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='4� Ano' THEN 'Ens. Fund. I - 4� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='5� Ano' THEN 'Ens. Fund. I - 5� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='6� Ano' THEN 'Ens. Fund. II - 6� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='7� Ano' THEN 'Ens. Fund. II - 7� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='8� Ano' THEN 'Ens. Fund. II - 8� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='9� Ano' THEN 'Ens. Fund. II - 9� Ano '
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='1� Ano' THEN 'Primeiro Ano'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='2� Ano' THEN 'Segundo Ano'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano' THEN 'Terceiro Ano'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano - Noturno ' THEN 'Extensivo'
				WHEN H.NOME = 'Extensivo' THEN 'Extensivo'
				ELSE H.NOME
			END AS TURMA,
			CASE 
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim I'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim II'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim III'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='MATERNAL'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='BER��RIO'			THEN 2 --'BER�ARIO + GRUPO 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 1'				THEN 2 --'BER�ARIO + GRUPO 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 2'				THEN 3 --'GRUPO 2'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 3'				THEN 4 --'GRUPO 3'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 4'				THEN 5 --'GRUPO 4'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 5'				THEN 6 --'GRUPO 5'
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='1� Ano'				THEN 7 --'ENS. FUND. I - 1� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='2� Ano'				THEN 8 --'ENS. FUND. I - 2� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='3� Ano'				THEN 9 --'ENS. FUND. I - 3� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='4� Ano'				THEN 10 --'ENS. FUND. I - 4� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='5� Ano'				THEN 11 --'ENS. FUND. I - 5� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='6� Ano'				THEN 12 --'ENS. FUND. II - 6� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='7� Ano'				THEN 13 --'ENS. FUND. II - 7� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='8� Ano'				THEN 14 --'ENS. FUND. II - 8� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='9� Ano'				THEN 15 --'ENS. FUND. II - 9� ANO '
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='1� Ano'				THEN 16 --'PRIMEIRO ANO'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='2� Ano'				THEN 17 --'SEGUNDO ANO'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano'				THEN 18 --'TERCEIRO ANO'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano - Noturno ' THEN   19 --'EXTENSIVO'
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
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim I' THEN 'Integral'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim II' THEN 'Integral'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim III' THEN 'Integral'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='MATERNAL' THEN 'Integral'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='BER��RIO' THEN 'Ber��rio + Grupo 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 1' THEN 'Ber��rio + Grupo 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 2' THEN 'Grupo 2'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 3' THEN 'Grupo 3'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 4' THEN 'Grupo 4'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 5' THEN 'Grupo 5'
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='1� Ano' THEN 'Ens. Fund. I - 1� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='2� Ano' THEN 'Ens. Fund. I - 2� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='3� Ano' THEN 'Ens. Fund. I - 3� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='4� Ano' THEN 'Ens. Fund. I - 4� Ano '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='5� Ano' THEN 'Ens. Fund. I - 5� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='6� Ano' THEN 'Ens. Fund. II - 6� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='7� Ano' THEN 'Ens. Fund. II - 7� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='8� Ano' THEN 'Ens. Fund. II - 8� Ano '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='9� Ano' THEN 'Ens. Fund. II - 9� Ano '
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='1� Ano' THEN 'Primeiro Ano'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='2� Ano' THEN 'Segundo Ano'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano' THEN 'Terceiro Ano'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano - Noturno ' THEN 'EXTENSIVO'
				WHEN H.NOME = 'Extensivo' THEN 'EXTENSIVO'
				WHEN H.NOME = 'Semi Extensivo' THEN 'EXTENSIVO'
				ELSE H.NOME
			END AS TURMA,
			CASE 
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim I'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim II'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='Jardim III'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='MATERNAL'			THEN 1 --'INTEGRAL'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='BER��RIO'			THEN 2 --'BER�ARIO + GRUPO 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 1'				THEN 2 --'BER�ARIO + GRUPO 1'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 2'				THEN 3 --'GRUPO 2'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 3'				THEN 4 --'GRUPO 3'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 4'				THEN 5 --'GRUPO 4'
				WHEN C.NOME ='Educa��o Infantil'                  AND H.NOME ='grupo 5'				THEN 6 --'GRUPO 5'
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='1� Ano'				THEN 7 --'ENS. FUND. I - 1� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='2� Ano'				THEN 8 --'ENS. FUND. I - 2� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='3� Ano'				THEN 9 --'ENS. FUND. I - 3� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='4� Ano'				THEN 10 --'ENS. FUND. I - 4� ANO '
				WHEN C.NOME ='Ensino Fundamental - 1� ao 5� ano ' AND H.NOME ='5� Ano'				THEN 11 --'ENS. FUND. I - 5� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='6� Ano'				THEN 12 --'ENS. FUND. II - 6� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='7� Ano'				THEN 13 --'ENS. FUND. II - 7� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='8� Ano'				THEN 14 --'ENS. FUND. II - 8� ANO '
				WHEN C.NOME ='Ensino Fundamental - 6� ao 9� ano ' AND H.NOME ='9� Ano'				THEN 15 --'ENS. FUND. II - 9� ANO '
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='1� Ano'				THEN 16 --'PRIMEIRO ANO'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='2� Ano'				THEN 17 --'SEGUNDO ANO'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano'				THEN 18 --'TERCEIRO ANO'
				WHEN C.NOME ='Ensino M�dio '                      AND H.NOME ='3� Ano - Noturno ' THEN   19 --'EXTENSIVO'
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
	Right JOIN INTDATA..META_MATRICULAS_COLEGIO AS MC
		ON MC.CODTURMA = DADOS.CODTURMA
ORDER BY
	DADOS.CODTURMA



