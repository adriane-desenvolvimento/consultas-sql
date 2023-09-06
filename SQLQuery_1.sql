SELECT SALUNO.RA,
       PPESSOA.NOME,
       SATIVIDADE.DESCRICAO                                                          AS ATIVIDADE,
       SATIVIDADEALUNO.OBSERVACAO                                                    AS OBS,
       ISNULL(Replace(CONVERT(MONEY, SATIVIDADEALUNO.CARGAHORARIAATV), '.', ':'), 0) AS HORAS,
       CONVERT(VARCHAR, SATIVIDADEALUNO.DATAINICIO, 103)                             AS INICIO,
       CONVERT(VARCHAR, SATIVIDADEALUNO.DATAFIM, 103)                                AS FINAL,
       SALUNO.RA,
       CASE
         WHEN SATIVIDADE.CODFILIAL = 1 THEN 'no Centro Universitário Atenas'
         WHEN SATIVIDADE.CODFILIAL = 2 THEN 'na Faculdade Atenas'
         WHEN SATIVIDADE.CODFILIAL = 3 THEN 'na Faculdade Atenas'
       END                                                                           AS FILIAL,
       CASE
         WHEN SATIVIDADE.CODFILIAL = 1 THEN 'Paracatu - MG, impresso em: '
         WHEN SATIVIDADE.CODFILIAL = 2 THEN 'Sete Lagoas - MG, impresso em: '
         WHEN SATIVIDADE.CODFILIAL = 3 THEN 'Passos - MG, impresso em: '
       END                                                                           AS ENDE,
       CASE
         WHEN SATIVIDADE.CODFILIAL = 1 THEN 'Centro Universitário Atenas'
         WHEN SATIVIDADE.CODFILIAL = 2 THEN 'Faculdade Atenas'
         WHEN SATIVIDADE.CODFILIAL = 3 THEN 'Faculdade Atenas'
       END                                                                           AS FILIAL2,
       CASE
         WHEN SATIVIDADE.CODFILIAL = 1 THEN 'Paracatu - MG, '
         WHEN SATIVIDADE.CODFILIAL = 2 THEN 'Sete Lagoas - MG, '
         WHEN SATIVIDADE.CODFILIAL = 3 THEN 'Passos - MG, '
       END                                                                           AS ENDERECO,
       CONCAT(Day (Getdate()), CASE
                                 WHEN Month (Getdate()) = 1 THEN CONCAT(' de Janeiro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 2 THEN CONCAT(' de Fevereiro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 3 THEN CONCAT(' de Março de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 4 THEN CONCAT(' de Abril de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 5 THEN CONCAT(' de Maio de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 6 THEN CONCAT(' de Junho de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 7 THEN CONCAT(' de Julho de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 8 THEN CONCAT(' de Agosto de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 9 THEN CONCAT(' de Setembro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 10 THEN CONCAT(' de Outubro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 11 THEN CONCAT(' de Novembro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 12 THEN CONCAT(' de Dezembro de ', Year(Getdate()), '.')
                               END)                                                  AS DTA
FROM   SATIVIDADEALUNO WITH (NOLOCK)
       JOIN SATIVIDADE (NOLOCK)
         ON SATIVIDADE.IDOFERTA = SATIVIDADEALUNO.IDOFERTA
            AND SATIVIDADE.CODCOLIGADA = SATIVIDADEALUNO.CODCOLIGADA
       JOIN SMODALIDADE (NOLOCK)
         ON SMODALIDADE.CODMODALIDADE = SATIVIDADEALUNO.CODMODALIDADE
            AND SMODALIDADE.CODCOMPONENTE = SATIVIDADEALUNO.CODCOMPONENTE
            AND SMODALIDADE.CODCOLIGADA = SATIVIDADEALUNO.CODCOLIGADA
            AND SMODALIDADE.CODMODALIDADE = SATIVIDADE.CODMODALIDADE
            AND SMODALIDADE.CODCOMPONENTE = SATIVIDADE.CODCOMPONENTE
            AND SMODALIDADE.CODCOLIGADA = SATIVIDADE.CODCOLIGADA
       JOIN SHABILITACAOALUNO (NOLOCK)
         ON SHABILITACAOALUNO.CODCOLIGADA = SATIVIDADEALUNO.CODCOLIGADA
            AND SHABILITACAOALUNO.IDHABILITACAOFILIAL = SATIVIDADEALUNO.IDHABILITACAOFILIAL
            AND SHABILITACAOALUNO.RA = SATIVIDADEALUNO.RA
       JOIN SALUNO(NOLOCK)
         ON SALUNO.RA = SHABILITACAOALUNO.RA
            AND SALUNO.CODCOLIGADA = SHABILITACAOALUNO.CODCOLIGADA
       JOIN PPESSOA (NOLOCK)
         ON PPESSOA.CODIGO = SALUNO.CODPESSOA
WHERE  /*SALUNO.RA = :RA1
       AND */SALUNO.CODCOLIGADA = 1
       AND SATIVIDADEALUNO.CUMPRIUATIVIDADE = 'S'
       AND SATIVIDADEALUNO.CODCOMPONENTE = 24
 AND SATIVIDADEALUNO.CODMODALIDADE = 42
