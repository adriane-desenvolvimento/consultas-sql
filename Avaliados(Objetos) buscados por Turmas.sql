SELECT BHISTORICO.CODPROVA                  AS 'CODIGO_PROVA',
       BOBJETOAVALIADO.DESCOBJETOAVALIADO   AS 'OBJETO_AVALIADO',
       Count(DISTINCT BHISTORICO.CODPESSOA) AS 'TOTAL-AVALIADORES',
       SOBJETOAVALIADO.SEQOBJETOAVALIADO    AS 'COD_OBJETOAVALIADO',
       CASE
         WHEN SHABILITACAOFILIAL.CODFILIAL = 1 THEN 'PARACATU'
         WHEN SHABILITACAOFILIAL.CODFILIAL = 2 THEN 'SETE LAGOAS'
         WHEN SHABILITACAOFILIAL.CODFILIAL = 3 THEN 'PASSOS'
         WHEN SHABILITACAOFILIAL.CODFILIAL = 5 THEN 'VALENÇA'
         WHEN SHABILITACAOFILIAL.CODFILIAL = 6 THEN 'SORRISO'
         WHEN SHABILITACAOFILIAL.CODFILIAL = 7 THEN 'PORTO SEGURO'
       END                                  AS 'NOME_FILIAL'
FROM   SOBJETOAVALIADO (NOLOCK)
       JOIN BOBJETOAVALIADO (NOLOCK)
         ON SOBJETOAVALIADO.SEQOBJETOAVALIADO = BOBJETOAVALIADO.SEQOBJETOAVALIADO
       JOIN BHISTORICO
         ON BHISTORICO.CODCOLIGADA = SOBJETOAVALIADO.CODCOLIGADA
            AND BHISTORICO.SEQOBJETOAVALIADO = SOBJETOAVALIADO.SEQOBJETOAVALIADO
            AND BHISTORICO.SEQOBJETOAVALIADO = BOBJETOAVALIADO.SEQOBJETOAVALIADO
       JOIN BHISTRESPPROVA (NOLOCK)
         ON BHISTRESPPROVA.CODCOLIGADA = BHISTORICO.CODCOLIGADA
            AND BHISTRESPPROVA.CODPROVA = BHISTORICO.CODPROVA
            AND BHISTRESPPROVA.ID = BHISTORICO.ID
            AND BHISTRESPPROVA.CODAREA = BHISTORICO.CODAREA
            AND BHISTRESPPROVA.CODMATERIA = BHISTORICO.CODMATERIA
            AND BHISTRESPPROVA.CODQUESTAO = BHISTORICO.CODQUESTAO
       JOIN BQUESTAO (NOLOCK)
         ON BHISTORICO.CODCOLIGADA = BQUESTAO.CODCOLIGADA
            AND BHISTORICO.CODAREA = BQUESTAO.CODAREA
            AND BHISTORICO.CODMATERIA = BQUESTAO.CODMATERIA
            AND BHISTORICO.CODQUESTAO = BQUESTAO.CODQUESTAO
       JOIN PPESSOA
         ON PPESSOA.CODIGO = BHISTORICO.CODPESSOA
       JOIN SALUNO
         ON PPESSOA.CODIGO = SALUNO.CODPESSOA
       JOIN SMATRICPL
         ON SMATRICPL.CODCOLIGADA = SALUNO.CODCOLIGADA
            AND SMATRICPL.RA = SALUNO.RA
       JOIN SHABILITACAOFILIAL
         ON SHABILITACAOFILIAL.CODCOLIGADA = SMATRICPL.CODCOLIGADA
            AND SHABILITACAOFILIAL.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL
WHERE  BHISTORICO.CODPROVA = 14
       AND SHABILITACAOFILIAL.CODFILIAL = 2
       AND SHABILITACAOFILIAL.CODCOLIGADA = 1
      AND SMATRICPL.CODTURMA = 'M1GDA'
GROUP  BY BHISTORICO.CODPROVA,
          BOBJETOAVALIADO.DESCOBJETOAVALIADO,
          SOBJETOAVALIADO.SEQOBJETOAVALIADO,
          SHABILITACAOFILIAL.CODFILIAL 