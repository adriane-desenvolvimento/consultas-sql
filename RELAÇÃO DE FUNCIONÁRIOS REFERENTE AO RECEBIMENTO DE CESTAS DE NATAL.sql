SELECT
    P.CODCOLIGADA,
    P.CHAPA,
    PS.NOME,
    CASE
         WHEN CONVERT(VARCHAR, ML.dataSolicitacao, 103) IS NULL THEN 'Não Recebeu'
         ELSE CONVERT(VARCHAR, ML.dataSolicitacao, 103)
       END AS 'RECEBIMENTO',
    PSC.DESCRICAO AS 'SEÇÃO',
    PF.NOME AS 'FUNÇÃO',
    CASE 
        WHEN P.CODSITUACAO = 'A' THEN 'Ativo'
        WHEN P.CODSITUACAO = 'D' THEN 'Demitido'
        WHEN P.CODSITUACAO = 'I' THEN 'Apos. por Incapacidade Permanente'
        WHEN P.CODSITUACAO = 'C' THEN 'Contrato de Trabalho Suspenso'
        WHEN P.CODSITUACAO = 'F' THEN 'Férias'
        WHEN P.CODSITUACAO = 'P' THEN 'Af.Previdência'
        WHEN P.CODSITUACAO = 'Q' THEN'Prisão / Cárcere'
        WHEN P.CODSITUACAO = 'V' THEN'Aviso Prévio'
    END AS 'SITUAÇÃO',
    1 AS QTD
FROM FLUIG..ML001006 ML
    RIGHT JOIN CORPORERM..PFUNC P
    ON Substring(ML.funcionario, 1, 5)COLLATE LATIN1_GENERAL_CI_AS = P.CHAPA
    JOIN CORPORERM..PPESSOA PS
    ON PS.CODIGO = P.CODPESSOA
    JOIN CorporeRM..PFUNCAO PF
    ON PF.CODIGO = P.CODFUNCAO
        AND PF.CODCOLIGADA = P.CODCOLIGADA
    JOIN CorporeRM..PSECAO PSC
    ON PSC.CODIGO = P.CODSECAO
        AND PSC.CODCOLIGADA = P.CODCOLIGADA
WHERE  P.CODSITUACAO NOT IN ( 'C', 'D', 'I' )
--ORDER  BY PS.NOME 
