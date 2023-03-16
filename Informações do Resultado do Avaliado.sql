SELECT BHISTORICO.CODPROVA                                AS 'CODIGO_PROVA',
       SPLETIVO.CODPERLET                                 AS 'PERIODO',
       PPESSOA.CODIGO                                     AS 'COD PESSOA',
       SPROFESSOR.CODPROF                                 AS 'CODIGO_PROFESSOR',
       PPESSOA.NOME                                       AS 'NOME_PROFESSOR',
       SPROFESSORFILIAL.CODFILIAL                         AS 'FILIAL PROFESSOR',
       STURMADISC.CODTURMA                                AS 'TURMA',
       SDISCIPLINA.CODDISC                                AS 'CODIGO_DISCIPLINA',
       SDISCIPLINA.NOME                                   AS 'NOME_DISCIPLINA',
       CASE
         WHEN SPROFESSORFILIAL.CODFILIAL = 1 THEN 'PARACATU'
         WHEN SPROFESSORFILIAL.CODFILIAL = 2 THEN 'SETE LAGOAS'
         WHEN SPROFESSORFILIAL.CODFILIAL = 3 THEN 'PASSOS'
         WHEN SPROFESSORFILIAL.CODFILIAL = 5 THEN 'VALENÇA'
         WHEN SPROFESSORFILIAL.CODFILIAL = 6 THEN 'SORRISO'
         WHEN SPROFESSORFILIAL.CODFILIAL = 7 THEN 'PORTO SEGURO'
       END                                                AS 'NOME_FILIAL',
       SOBJETOAVALIADO.SEQOBJETOAVALIADO                  AS 'COD_OBJETO',
       (SELECT ( Count (DISTINCT BHISTORICO.CODPESSOA) )) AS 'TOTAL_DE_AVALIADORES',
       CASE
         WHEN (( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 )) >= 90 THEN 5
         WHEN (( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 )) >= 70
              AND ( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                   END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 ) < 90 THEN 4
         WHEN (( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 )) >= 50
              AND ( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                   END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 ) < 70 THEN 3
         WHEN (( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 )) >= 40
              AND ( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                   END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 ) < 50 THEN 2
         WHEN (( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                                END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 )) <= 39 THEN 1
       END                                                AS 'CONCEITO_NOTA'
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
       JOIN SPROFESSORTURMA(NOLOCK)
         ON SPROFESSORTURMA.CODCOLIGADA = SPROFESSOR.CODCOLIGADA
            AND SPROFESSORTURMA.CODPROF = SPROFESSOR.CODPROF
            AND SPROFESSORTURMA.IDTURMADISC = STURMADISC.IDTURMADISC
            AND SPROFESSORTURMA.CODCOLIGADA = STURMADISC.CODCOLIGADA
WHERE  STURMADISC.CODTURMA = :TURMA
       AND SPLETIVO.CODPERLET = :PERIODO
       AND SPROFESSORFILIAL.CODFILIAL = :FILIAL
       AND BHISTORICO.CODPROVA = :CODIGOPROVA
       AND BHISTRESPPROVA.CODRESPOSTA IS NOT NULL
       AND SPROFESSORTURMA.TIPOPROF != 'D'
GROUP  BY SOBJETOAVALIADO.SEQOBJETOAVALIADO,
          SPROFESSOR.CODPROF,
          PPESSOA.CODIGO,
          PPESSOA.NOME,
          BHISTORICO.CODPROVA,
          SPROFESSORFILIAL.CODFILIAL,
          SPLETIVO.CODPERLET,
          STURMADISC.CODTURMA,
          SDISCIPLINA.CODDISC,
          SDISCIPLINA.NOME 
