SET LANGUAGE PORTUGUESE;

WITH ULTIMAPARCELA
     AS (SELECT Max(PARCELA) AS UltimaParcela
         FROM   SPARCELA
         WHERE  CODSERVICO = 234
                AND RA = '20-1-15378'
                AND CODCONTRATO = 98736)
SELECT CONCAT(( ROW_NUMBER() OVER (ORDER BY PARCELA)
                + (SELECT Count(*)
                   FROM   SPARCELA S(NOLOCK)
                   WHERE  S.CODSERVICO = SPARCELA.CODSERVICO
                          AND S.RA = SPARCELA.RA
                          AND S.RECCREATEDON < SPARCELA.RECCREATEDON) ), 'ª')   AS 'DESCRIÇÃO',
       CONCAT(Datename(MONTH, DTVENCIMENTO), '/', RIGHT(Year(DTVENCIMENTO), 2)) AS 'DTVENCIMENTO',
       CASE
         WHEN CONCAT(Cast((SELECT S.DESCONTO
                           FROM   sbolsa(NOLOCK)
                                  JOIN sbolsaaluno S(NOLOCK)
                                    ON S.CODBOLSA = sbolsa.CODBOLSA
                                  JOIN SPARCELA P(NOLOCK)
                                    ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                       AND P.IDPERLET = SPARCELA.IDPERLET
                                       AND P.RA = SPARCELA.RA
                           WHERE  nome LIKE 'cred atenas%'
                                  AND S.ra = SPARCELA.RA
                                  AND P.CODSERVICO = SPARCELA.CODSERVICO
                                  AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                  AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), '%') = '50.00%' THEN
           CASE
             WHEN SCURSO.CODCURSO IN ( 07, 08, 09, 06,
                                       11, 05 ) THEN
               CASE
                 WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '50.00%'
                 ELSE CONCAT(Cast((SELECT S.DESCONTO
                                   FROM   sbolsa(NOLOCK)
                                          JOIN sbolsaaluno S(NOLOCK)
                                            ON S.CODBOLSA = sbolsa.CODBOLSA
                                          JOIN SPARCELA P(NOLOCK)
                                            ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                               AND P.IDPERLET = SPARCELA.IDPERLET
                                               AND P.RA = SPARCELA.RA
                                   WHERE  nome LIKE 'cred atenas%'
                                          AND S.ra = SPARCELA.RA
                                          AND P.CODSERVICO = SPARCELA.CODSERVICO
                                          AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                          AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
               END
             WHEN SCURSO.CODCURSO IN ( 15, 01, 12, 13,
                                       10, 18, 16, 14,
                                       03, 17 ) THEN
               CASE
                 WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '50.00 %'
                 ELSE CONCAT(Cast((SELECT S.DESCONTO
                                   FROM   sbolsa(NOLOCK)
                                          JOIN sbolsaaluno S(NOLOCK)
                                            ON S.CODBOLSA = sbolsa.CODBOLSA
                                          JOIN SPARCELA P(NOLOCK)
                                            ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                               AND P.IDPERLET = SPARCELA.IDPERLET
                                               AND P.RA = SPARCELA.RA
                                   WHERE  nome LIKE 'cred atenas%'
                                          AND S.ra = SPARCELA.RA
                                          AND P.CODSERVICO = SPARCELA.CODSERVICO
                                          AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                          AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
               END
           END
         WHEN CONCAT(Cast((SELECT S.DESCONTO
                           FROM   sbolsa(NOLOCK)
                                  JOIN sbolsaaluno S(NOLOCK)
                                    ON S.CODBOLSA = sbolsa.CODBOLSA
                                  JOIN SPARCELA P(NOLOCK)
                                    ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                       AND P.IDPERLET = SPARCELA.IDPERLET
                                       AND P.RA = SPARCELA.RA
                           WHERE  nome LIKE 'cred atenas%'
                                  AND S.ra = SPARCELA.RA
                                  AND P.CODSERVICO = SPARCELA.CODSERVICO
                                  AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                  AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), '%') = '58.33%' THEN
           CASE
             WHEN SCURSO.CODCURSO IN ( 15, 01, 12, 13,
                                       10, 18, 16, 14,
                                       03, 17 ) THEN
               CASE
                 WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '16.66 %'
                 ELSE CONCAT(Cast((SELECT 100 - S.DESCONTO
                                   FROM   sbolsa(NOLOCK)
                                          JOIN sbolsaaluno S(NOLOCK)
                                            ON S.CODBOLSA = sbolsa.CODBOLSA
                                          JOIN SPARCELA P(NOLOCK)
                                            ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                               AND P.IDPERLET = SPARCELA.IDPERLET
                                               AND P.RA = SPARCELA.RA
                                   WHERE  nome LIKE 'cred atenas%'
                                          AND S.ra = SPARCELA.RA
                                          AND P.CODSERVICO = SPARCELA.CODSERVICO
                                          AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                          AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
               END
           END
         WHEN CONCAT(Cast((SELECT S.DESCONTO
                           FROM   sbolsa(NOLOCK)
                                  JOIN sbolsaaluno S(NOLOCK)
                                    ON S.CODBOLSA = sbolsa.CODBOLSA
                                  JOIN SPARCELA P(NOLOCK)
                                    ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                       AND P.IDPERLET = SPARCELA.IDPERLET
                                       AND P.RA = SPARCELA.RA
                           WHERE  nome LIKE 'cred atenas%'
                                  AND S.ra = SPARCELA.RA
                                  AND P.CODSERVICO = SPARCELA.CODSERVICO
                                  AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                  AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), '%') = '60.00%' THEN
           CASE
             WHEN SCURSO.CODCURSO IN ( 07, 08, 09, 06,
                                       11, 05 ) THEN
               CASE
                 WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '40%'
                 ELSE CONCAT(Cast((SELECT S.DESCONTO
                                   FROM   sbolsa(NOLOCK)
                                          JOIN sbolsaaluno S(NOLOCK)
                                            ON S.CODBOLSA = sbolsa.CODBOLSA
                                          JOIN SPARCELA P(NOLOCK)
                                            ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                               AND P.IDPERLET = SPARCELA.IDPERLET
                                               AND P.RA = SPARCELA.RA
                                   WHERE  nome LIKE 'cred atenas%'
                                          AND S.ra = SPARCELA.RA
                                          AND P.CODSERVICO = SPARCELA.CODSERVICO
                                          AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                          AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
               END
           END
         WHEN CONCAT(Cast((SELECT 100 - S.DESCONTO
                           FROM   sbolsa(NOLOCK)
                                  JOIN sbolsaaluno S(NOLOCK)
                                    ON S.CODBOLSA = sbolsa.CODBOLSA
                                  JOIN SPARCELA P(NOLOCK)
                                    ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                       AND P.IDPERLET = SPARCELA.IDPERLET
                                       AND P.RA = SPARCELA.RA
                           WHERE  nome LIKE 'cred atenas%'
                                  AND S.ra = SPARCELA.RA
                                  AND P.CODSERVICO = SPARCELA.CODSERVICO
                                  AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                  AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), '%') = '61.54%' THEN
           CASE
             WHEN SCURSO.CODCURSO IN ( 15, 01, 12, 13,
                                       10, 18, 16, 14,
                                       03, 17 ) THEN
               CASE
                 WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '23.1%'
                 ELSE CONCAT(Cast((SELECT 100 - S.DESCONTO
                                   FROM   sbolsa(NOLOCK)
                                          JOIN sbolsaaluno S(NOLOCK)
                                            ON S.CODBOLSA = sbolsa.CODBOLSA
                                          JOIN SPARCELA P(NOLOCK)
                                            ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                               AND P.IDPERLET = SPARCELA.IDPERLET
                                               AND P.RA = SPARCELA.RA
                                   WHERE  nome LIKE 'cred atenas%'
                                          AND S.ra = SPARCELA.RA
                                          AND P.CODSERVICO = SPARCELA.CODSERVICO
                                          AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                          AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
               END
           END
         WHEN CONCAT(Cast((SELECT S.DESCONTO
                           FROM   sbolsa(NOLOCK)
                                  JOIN sbolsaaluno S(NOLOCK)
                                    ON S.CODBOLSA = sbolsa.CODBOLSA
                                  JOIN SPARCELA P(NOLOCK)
                                    ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                       AND P.IDPERLET = SPARCELA.IDPERLET
                                       AND P.RA = SPARCELA.RA
                           WHERE  nome LIKE 'cred atenas%'
                                  AND S.ra = SPARCELA.RA
                                  AND P.CODSERVICO = SPARCELA.CODSERVICO
                                  AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                  AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), '%') = '66.66%' THEN
           CASE
             WHEN SCURSO.CODCURSO IN ( 07, 08, 09, 06,
                                       11, 05 ) THEN
               CASE
                 WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '33.34%'
                 ELSE CONCAT(Cast((SELECT 100 - S.DESCONTO
                                   FROM   sbolsa(NOLOCK)
                                          JOIN sbolsaaluno S(NOLOCK)
                                            ON S.CODBOLSA = sbolsa.CODBOLSA
                                          JOIN SPARCELA P(NOLOCK)
                                            ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                               AND P.IDPERLET = SPARCELA.IDPERLET
                                               AND P.RA = SPARCELA.RA
                                   WHERE  nome LIKE 'cred atenas%'
                                          AND S.ra = SPARCELA.RA
                                          AND P.CODSERVICO = SPARCELA.CODSERVICO
                                          AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                          AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
               END
             WHEN SCURSO.CODCURSO IN ( 15, 01, 12, 13,
                                       10, 18, 16, 14,
                                       03, 17 ) THEN
               CASE
                 WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '33.34%'
                 ELSE CONCAT(Cast((SELECT 100 - S.DESCONTO
                                   FROM   sbolsa(NOLOCK)
                                          JOIN sbolsaaluno S(NOLOCK)
                                            ON S.CODBOLSA = sbolsa.CODBOLSA
                                          JOIN SPARCELA P(NOLOCK)
                                            ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                               AND P.IDPERLET = SPARCELA.IDPERLET
                                               AND P.RA = SPARCELA.RA
                                   WHERE  nome LIKE 'cred atenas%'
                                          AND S.ra = SPARCELA.RA
                                          AND P.CODSERVICO = SPARCELA.CODSERVICO
                                          AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                          AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
               END
             WHEN CONCAT(Cast((SELECT 100 - S.DESCONTO
                               FROM   sbolsa(NOLOCK)
                                      JOIN sbolsaaluno S(NOLOCK)
                                        ON S.CODBOLSA = sbolsa.CODBOLSA
                                      JOIN SPARCELA P(NOLOCK)
                                        ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                           AND P.IDPERLET = SPARCELA.IDPERLET
                                           AND P.RA = SPARCELA.RA
                               WHERE  nome LIKE 'cred atenas%'
                                      AND S.ra = SPARCELA.RA
                                      AND P.CODSERVICO = SPARCELA.CODSERVICO
                                      AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                      AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), '%') = '71.43%' THEN
               CASE
                 WHEN SCURSO.CODCURSO IN ( 'ADMINISTRAÇÃO', 'EDUCAÇÃO FISICA', 'NUTRIÇÃO', 'PEDAGOGIA', 'SISTEMA DE INFORMAÇÃO' ) THEN
                   CASE
                     WHEN PARCELA = ULTIMAPARCELA.UltimaParcela THEN '28.57%'
                     ELSE CONCAT(Cast((SELECT 100 - S.DESCONTO
                                       FROM   sbolsa(NOLOCK)
                                              JOIN sbolsaaluno S(NOLOCK)
                                                ON S.CODBOLSA = sbolsa.CODBOLSA
                                              JOIN SPARCELA P(NOLOCK)
                                                ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                                   AND P.IDPERLET = SPARCELA.IDPERLET
                                                   AND P.RA = SPARCELA.RA
                                       WHERE  nome LIKE 'cred atenas%'
                                              AND S.ra = SPARCELA.RA
                                              AND P.CODSERVICO = SPARCELA.CODSERVICO
                                              AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                              AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')
                   END
               END
           END
       END                                                                      AS '%'
FROM   SPARCELA(NOLOCK)
       JOIN SCONTRATO(NOLOCK)
         ON SCONTRATO.CODCONTRATO = SPARCELA.CODCONTRATO
            AND SCONTRATO.CODCOLIGADA = SPARCELA.CODCOLIGADA
            AND SCONTRATO.IDPERLET = SPARCELA.IDPERLET
       JOIN SPLANOPGTO(NOLOCK)
         ON SPLANOPGTO.CODCOLIGADA = SCONTRATO.CODCOLIGADA
            AND SPLANOPGTO.IDPERLET = SCONTRATO.IDPERLET
            AND SPLANOPGTO.CODPLANOPGTO = SCONTRATO.CODPLANOPGTO
       JOIN SHABILITACAOFILIAL(NOLOCK)
         ON SHABILITACAOFILIAL.CODCOLIGADA = SCONTRATO.CODCOLIGADA
            AND SHABILITACAOFILIAL.IDHABILITACAOFILIAL = SCONTRATO.IDHABILITACAOFILIAL
       JOIN SCURSO(NOLOCK)
         ON SCURSO.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
            AND SCURSO.CODCURSO = SHABILITACAOFILIAL.CODCURSO
       JOIN ULTIMAPARCELA
         ON 1 = 1
WHERE  SPARCELA.CODSERVICO = 234
       AND SPARCELA.RA = '20-1-15378'
       AND SPARCELA.CODCONTRATO = 98736
ORDER  BY SPARCELA.PARCELA; 
