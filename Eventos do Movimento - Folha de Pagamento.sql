SELECT PFF.CODCOLIGADA,
       PFF.NROPERIODO,
       PFF.CODEVENTO,
       PE.DESCRICAO,
       PFF.CHAPA,
       PFF.MESCOMP,
       PFF.ANOCOMP,
       PFF.REF,
       PFF.HORA,
       PFF.VALOR,
       PFF.DTPAGTO,
       PFU.NOME,
       PS.CODIGO       COD_SECAO,
       PS.DESCRICAO    SECAO,
       FUN.NOME        CARGO,
       GDP.NOME        [DEPTO],
       PFU.CODSITUACAO [SITUACAO]
FROM   PFFINANC PFF
       INNER JOIN PFUNC PFU
               ON PFF.CODCOLIGADA = PFU.CODCOLIGADA
                  AND PFF.CHAPA = PFU.CHAPA
       INNER JOIN PEVENTO PE
               ON PE.CODCOLIGADA = PFF.CODCOLIGADA
                  AND PE.CODIGO = PFF.CODEVENTO
       INNER JOIN PSECAO PS
               ON PFU.CODSECAO = PS.CODIGO
                  AND PFU.CODCOLIGADA = PS.CODCOLIGADA
       INNER JOIN PFUNCAO FUN
               ON FUN.CODIGO = PFU.CODFUNCAO
                  AND FUN.CODCOLIGADA = PFU.CODCOLIGADA
       LEFT OUTER JOIN GDEPTO GDP
                    ON GDP.CODCOLIGADA = PS.CODCOLIGADA
                       AND GDP.CODFILIAL = PS.CODFILIAL
                       AND GDP.CODDEPARTAMENTO = PS.CODDEPTO
WHERE  PFF.CODCOLIGADA >= 01
       AND PFF.CODCOLIGADA <= 01
       AND PFF.ANOCOMP = 2023
       AND 0204 LIKE '%' + PFF.CODEVENTO + '%'
       AND Cast(:GRUPO_DE_PERIODO_S AS VARCHAR) LIKE '%' + Cast( PFF.NROPERIODO AS VARCHAR ) + '%'
ORDER  BY PFF.CODCOLIGADA,
          PFF.CODEVENTO 