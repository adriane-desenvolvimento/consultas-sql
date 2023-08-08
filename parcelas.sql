SET LANGUAGE PORTUGUESE;

SELECT CONCAT(( ROW_NUMBER() OVER (ORDER BY PARCELA)
                + (SELECT Count(*)
                   FROM   SPARCELA S(NOLOCK)
                   WHERE  S.CODSERVICO = 1
                          AND S.RA = SPARCELA.RA
                          AND S.RECCREATEDON < SPARCELA.RECCREATEDON) ), 'ª')                                                                                                                       AS 'DESCRIÇÃO',
       CONCAT('R$ ', Cast(( SPARCELA.VALOR - SPARCELA.VALOR * 40 / 100 ) AS DECIMAL(10, 2)))                                                                                                        AS 'VALOR_MENSALIDADE',
       CONCAT(Datename(MONTH, SPARCELA.DTVENCIMENTO), '/', RIGHT(Year(SPARCELA.DTVENCIMENTO), 2))                                                                                                   AS 'DTVENCIMENTO',
       CONCAT(Cast((SELECT S.DESCONTO
                    FROM   SBOLSA(NOLOCK)
                           JOIN SBOLSAALUNO S(NOLOCK)
                             ON S.CODBOLSA = SBOLSA.CODBOLSA
                           JOIN SPARCELA P(NOLOCK)
                             ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                AND P.IDPERLET = SPARCELA.IDPERLET
                                AND P.RA = SPARCELA.RA
                    WHERE  NOME LIKE 'cred atenas%'
                           AND S.RA = SPARCELA.RA
                           AND S.CODSERVICO <> 234
                           AND P.CODSERVICO = SPARCELA.CODSERVICO
                           AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                           AND P.PARCELA = SPARCELA.PARCELA) AS DECIMAL(10, 2)), ' %')                                                                                                              AS '%',
       (SELECT S.DESCONTO
        FROM   SBOLSA(NOLOCK)
               JOIN SBOLSAALUNO S(NOLOCK)
                 ON S.CODBOLSA = SBOLSA.CODBOLSA
               JOIN SPARCELA P(NOLOCK)
                 ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                    AND P.IDPERLET = SPARCELA.IDPERLET
                    AND P.RA = SPARCELA.RA
        WHERE  NOME LIKE 'cred atenas%'
               AND S.RA = SPARCELA.RA
               AND P.CODSERVICO = SPARCELA.CODSERVICO
               AND S.CODCONTRATO = SPARCELA.CODCONTRATO
               AND P.PARCELA = SPARCELA.PARCELA)                                                                                                                                                    AS 'SEM %',
       CONCAT('R$ ', Cast(( SPARCELA.VALOR - SPARCELA.VALOR * 40 / 100 ) - ( ( SPARCELA.VALOR - SPARCELA.VALOR * 40 / 100 ) * (SELECT S.DESCONTO
                                                                                                                               FROM   SBOLSA(NOLOCK)
                                                                                                                                      JOIN SBOLSAALUNO S(NOLOCK)
                                                                                                                                        ON S.CODBOLSA = SBOLSA.CODBOLSA
                                                                                                                                      JOIN SPARCELA P(NOLOCK)
                                                                                                                                        ON P.CODCONTRATO = SPARCELA.CODCONTRATO
                                                                                                                                           AND P.IDPERLET = SPARCELA.IDPERLET
                                                                                                                                           AND P.RA = SPARCELA.RA
                                                                                                                               WHERE  NOME LIKE 'cred atenas%'
                                                                                                                                      AND S.RA = SPARCELA.RA
                                                                                                                                      AND P.CODSERVICO = SPARCELA.CODSERVICO
                                                                                                                                      AND S.CODCONTRATO = SPARCELA.CODCONTRATO
                                                                                                                                      AND P.PARCELA = SPARCELA.PARCELA) / 100 ) AS DECIMAL(10, 2))) AS 'VALOR_PARCELA'
FROM   SPARCELA(NOLOCK)
WHERE  SPARCELA.RA = '20-1-15378'
       AND SPARCELA.CODSERVICO = 1
       AND SPARCELA.CODCONTRATO = 98736
ORDER  BY SPARCELA.PARCELA 
