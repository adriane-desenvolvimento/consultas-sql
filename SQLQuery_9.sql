SELECT CASE
         /*WHEN SHISTORICO.CODDISC = '0424' THEN Cast(2 AS VARCHAR)
         WHEN SHISTORICO.CODDISC = '0429' THEN Cast(3 AS VARCHAR)
         WHEN SHISTORICO.CODDISC = '0428/3' THEN Cast(4 AS VARCHAR)*/
         WHEN (SELECT SPERIODO.CODPERIODO
               FROM   SPERIODO
                      JOIN SDISCGRADE
                        ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                           AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                      JOIN SGRADE
                        ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                      JOIN SHABILITACAOFILIAL SH
                        ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SH.CODCURSO = SGRADE.CODCURSO
                           AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SH.CODGRADE = SGRADE.CODGRADE
               WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                      AND SH.CODCOLIGADA = SMATRICPL.CODCOLIGADA
                      AND SH.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL) = 0 THEN Cast(smatricpl.periodo AS VARCHAR)
         ELSE (SELECT SPERIODO.CODPERIODO
               FROM   SPERIODO
                      JOIN SDISCGRADE
                        ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                           AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                      JOIN SGRADE
                        ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                      JOIN SHABILITACAOFILIAL SH
                        ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SH.CODCURSO = SGRADE.CODCURSO
                           AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SH.CODGRADE = SGRADE.CODGRADE
               WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                      AND SH.CODCOLIGADA = SMATRICPL.CODCOLIGADA
                      AND SH.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL)
       END                                              ORDENACAO,
       CASE
         /*WHEN SHISTORICO.CODDISC = '0424' THEN Cast(2 AS VARCHAR) + 'º - ' + SHISTORICO.codperlet
         WHEN SHISTORICO.CODDISC = '0429' THEN Cast(3 AS VARCHAR) + 'º - ' + SHISTORICO.codperlet
         WHEN SHISTORICO.CODDISC = '0428/3' THEN Cast(4 AS VARCHAR) + 'º - ' + SHISTORICO.codperlet*/
         WHEN (SELECT SPERIODO.CODPERIODO
               FROM   SPERIODO
                      JOIN SDISCGRADE
                        ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                           AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                      JOIN SGRADE
                        ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                      JOIN SHABILITACAOFILIAL SH
                        ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SH.CODCURSO = SGRADE.CODCURSO
                           AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SH.CODGRADE = SGRADE.CODGRADE
               WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                      AND SH.CODCOLIGADA = SMATRICPL.CODCOLIGADA
                      AND SH.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL) = 0 THEN Cast(smatricpl.periodo AS VARCHAR)
                                                                                           + 'º - ' + SHISTORICO.codperlet
         ELSE (SELECT Cast(SPERIODO.CODPERIODO AS VARCHAR)
               FROM   SPERIODO
                      JOIN SDISCGRADE
                        ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                           AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                      JOIN SGRADE
                        ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                           AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                      JOIN SHABILITACAOFILIAL SH
                        ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                           AND SH.CODCURSO = SGRADE.CODCURSO
                           AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                           AND SH.CODGRADE = SGRADE.CODGRADE
               WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                      AND SH.CODCOLIGADA = SMATRICPL.CODCOLIGADA
                      AND SH.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL)
              + 'º - ' + SHISTORICO.codperlet
       END                                              periodo,
       CASE
         WHEN SHISTORICO.STATUS IS NULL THEN SHISTORICO.NOMEDISC + '*'
         ELSE SHISTORICO.NOMEDISC
       END                                              NOMEDISC,
       Replace(CONVERT(MONEY, SHISTORICO.CH), '.', ':') AS CH,
       CASE
         WHEN SHISTORICO.NOTAFINAL IS NULL THEN '-'
         ELSE Replace(Substring(CONVERT(VARCHAR, Round(SHISTORICO.NOTAFINAL, 1)), 1, Len(CONVERT(VARCHAR, Round(SHISTORICO.NOTAFINAL, 1))) - 3), '.', ',')
       END                                              'NOTAFINAL',
       CASE
         WHEN SHISTORICO.STATUS IS NULL THEN 'Dispensado'
         WHEN SHISTORICO.STATUS = 'Matriculado' THEN 'Cursando'
         ELSE SHISTORICO.STATUS
       END                                              'STATUS',
       CASE
         WHEN Substring(SHISTORICO.CODPERLET, 2, 1)IN ( '/', '-' ) THEN CONCAT(Substring(SHISTORICO.CODPERLET, 3, 4), '/', Substring(SHISTORICO.CODPERLET, 1, 1))
         ELSE CONCAT(Substring(SHISTORICO.CODPERLET, 1, 4), '/', Substring(SHISTORICO.CODPERLET, 6, 1))
       END                                              SEMESTRE
       /*substring(SHISTORICO.CODPERLET,3,10)+' / '+substring(SHISTORICO.CODPERLET,1,1) as semestre*/
       ,
       CASE
         WHEN SMATRICPL.CODFILIAL = 1 THEN 'Centro Universitário Atenas - UniAtenas'
         WHEN SMATRICPL.CODFILIAL = 2
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Faculdade Atenas Sete Lagoas - MG'
         WHEN SMATRICPL.CODFILIAL = 2
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01', '08', '09', '14' ) THEN 'Faculdade Atenas Centro de Minas – MG '
         WHEN SMATRICPL.CODFILIAL = 3
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Faculdade Atenas Passos - MG'
         WHEN SMATRICPL.CODFILIAL = 3
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Faculdade Atenas Sul de Minas - MG'
         WHEN SMATRICPL.CODFILIAL = 5
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Faculdade Atenas Valença - BA'
         WHEN SMATRICPL.CODFILIAL = 5
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Faculdade Atenas do Sul Baiano - BA'
         WHEN SMATRICPL.CODFILIAL = 6
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Faculdade Atenas Sorriso - MT'
         WHEN SMATRICPL.CODFILIAL = 6
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Faculdade Atenas Centro de Mato Grosso - MT'
         WHEN SMATRICPL.CODFILIAL = 7
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Faculdade Atenas Porto Seguro - BA'
       END                                              AS NOMEFILIAL
       /*,CASE
         	WHEN SMATRICPL.CODFILIAL = 1 THEN 'CNPJ: 01.428.030/0001-66'
         	WHEN SMATRICPL.CODFILIAL = 2 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03','10','12','17') THEN 'CNPJ: 01.428.030/0003-28'
       WHEN SMATRICPL.CODFILIAL = 2 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01','08','09','14') THEN 'Faculdade Atenas Centro de Minas – MG ' 
       WHEN SMATRICPL.CODFILIAL = 3 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03','10','12','17') THEN 'CNPJ: 01.428.030/0004-09' 
       WHEN SMATRICPL.CODFILIAL = 3 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01') THEN 'Faculdade Atenas Sul de Minas - MG' 
       WHEN SMATRICPL.CODFILIAL = 5 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03') THEN 'CNPJ: 01.428.030/0005-90' 
       WHEN SMATRICPL.CODFILIAL = 5 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01') THEN 'Faculdade Atenas do Sul Baiano - BA' 
       WHEN SMATRICPL.CODFILIAL = 6 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03') THEN 'CNPJ: 01.428.030/0006-70'
       WHEN SMATRICPL.CODFILIAL = 6 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01') THEN 'Faculdade Atenas Centro de Mato Grosso - MT' 
       WHEN SMATRICPL.CODFILIAL = 7 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03') THEN 'CNPJ: 01.428.030/0007-51' 
       	END                                                 AS CNPJFILIAL*/

       ,
       CASE
         WHEN SMATRICPL.CODFILIAL = 1 THEN 'Rua Euridamas Avelino de Barros, n° 1400 - Bairro Prado - Paracatu-MG - CEP:38.602-002'
         WHEN SMATRICPL.CODFILIAL = 2 THEN 'Avenida Prefeito Alberto Moura, n° 6000 - Distrito Industrial - Sete Lagoas-MG - CEP: 35701-383'
         WHEN SMATRICPL.CODFILIAL = 3 THEN 'Rua Oscar Cândido Monteiro, n° 1000 - Jardim Colégio de Passos - Atenas Passos-MG - CEP: 37900-380'
         WHEN SMATRICPL.CODFILIAL = 5 THEN 'Rua Cidade Salvador, n° 353 - Novo Horizonte - Valença-BA - CEP: 45400-000'
         WHEN SMATRICPL.CODFILIAL = 6 THEN 'Rua Estrada Vicinal, n° 199 - Area Expansão Urbana - Sorriso-MT - CEP: 78890-000'
         WHEN SMATRICPL.CODFILIAL = 7 THEN 'Avenida Principal, S/N, Quadra 0, Lote 04 - Porto Seguro-BA - CEP: 45810-000'
       END                                              AS ENDERECOFILIAL,
       CASE
         WHEN SMATRICPL.CODFILIAL = 1 THEN 'Telefone: (38) 3672-3737    e-mail: faculdade@atenas.edu.br'
         WHEN SMATRICPL.CODFILIAL = 2 THEN 'Telefone: (31) 3509-2000    e-mail: faculdade@atenas.edu.br'
         WHEN SMATRICPL.CODFILIAL = 3 THEN 'Telefone: (35) 3115-1200    e-mail: faculdade@atenas.edu.br'
         WHEN SMATRICPL.CODFILIAL = 5 THEN 'Telefone: (75) 9863-1187    e-mail: faculdade@atenas.edu.br'
         WHEN SMATRICPL.CODFILIAL = 6 THEN 'Telefone: (66) 3907-9950    e-mail: faculdade@atenas.edu.br'
         WHEN SMATRICPL.CODFILIAL = 7 THEN 'Telefone: (73) 99871-2437    e-mail: faculdade@atenas.edu.br'
       END                                              AS CONTATOFILIAL,
       CASE
         WHEN SMATRICPL.CODFILIAL = 1 THEN 'Paracatu - MG, impresso em: '
         WHEN SMATRICPL.CODFILIAL = 2 THEN 'Sete Lagoas - MG, impresso em: '
         WHEN SMATRICPL.CODFILIAL = 3 THEN 'Passos - MG, impresso em: '
         WHEN SMATRICPL.CODFILIAL = 5 THEN 'Valença - BA, impresso em: '
         WHEN SMATRICPL.CODFILIAL = 6 THEN 'Sorriso - MT, impresso em: '
         WHEN SMATRICPL.CODFILIAL = 7 THEN 'Porto Seguro - BA, impresso em: '
       END                                              AS ENDERECO,
       CONCAT(Day (Getdate()), CASE
                                 WHEN Month (Getdate()) = 1 THEN CONCAT(' de janeiro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 2 THEN CONCAT(' de fevereiro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 3 THEN CONCAT(' de marco de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 4 THEN CONCAT(' de abril de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 5 THEN CONCAT(' de maio de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 6 THEN CONCAT(' de junho de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 7 THEN CONCAT(' de julho de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 8 THEN CONCAT(' de agosto de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 9 THEN CONCAT(' de setembro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 10 THEN CONCAT(' de outubro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 11 THEN CONCAT(' de novembro de ', Year(Getdate()), '.')
                                 WHEN Month (Getdate()) = 12 THEN CONCAT(' de dezembro de ', Year(Getdate()), '.')
                               END)                     AS DTA,
       TITULACAO,
       CASE
         WHEN SMATRICPL.CODFILIAL = 1 THEN (SELECT SF.DESCJUNTODELEG
                                            FROM   SFILIAL SF(NOLOCK)
                                            WHERE  SF.CODFILIAL = SMATRICPL.CODFILIAL
                                                   AND SF.CODCOLIGADA = SMATRICPL.CODCOLIGADA) /*PARACATU*/
         WHEN SMATRICPL.CODFILIAL = 2
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Credenciada pela Portaria Nº 1.600, de 28 de dezembro de 2017, publicado no Diário Oficial da União – Seção 1 página 20 em 29 de dezembro de 2017.'/*Faculdade Atenas Sete Lagoas - MG*/
         WHEN SMATRICPL.CODFILIAL = 2
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01', '08', '09', '14' ) THEN 'Credenciada pela Portaria Nº 653, de 12 de agosto de 2020, publicado no Diário Oficial da União – Seção 1 página 54 em 13 de agosto de 2020.' /*Faculdade Atenas Centro de Minas – MG (Sete Lagoas)*/
         WHEN SMATRICPL.CODFILIAL = 3
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Credenciada pela Portaria Nº 311, de 04 de abril de 2018, publicado no Diário Oficial da União – Seção 1 página 12 em 05 de abril de 2018.' /*Faculdade Atenas Passos - MG*/
         WHEN SMATRICPL.CODFILIAL = 3
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Credenciada pela Portaria Nº 483, de 07 de julho de 2021, publicado no Diário Oficial da União – Seção 1 página 104 em 08 de julho de 2021.' /*Faculdade Atenas Sul de Minas – MG (Passos)*/
         WHEN SMATRICPL.CODFILIAL = 5
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Credenciada pela Portaria Nº 173, de 26 de março de 2021, publicado no Diário Oficial da União – Seção 1 página 85 em 29 de março de 2021.' /*Faculdade Atenas Valença - BA*/
         WHEN SMATRICPL.CODFILIAL = 5
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Credenciada pela Portaria Nº 1.017, de 16 de dezembro de 2022, publicado no Diário Oficial da União – Seção 1 página 138 em 20 de dezembro de 2022.' /*Faculdade Atenas do Sul Baiano – BA(Valença)*/
         WHEN SMATRICPL.CODFILIAL = 6
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Credenciada pela Portaria Nº 76, de 09 de fevereiro de 2022, publicado no Diário Oficial da União – Seção 1 página 63 em 10 de fevereiro de 2022.'/*Faculdade Atenas Sorriso - MT*/
         WHEN SMATRICPL.CODFILIAL = 6
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Credenciada pela Portaria Nº 849, de 08 de novembro de 2022, publicado no Diário Oficial da União – Seção 1 página 52 em 09 de novembro de 2022.' /*Faculdade Atenas Centro de Mato Grosso – MT(Sorriso)*/
         WHEN SMATRICPL.CODFILIAL = 7
              AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                   FROM   SMATRICPL SM
                          JOIN SHABILITACAOFILIAL
                            ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                               AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                   WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Credenciada pela Portaria Nº 489, de 14 de julho de 2022, publicado no Diário Oficial da União – Seção 1 página 81 em 15 de julho de 2022.' /*Faculdade Atenas Porto Seguro - BA*/
       END                                              AS DESCJUNTODELEG
FROM   shistorico (NOLOCK)
       JOIN smatricpl (NOLOCK)
         ON smatricpl.codcoligada = shistorico.codcoligada
            AND smatricpl.idperlet = shistorico.idperlet
            AND smatricpl.idhabilitacaofilial = shistorico.idhabilitacaofilial
            AND smatricpl.ra = shistorico.ra
       LEFT JOIN PROFESSOR_VERSUS_TITULACAO PF (NOLOCK)
              ON SHISTORICO.IDTURMADISC = PF.IDTURMADISC
                 AND SHISTORICO.CODCOLIGADA = PF.CODCOLIGADA
                 AND SHISTORICO.IDPERLET = PF.IDPERLET
       JOIN SHABILITACAOALUNO(NOLOCK)
         ON SHABILITACAOALUNO.CODCOLIGADA = SMATRICPL.CODCOLIGADA
            AND SHABILITACAOALUNO.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL
            AND SHABILITACAOALUNO.RA = SMATRICPL.RA
       LEFT JOIN SHABILITACAOFILIAL(NOLOCK)
              ON SHABILITACAOFILIAL.CODCOLIGADA = SHABILITACAOALUNO.CODCOLIGADA
                 AND SHABILITACAOFILIAL.IDHABILITACAOFILIAL = SHABILITACAOALUNO.IDHABILITACAOFILIAL
WHERE  shistorico.ra = '19-2-14871'
       /*AND SHISTORICO.CODSTATUS != 13*/
       /*AND shistorico.idhabilitacaofilial = :IDHABILITACAOFILIAL1*/
       AND SHABILITACAOFILIAL.CODCURSO = '12'
       AND smatricpl.codfilial = 01
       /*AND SHABILITACAOALUNO.CODSTATUS NOT IN( 26 )*/
       AND SMATRICPL.CODSTATUS NOT IN ( 28 )
       AND SHISTORICO.CODSTATUS NOT IN ( 10, 21, 23, 16,
                                         53, 15 )
       /*AND SHISTORICO.CODDISC NOT IN('0584/2',
'0150',
'0434/2',
'0555',
'0556',
'0151',
'0575')*/
       /*LINHA ABAIXO PARA TRAZER SOMENTE AS DISICIPLINAS QUE FAZEM PARTE DA MATRIZ DO ALUNO*/
       AND SHISTORICO.CODDISC IN (SELECT SDISCGRADE.CODDISC
                                  FROM   SPERIODO
                                         JOIN SDISCGRADE
                                           ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                                              AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                                              AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                                              AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                                              AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                                         JOIN SGRADE
                                           ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                                              AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                                              AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                                              AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                                         JOIN SHABILITACAOFILIAL SH
                                           ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                                              AND SH.CODCURSO = SGRADE.CODCURSO
                                              AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                                              AND SH.CODGRADE = SGRADE.CODGRADE
                                  WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                                         AND SH.CODCOLIGADA = SMATRICPL.CODCOLIGADA
                                         AND SH.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL)

UNION
SELECT
/*(SELECT TOP 1  SPERIODO.CODPERIODO 
		FROM 
			SPERIODO
			JOIN SDISCGRADE ON  SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE AND SPERIODO.CODPERIODO =  SDISCGRADE.CODPERIODO
			JOIN SGRADE ON  SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA AND SPERIODO.CODCURSO = SGRADE.CODCURSO AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO AND SPERIODO.CODGRADE = SGRADE.CODGRADE
			JOIN SHABILITACAOFILIAL SH ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA AND SH.CODCURSO = SGRADE.CODCURSO AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO AND SH.CODGRADE = SGRADE.CODGRADE
			
		WHERE SHISTORICO.CODDISC = SDISCGRADE.CODDISC
		AND SHISTORICO.IDHABILITACAOFILIAL = SH.IDHABILITACAOFILIAL) 
		as ORDENACAO,

		    
  CASE 
   WHEN SHISTORICO.STATUS IS NULL THEN (SELECT TOP 1  CAST(SPERIODO.CODPERIODO AS VARCHAR)
		FROM 
			SPERIODO
			JOIN SDISCGRADE ON  SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE AND SPERIODO.CODPERIODO =  SDISCGRADE.CODPERIODO
			JOIN SGRADE ON  SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA AND SPERIODO.CODCURSO = SGRADE.CODCURSO AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO AND SPERIODO.CODGRADE = SGRADE.CODGRADE
			JOIN SHABILITACAOFILIAL SH ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA AND SH.CODCURSO = SGRADE.CODCURSO AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO AND SH.CODGRADE = SGRADE.CODGRADE
			
		WHERE SHISTORICO.CODDISC = SDISCGRADE.CODDISC
		AND SHISTORICO.IDHABILITACAOFILIAL = SH.IDHABILITACAOFILIAL) + 'º - ' + SHISTORICO.codperlet
		END periodo,*/ CASE
                   WHEN SHISTORICO.STATUS IS NULL
                        AND (SELECT TOP 1 Cast(SPERIODO.CODPERIODO AS VARCHAR)
                             FROM   SPERIODO
                                    JOIN SDISCGRADE
                                      ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                                         AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                                         AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                                         AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                                         AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                                    JOIN SGRADE
                                      ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                                         AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                                         AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                                         AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                                    JOIN SHABILITACAOFILIAL SH
                                      ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                                         AND SH.CODCURSO = SGRADE.CODCURSO
                                         AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                                         AND SH.CODGRADE = SGRADE.CODGRADE
                             WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                                    AND SHISTORICO.IDHABILITACAOFILIAL = SH.IDHABILITACAOFILIAL) = 0 THEN (SELECT Cast(SHISTDISCFAC.OBS AS VARCHAR)
                                                                                                           FROM   SHISTDISCFAC
                                                                                                           WHERE  SHISTORICO.CODDISC = SHISTDISCFAC.CODDISC
                                                                                                                  AND SHISTORICO.IDHABILITACAOFILIAL = SHISTDISCFAC.IDHABILITACAOFILIAL
                                                                                                                  AND SHISTORICO.RA = SHISTDISCFAC.RA)
                   WHEN SHISTORICO.STATUS IS NULL THEN (SELECT TOP 1 Cast(SPERIODO.CODPERIODO AS VARCHAR)
                                                        FROM   SPERIODO
                                                               JOIN SDISCGRADE
                                                                 ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                                                                    AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                                                                    AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                                                                    AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                                                                    AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                                                               JOIN SGRADE
                                                                 ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                                                                    AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                                                                    AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                                                                    AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                                                               JOIN SHABILITACAOFILIAL SH
                                                                 ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                                                                    AND SH.CODCURSO = SGRADE.CODCURSO
                                                                    AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                                                                    AND SH.CODGRADE = SGRADE.CODGRADE
                                                        WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                                                               AND SHISTORICO.IDHABILITACAOFILIAL = SH.IDHABILITACAOFILIAL)
                 END                                              ORDERNACAO,
                 CASE
                   WHEN SHISTORICO.STATUS IS NULL
                        AND (SELECT TOP 1 Cast(SPERIODO.CODPERIODO AS VARCHAR)
                             FROM   SPERIODO
                                    JOIN SDISCGRADE
                                      ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                                         AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                                         AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                                         AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                                         AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                                    JOIN SGRADE
                                      ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                                         AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                                         AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                                         AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                                    JOIN SHABILITACAOFILIAL SH
                                      ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                                         AND SH.CODCURSO = SGRADE.CODCURSO
                                         AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                                         AND SH.CODGRADE = SGRADE.CODGRADE
                             WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                                    AND SHISTORICO.IDHABILITACAOFILIAL = SH.IDHABILITACAOFILIAL) = 0 THEN (SELECT Cast(SHISTDISCFAC.OBS AS VARCHAR)
                                                                                                           FROM   SHISTDISCFAC
                                                                                                           WHERE  SHISTORICO.CODDISC = SHISTDISCFAC.CODDISC
                                                                                                                  AND SHISTORICO.IDHABILITACAOFILIAL = SHISTDISCFAC.IDHABILITACAOFILIAL
                                                                                                                  AND SHISTORICO.RA = SHISTDISCFAC.RA)
                                                                                                          + 'º - ' + SHISTORICO.codperlet
                   WHEN SHISTORICO.STATUS IS NULL THEN (SELECT TOP 1 Cast(SPERIODO.CODPERIODO AS VARCHAR)
                                                        FROM   SPERIODO
                                                               JOIN SDISCGRADE
                                                                 ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                                                                    AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                                                                    AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                                                                    AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                                                                    AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                                                               JOIN SGRADE
                                                                 ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                                                                    AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                                                                    AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                                                                    AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                                                               JOIN SHABILITACAOFILIAL SH
                                                                 ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                                                                    AND SH.CODCURSO = SGRADE.CODCURSO
                                                                    AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                                                                    AND SH.CODGRADE = SGRADE.CODGRADE
                                                        WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC
                                                               AND SHISTORICO.IDHABILITACAOFILIAL = SH.IDHABILITACAOFILIAL)
                                                       + 'º - ' + SHISTORICO.codperlet
                 END                                              periodo,
                 CASE
                   WHEN SHISTORICO.STATUS IS NULL THEN SHISTORICO.NOMEDISC + '*'
                   ELSE SHISTORICO.NOMEDISC
                 END                                              NOMEDISC,
                 Replace(CONVERT(MONEY, SHISTORICO.CH), '.', ':') AS CH,
                 CASE
                   WHEN SHISTORICO.NOTAFINAL IS NULL THEN '-'
                   ELSE Replace(Substring(CONVERT(VARCHAR, Round(SHISTORICO.NOTAFINAL, 1)), 1, Len(CONVERT(VARCHAR, Round(SHISTORICO.NOTAFINAL, 1))) - 3), '.', ',')
                 END                                              'NOTAFINAL',
                 CASE
                   WHEN SHISTORICO.STATUS IS NULL THEN (SELECT SSTATUS.DESCRICAO
                                                        FROM   SHISTDISCFAC
                                                               JOIN SSTATUS
                                                                 ON SHISTDISCFAC.CODCOLIGADA = SSTATUS.CODCOLIGADA
                                                                    AND SHISTDISCFAC.CODSTATUS = SSTATUS.CODSTATUS
                                                        WHERE  RA = SHISTORICO.RA
                                                               AND CODDISC = SHISTORICO.CODDISC)
                   WHEN SHISTORICO.CODDISC = (SELECT CODDISC
                                              FROM   SHISTDISCFAC
                                              WHERE  RA = SHISTORICO.RA
                                                     AND CODDISC = SHISTORICO.CODDISC) THEN (SELECT SSTATUS.DESCRICAO
                                                                                             FROM   SHISTDISCFAC
                                                                                                    JOIN SSTATUS
                                                                                                      ON SHISTDISCFAC.CODCOLIGADA = SSTATUS.CODCOLIGADA
                                                                                                         AND SHISTDISCFAC.CODSTATUS = SSTATUS.CODSTATUS
                                                                                             WHERE  RA = SHISTORICO.RA
                                                                                                    AND CODDISC = SHISTORICO.CODDISC)
                   WHEN SHISTORICO.STATUS = 'Matriculado' THEN 'Cursando'
                   ELSE SHISTORICO.STATUS
                 END                                              'STATUS',
                 CASE
                   WHEN Substring(SHISTORICO.CODPERLET, 2, 1)IN ( '/', '-' ) THEN CONCAT(Substring(SHISTORICO.CODPERLET, 3, 4), '/', Substring(SHISTORICO.CODPERLET, 1, 1))
                   ELSE CONCAT(Substring(SHISTORICO.CODPERLET, 1, 4), '/', Substring(SHISTORICO.CODPERLET, 6, 1))
                 END                                              SEMESTRE,
                 CASE
                   WHEN SMATRICPL.CODFILIAL = 1 THEN 'Centro Universitário Atenas - UniAtenas'
                   WHEN SMATRICPL.CODFILIAL = 2
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Faculdade Atenas Sete Lagoas - MG'
                   WHEN SMATRICPL.CODFILIAL = 2
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01', '08', '09', '14' ) THEN 'Faculdade Atenas Centro de Minas – MG '
                   WHEN SMATRICPL.CODFILIAL = 3
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Faculdade Atenas Passos - MG'
                   WHEN SMATRICPL.CODFILIAL = 3
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Faculdade Atenas Sul de Minas - MG'
                   WHEN SMATRICPL.CODFILIAL = 5
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Faculdade Atenas Valença - BA'
                   WHEN SMATRICPL.CODFILIAL = 5
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Faculdade Atenas do Sul Baiano - BA'
                   WHEN SMATRICPL.CODFILIAL = 6
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Faculdade Atenas Sorriso - MT'
                   WHEN SMATRICPL.CODFILIAL = 6
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Faculdade Atenas Centro de Mato Grosso - MT'
                   WHEN SMATRICPL.CODFILIAL = 7
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Faculdade Atenas Porto Seguro - BA'
                 END                                              AS NOMEFILIAL
                 /*,CASE
                 	WHEN SMATRICPL.CODFILIAL = 1 THEN 'CNPJ: 01.428.030/0001-66'
                 	WHEN SMATRICPL.CODFILIAL = 2 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03','10','12','17') THEN 'CNPJ: 01.428.030/0003-28'
                 WHEN SMATRICPL.CODFILIAL = 2 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01','08','09','14') THEN 'Faculdade Atenas Centro de Minas – MG ' 
                 WHEN SMATRICPL.CODFILIAL = 3 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03','10','12','17') THEN 'CNPJ: 01.428.030/0004-09' 
                 WHEN SMATRICPL.CODFILIAL = 3 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01') THEN 'Faculdade Atenas Sul de Minas - MG' 
                 WHEN SMATRICPL.CODFILIAL = 5 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03') THEN 'CNPJ: 01.428.030/0005-90' 
                 WHEN SMATRICPL.CODFILIAL = 5 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01') THEN 'Faculdade Atenas do Sul Baiano - BA' 
                 WHEN SMATRICPL.CODFILIAL = 6 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03') THEN 'CNPJ: 01.428.030/0006-70'
                 WHEN SMATRICPL.CODFILIAL = 6 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('01') THEN 'Faculdade Atenas Centro de Mato Grosso - MT' 
                 WHEN SMATRICPL.CODFILIAL = 7 AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO FROM SMATRICPL SM JOIN SHABILITACAOFILIAL ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL WHERE SM.RA = SMATRICPL.RA) IN ('03') THEN 'CNPJ: 01.428.030/0007-51' 
                 END                                                 AS CNPJFILIAL*/

                 ,
                 CASE
                   WHEN SMATRICPL.CODFILIAL = 1 THEN 'Rua Euridamas Avelino de Barros, n° 1400 - Bairro Prado - Paracatu-MG - CEP:38.602-002'
                   WHEN SMATRICPL.CODFILIAL = 2 THEN 'Avenida Prefeito Alberto Moura, n° 6000 - Distrito Industrial - Sete Lagoas-MG - CEP: 35701-383'
                   WHEN SMATRICPL.CODFILIAL = 3 THEN 'Rua Oscar Cândido Monteiro, n° 1000 - Jardim Colégio de Passos - Atenas Passos-MG - CEP: 37900-380'
                   WHEN SMATRICPL.CODFILIAL = 5 THEN 'Rua Cidade Salvador, n° 353 - Novo Horizonte - Valença-BA - CEP: 45400-000'
                   WHEN SMATRICPL.CODFILIAL = 6 THEN 'Rua Estrada Vicinal, n° 199 - Area Expansão Urbana - Sorriso-MT - CEP: 78890-000'
                   WHEN SMATRICPL.CODFILIAL = 7 THEN 'Avenida Principal, S/N, Quadra 0, Lote 04 - Porto Seguro-BA - CEP: 45810-000'
                 END                                              AS ENDERECOFILIAL,
                 CASE
                   WHEN SMATRICPL.CODFILIAL = 1 THEN 'Telefone: (38) 3672-3737    e-mail: faculdade@atenas.edu.br'
                   WHEN SMATRICPL.CODFILIAL = 2 THEN 'Telefone: (31) 3509-2000    e-mail: faculdade@atenas.edu.br'
                   WHEN SMATRICPL.CODFILIAL = 3 THEN 'Telefone: (35) 3115-1200    e-mail: faculdade@atenas.edu.br'
                   WHEN SMATRICPL.CODFILIAL = 5 THEN 'Telefone: (75) 9863-1187    e-mail: faculdade@atenas.edu.br'
                   WHEN SMATRICPL.CODFILIAL = 6 THEN 'Telefone: (66) 3907-9950    e-mail: faculdade@atenas.edu.br'
                   WHEN SMATRICPL.CODFILIAL = 7 THEN 'Telefone: (73) 99871-2437    e-mail: faculdade@atenas.edu.br'
                 END                                              AS CONTATOFILIAL,
                 CASE
                   WHEN SMATRICPL.CODFILIAL = 1 THEN 'Paracatu - MG, impresso em: '
                   WHEN SMATRICPL.CODFILIAL = 2 THEN 'Sete Lagoas - MG, impresso em: '
                   WHEN SMATRICPL.CODFILIAL = 3 THEN 'Passos - MG, impresso em: '
                   WHEN SMATRICPL.CODFILIAL = 5 THEN 'Valença - BA, impresso em: '
                   WHEN SMATRICPL.CODFILIAL = 6 THEN 'Sorriso - MT, impresso em: '
                   WHEN SMATRICPL.CODFILIAL = 7 THEN 'Porto Seguro - BA, impresso em: '
                 END                                              AS ENDERECO,
                 CONCAT(Day (Getdate()), CASE
                                           WHEN Month (Getdate()) = 1 THEN CONCAT(' de janeiro de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 2 THEN CONCAT(' de fevereiro de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 3 THEN CONCAT(' de marco de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 4 THEN CONCAT(' de abril de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 5 THEN CONCAT(' de maio de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 6 THEN CONCAT(' de junho de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 7 THEN CONCAT(' de julho de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 8 THEN CONCAT(' de agosto de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 9 THEN CONCAT(' de setembro de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 10 THEN CONCAT(' de outubro de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 11 THEN CONCAT(' de novembro de ', Year(Getdate()), '.')
                                           WHEN Month (Getdate()) = 12 THEN CONCAT(' de dezembro de ', Year(Getdate()), '.')
                                         END)                     AS DTA,
                 TITULACAO,
                 CASE
                   WHEN SMATRICPL.CODFILIAL = 1 THEN (SELECT SF.DESCJUNTODELEG
                                                      FROM   SFILIAL SF(NOLOCK)
                                                      WHERE  SF.CODFILIAL = SMATRICPL.CODFILIAL
                                                             AND SF.CODCOLIGADA = SMATRICPL.CODCOLIGADA) /*PARACATU*/
                   WHEN SMATRICPL.CODFILIAL = 2
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Credenciada pela Portaria Nº 1.600, de 28 de dezembro de 2017, publicado no Diário Oficial da União – Seção 1 página 20 em 29 de dezembro de 2017.'/*Faculdade Atenas Sete Lagoas - MG*/
                   WHEN SMATRICPL.CODFILIAL = 2
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01', '08', '09', '14' ) THEN 'Credenciada pela Portaria Nº 653, de 12 de agosto de 2020, publicado no Diário Oficial da União – Seção 1 página 54 em 13 de agosto de 2020.' /*Faculdade Atenas Centro de Minas – MG (Sete Lagoas)*/
                   WHEN SMATRICPL.CODFILIAL = 3
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03', '10', '12', '17' ) THEN 'Credenciada pela Portaria Nº 311, de 04 de abril de 2018, publicado no Diário Oficial da União – Seção 1 página 12 em 05 de abril de 2018.' /*Faculdade Atenas Passos - MG*/
                   WHEN SMATRICPL.CODFILIAL = 3
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Credenciada pela Portaria Nº 483, de 07 de julho de 2021, publicado no Diário Oficial da União – Seção 1 página 104 em 08 de julho de 2021.' /*Faculdade Atenas Sul de Minas – MG (Passos)*/
                   WHEN SMATRICPL.CODFILIAL = 5
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Credenciada pela Portaria Nº 173, de 26 de março de 2021, publicado no Diário Oficial da União – Seção 1 página 85 em 29 de março de 2021.' /*Faculdade Atenas Valença - BA*/
                   WHEN SMATRICPL.CODFILIAL = 5
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Credenciada pela Portaria Nº 1.017, de 16 de dezembro de 2022, publicado no Diário Oficial da União – Seção 1 página 138 em 20 de dezembro de 2022.' /*Faculdade Atenas do Sul Baiano – BA(Valença)*/
                   WHEN SMATRICPL.CODFILIAL = 6
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Credenciada pela Portaria Nº 76, de 09 de fevereiro de 2022, publicado no Diário Oficial da União – Seção 1 página 63 em 10 de fevereiro de 2022.'/*Faculdade Atenas Sorriso - MT*/
                   WHEN SMATRICPL.CODFILIAL = 6
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '01' ) THEN 'Credenciada pela Portaria Nº 849, de 08 de novembro de 2022, publicado no Diário Oficial da União – Seção 1 página 52 em 09 de novembro de 2022.' /*Faculdade Atenas Centro de Mato Grosso – MT(Sorriso)*/
                   WHEN SMATRICPL.CODFILIAL = 7
                        AND (SELECT DISTINCT SHABILITACAOFILIAL.CODCURSO
                             FROM   SMATRICPL SM
                                    JOIN SHABILITACAOFILIAL
                                      ON SM.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
                                         AND SM.IDHABILITACAOFILIAL = SHABILITACAOFILIAL.IDHABILITACAOFILIAL
                             WHERE  SM.RA = SMATRICPL.RA) IN ( '03' ) THEN 'Credenciada pela Portaria Nº 489, de 14 de julho de 2022, publicado no Diário Oficial da União – Seção 1 página 81 em 15 de julho de 2022.' /*Faculdade Atenas Porto Seguro - BA*/
                 END                                              AS DESCJUNTODELEG
FROM   shistorico (NOLOCK)
       LEFT JOIN smatricpl (NOLOCK)
              ON smatricpl.codcoligada = shistorico.codcoligada
                 AND smatricpl.idperlet = shistorico.idperlet
                 AND smatricpl.idhabilitacaofilial = shistorico.idhabilitacaofilial
                 AND smatricpl.ra = shistorico.ra
       LEFT JOIN PROFESSOR_VERSUS_TITULACAO_APROVEITA PF (NOLOCK)
              ON SHISTORICO.CODDISC = PF.CODDISC
                 AND SHISTORICO.CODCOLIGADA = PF.CODCOLIGADA
                 AND SHISTORICO.IDPERLET = PF.IDPERLET
                 AND SHISTORICO.IDHABILITACAOFILIAL = PF.IDHABILITACAOFILIAL
       JOIN SHABILITACAOALUNO(NOLOCK)
         ON SHABILITACAOALUNO.CODCOLIGADA = SMATRICPL.CODCOLIGADA
            AND SHABILITACAOALUNO.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL
            AND SHABILITACAOALUNO.RA = SMATRICPL.RA
       LEFT JOIN SHABILITACAOFILIAL(NOLOCK)
              ON SHABILITACAOFILIAL.CODCOLIGADA = SHABILITACAOALUNO.CODCOLIGADA
                 AND SHABILITACAOFILIAL.IDHABILITACAOFILIAL = SHABILITACAOALUNO.IDHABILITACAOFILIAL
WHERE  shistorico.ra = '19-2-14871'
       AND SHABILITACAOFILIAL.CODCURSO = '12'
       AND smatricpl.codfilial = 01
       AND SMATRICPL.CODSTATUS NOT IN ( 28, 10, 21, 23,
                                        16, 53, 15 )
       /*AND SHABILITACAOALUNO.CODSTATUS NOT IN( 26 )*/
       /*AND smatricpl.codfilial =:$CODFILIAL
       AND SMATRICPL.CODSTATUS NOT IN ( 28 )*/
       AND SHISTORICO.CODSTATUS IS NULL
/*AND SHISTORICO.CODDISC NOT IN( '0584/2',
'0150',
'0434/2',
'0555',
'0556',
'0151',
'0575' )*/
AND SHISTORICO.CODDISC IN (SELECT SDISCGRADE.CODDISC
                           FROM   SPERIODO
                                  JOIN SDISCGRADE
                                    ON SPERIODO.CODCOLIGADA = SDISCGRADE.CODCOLIGADA
                                       AND SPERIODO.CODCURSO = SDISCGRADE.CODCURSO
                                       AND SPERIODO.CODHABILITACAO = SDISCGRADE.CODHABILITACAO
                                       AND SPERIODO.CODGRADE = SDISCGRADE.CODGRADE
                                       AND SPERIODO.CODPERIODO = SDISCGRADE.CODPERIODO
                                  JOIN SGRADE
                                    ON SPERIODO.CODCOLIGADA = SGRADE.CODCOLIGADA
                                       AND SPERIODO.CODCURSO = SGRADE.CODCURSO
                                       AND SPERIODO.CODHABILITACAO = SGRADE.CODHABILITACAO
                                       AND SPERIODO.CODGRADE = SGRADE.CODGRADE
                                  JOIN SHABILITACAOFILIAL SH
                                    ON SH.CODCOLIGADA = SGRADE.CODCOLIGADA
                                       AND SH.CODCURSO = SGRADE.CODCURSO
                                       AND SH.CODHABILITACAO = SGRADE.CODHABILITACAO
                                       AND SH.CODGRADE = SGRADE.CODGRADE
                           WHERE  SHISTORICO.CODDISC = SDISCGRADE.CODDISC)
ORDER  BY 1,
          7,
          3 
