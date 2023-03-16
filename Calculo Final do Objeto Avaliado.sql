SELECT Round(( ( ( Count(CASE
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
                                                                                                                                  END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2)                                                                             AS 'NOTA_FINAL',
       ( ( Round(( ( ( Count(CASE
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
                                                                                                                                      END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5                                                           AS 'SATISFACAO_FINAL',
       ( ( ( Round(( ( ( Count(CASE
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
                                                                                                                                        END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 ) / (SELECT Count(DISTINCT BQUESTAO.CODQUESTAO) AS 'TOTAL-QUESTOES'
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
                                                                                                                                                                                                                                                                                                                         WHERE  BHISTORICO.CODPROVA = :CODIGOPROVA1
                                                                                                                                                                                                                                                                                                                                AND BHISTRESPPROVA.CODRESPOSTA IS NOT NULL) AS 'CONCEITOPORC',
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
                                                                                                                                                END) * 0.5 ) ) / ( Count( CASE WHEN ( BHISTORICO.CODPESSOA IS NULL ) THEN 1 END) + Count (CASE WHEN ( BHISTORICO.CODPESSOA IS NOT NULL ) THEN 1 END ) ) ), 2) ) * 100 ) / 5 )) < 40 THEN 1
       END                                                                                                                                                                                                                                                                                                                                                                  AS 'CONCEITO_NOTA'
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
       JOIN SPLETIVO(NOLOCK)
         ON SPLETIVO.CODCOLIGADA = SMATRICPL.CODCOLIGADA
            AND SPLETIVO.IDPERLET = SMATRICPL.IDPERLET
WHERE  BHISTORICO.CODPROVA = :CODIGOPROVA1
       AND BOBJETOAVALIADO.SEQOBJETOAVALIADO = :CODOBJETOAVALIADO1
       AND SMATRICPL.CODTURMA = :TURMA
       AND SPLETIVO.CODPERLET = :PERIODO
       AND BHISTRESPPROVA.CODRESPOSTA IS NOT NULL 
