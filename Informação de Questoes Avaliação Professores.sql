SELECT SDISCIPLINA.CODDISC                  AS 'COD_DISCIPLINA',
       SPROFESSOR.CODPROF                   AS 'COD_PROF',
       BQUESTAO.CODQUESTAO                  AS 'CODIGO_QUESTAO',
       Cast(BQUESTAO.TEXTO AS VARCHAR(MAX)) AS 'QUESTAO',
       Count(CASE
               WHEN BHISTRESPPROVA.CODRESPOSTA = 'A' THEN 1
             END) * 5                       AS 'A',
       Count(CASE
               WHEN BHISTRESPPROVA.CODRESPOSTA = 'B' THEN 1
             END) * 4                       AS 'B',
       Count(CASE
               WHEN BHISTRESPPROVA.CODRESPOSTA = 'C' THEN 1
             END) * 3                       AS 'C',
       Count(CASE
               WHEN BHISTRESPPROVA.CODRESPOSTA = 'D' THEN 1
             END) * 2                       AS 'D',
       Count(CASE
               WHEN BHISTRESPPROVA.CODRESPOSTA = 'E' THEN 1
             END) * 1                       AS 'E',
       Count(CASE
               WHEN BHISTRESPPROVA.CODRESPOSTA = 'F' THEN 1
             END) * 0,5                       AS 'F'
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
       JOIN SPROFESSOR (NOLOCK)
         ON SPROFESSOR.CODCOLIGADA = SOBJETOAVALIADO.CODCOLIGADA
            AND SPROFESSOR.CODPROF = SOBJETOAVALIADO.CODPROF
       JOIN PPESSOA (NOLOCK)
         ON PPESSOA.CODIGO = SPROFESSOR.CODPESSOA
       JOIN BQUESTAO (NOLOCK)
         ON BHISTORICO.CODCOLIGADA = BQUESTAO.CODCOLIGADA
            AND BHISTORICO.CODAREA = BQUESTAO.CODAREA
            AND BHISTORICO.CODMATERIA = BQUESTAO.CODMATERIA
            AND BHISTORICO.CODQUESTAO = BQUESTAO.CODQUESTAO
       JOIN SPROFESSORFILIAL (NOLOCK)
         ON SPROFESSORFILIAL.CODCOLIGADA = SPROFESSOR.CODCOLIGADA
            AND SPROFESSORFILIAL.CODPROF = SPROFESSOR.CODPROF
       JOIN STURMADISC (NOLOCK)
         ON STURMADISC.CODCOLIGADA = SOBJETOAVALIADO.CODCOLIGADA
            AND STURMADISC.IDTURMADISC = SOBJETOAVALIADO.IDTURMADISC
       JOIN SPLETIVO (NOLOCK)
         ON SPLETIVO.CODCOLIGADA = STURMADISC.CODCOLIGADA
            AND SPLETIVO.IDPERLET = STURMADISC.IDPERLET
       JOIN STURMA(NOLOCK)
         ON STURMA.CODCOLIGADA = STURMADISC.CODCOLIGADA
            AND STURMA.IDPERLET = STURMADISC.IDPERLET
            AND STURMA.CODFILIAL = STURMADISC.CODFILIAL
            AND STURMA.CODTURMA = STURMADISC.CODTURMA
       JOIN SDISCIPLINA(NOLOCK)
         ON SDISCIPLINA.CODCOLIGADA = STURMADISC.CODCOLIGADA
            AND SDISCIPLINA.CODDISC = STURMADISC.CODDISC
WHERE  STURMADISC.CODTURMA = :TURMA1
       AND SPLETIVO.CODPERLET = :PERIODO1
       AND SPROFESSORFILIAL.CODFILIAL = :FILIAL1
       AND BHISTORICO.CODPROVA = :CODIGOPROVA1
       AND BHISTRESPPROVA.CODRESPOSTA IS NOT NULL
       AND SPROFESSOR.CODPROF = :CODIGOPROFESSOR1
       AND SDISCIPLINA.CODDISC = :CODIGODISCIPLINA1
GROUP  BY SPROFESSOR.CODPROF,
          SDISCIPLINA.CODDISC,
          Cast(BQUESTAO.TEXTO AS VARCHAR(MAX)),
          SPLETIVO.CODPERLET,
          BQUESTAO.CODQUESTAO 
