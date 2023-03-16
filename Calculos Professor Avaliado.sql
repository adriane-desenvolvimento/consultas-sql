SELECT ((((SELECT Cast (( Count(CASE
                                  WHEN BHISTRESPPROVA.CODRESPOSTA = 'A' THEN 1
                                END) * 5 ) + ( Count(CASE
                                                       WHEN BHISTRESPPROVA.CODRESPOSTA = 'B' THEN 4
                                                     END) * 4 ) + ( Count(CASE
                                                                            WHEN BHISTRESPPROVA.CODRESPOSTA = 'C' THEN 3
                                                                          END) * 3 ) + ( Count(CASE
                                                                                                 WHEN BHISTRESPPROVA.CODRESPOSTA = 'D' THEN 2
                                                                                               END) * 2 ) + ( Count(CASE
                                                                                                                      WHEN BHISTRESPPROVA.CODRESPOSTA = 'E' THEN 1
                                                                                                                    END) * 1 ) + ( Count(CASE
                                                                                                                                           WHEN BHISTRESPPROVA.CODRESPOSTA = 'F' THEN 1
                                                                                                                                         END) * 0.5 ) AS DECIMAL(5, 2)))))) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) )                AS 'NOTA',
       ( Count(CASE
                 WHEN BHISTRESPPROVA.CODRESPOSTA = 'A' THEN 1
               END) * 5 ) + ( Count(CASE
                                      WHEN BHISTRESPPROVA.CODRESPOSTA = 'B' THEN 1
                                    END) * 4 ) + ( Count(CASE
                                                           WHEN BHISTRESPPROVA.CODRESPOSTA = 'C' THEN 1
                                                         END) * 3 ) + ( Count(CASE
                                                                                WHEN BHISTRESPPROVA.CODRESPOSTA = 'D' THEN 1
                                                                              END) * 2 ) + ( Count(CASE
                                                                                                     WHEN BHISTRESPPROVA.CODRESPOSTA = 'E' THEN 1
                                                                                                   END) * 1 ) + ( Count(CASE
                                                                                                                          WHEN BHISTRESPPROVA.CODRESPOSTA = 'F' THEN 1
                                                                                                                        END) * 0.5 )                                                                                                                                                                                                AS 'SOMA DAS OPÇÕES',
       Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END )                                                                                                                                                                                           AS 'TOTAL_DE_AVALIADORES',
       ( ( ( (SELECT Cast (( Count(CASE
                                     WHEN BHISTRESPPROVA.CODRESPOSTA = 'A' THEN 1
                                   END) * 5 ) + ( Count(CASE
                                                          WHEN BHISTRESPPROVA.CODRESPOSTA = 'B' THEN 4
                                                        END) * 4 ) + ( Count(CASE
                                                                               WHEN BHISTRESPPROVA.CODRESPOSTA = 'C' THEN 3
                                                                             END) * 3 ) + ( Count(CASE
                                                                                                    WHEN BHISTRESPPROVA.CODRESPOSTA = 'D' THEN 2
                                                                                                  END) * 2 ) + ( Count(CASE
                                                                                                                         WHEN BHISTRESPPROVA.CODRESPOSTA = 'E' THEN 1
                                                                                                                       END) * 1 ) + ( Count(CASE
                                                                                                                                              WHEN BHISTRESPPROVA.CODRESPOSTA = 'F' THEN 1
                                                                                                                                            END) * 0.5 )AS DECIMAL(5, 2))) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ) * 100 ) / 5 ) AS 'SATISFACAO'
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
       AND SDISCIPLINA.CODDISC = :CODIGODISCIPLINA1
       AND SPROFESSOR.CODPROF = :CODIGOPROFESSOR1
       AND BQUESTAO.CODQUESTAO = :CODIGOQUESTAO1
GROUP  BY SPROFESSOR.CODPROF,
          PPESSOA.CODIGO,
          SDISCIPLINA.CODDISC
