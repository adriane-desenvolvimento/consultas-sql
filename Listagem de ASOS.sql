SELECT V.CODCOLIGADA,
       V.CHAPA,
       V.CODPESSOA,
       F.NOME,
       PF.NOME,
       F.CODSECAO,
       P.DESCRICAO,
       CASE
         WHEN F.CODSITUACAO = 'A' THEN 'Ativo'
         WHEN F.CODSITUACAO = 'F' THEN 'Férias'
         WHEN F.CODSITUACAO = 'T' THEN 'Af. Ac. Trabalho'
         WHEN F.CODSITUACAO = 'P' THEN 'Af. Previdência'
       END                                                            AS SITUAÇÃO,
       FORMAT(V.DATACONSULTA, 'dd/MM/yyyy')                           AS DATACONSULTA,
       CONVERT(VARCHAR, Dateadd(YEAR, 1, V.DATACONSULTA), 103)        DATAASO,
       Datediff(DAY, Getdate(), ( Dateadd(YEAR, 1, V.DATACONSULTA) )) AS CONTAGEM
FROM   VCONSULTASPRONT V
       LEFT JOIN PFUNC F (NOLOCK)
              ON F.CODCOLIGADA = V.CODCOLIGADA
                 AND F.CODPESSOA = V.CODPESSOA
       INNER JOIN PSECAO P(NOLOCK)
               ON P.CODCOLIGADA = F.CODCOLIGADA
                  AND P.CODIGO = F.CODSECAO
       INNER JOIN PFUNCAO PF(NOLOCK)
               ON PF.CODCOLIGADA = F.CODCOLIGADA
                  AND PF.CODIGO = F.CODFUNCAO
WHERE  Datediff(DAY, Getdate(), ( Dateadd(YEAR, 1, V.DATACONSULTA) )) >= 0
       AND F.CODSITUACAO IN ( 'A', 'F', 'T', 'P' )
       AND V.CODTIPOCONSULTA IN ( '0001', '0003' )
       AND V.DATACONSULTA = (SELECT Max(VC.DATACONSULTA)AS DATACONSULTA
                             FROM   VCONSULTASPRONT VC
                             WHERE  V.codpessoa = VC.CODPESSOA
                                    AND V.CODCOLIGADA = VC.CODCOLIGADA)
GROUP  BY V.DATACONSULTA,
          V.CHAPA,
          F.NOME,
          PF.NOME,
          v.codtipoconsulta,
          F.CODSITUACAO,
          V.CODCOLIGADA,
          F.CODSECAO,
          P.DESCRICAO,
          V.CODPESSOA
ORDER  BY 4
