SELECT CASE
         WHEN SHABILITACAOALUNOCOMPL.SITENADE IS NULL THEN 'SEM INFORMAÇÕES'
         ELSE SHABILITACAOALUNOCOMPL.SITENADE
       END                                                                                                           AS SITENADE,
       /*(SELECT OBSENADE
        FROM   SMATRICPL
        WHERE  SMATRICPL.RA = SALUNO.RA
               AND OBSENADE IS NOT NULL
               AND CODSTATUS IN ( 14, 19, 29, 28,
                                  29, 33, 34, 35,
                                  36, 37, 43, 12 ))                                                                  AS 'OBS_ENADE',*/
       ppessoa.nome                                                                                                  AS NOME,
       saluno.RA                                                                                                     AS MATRICULA,
       ppessoa.CPF                                                                                                   AS CPF,
       ppessoa.DTNASCIMENTO                                                                                          AS NASCIMENTO,
       ppessoa.NATURALIDADE                                                                                          AS NATURALIDADE,
       ppessoa.ESTADONATAL,
       pcodnacao.descricao                                                                                           AS NACIONALIDADE,
       ppessoa.SEXO                                                                                                  AS SEXO,
       ppessoa.cartidentidade                                                                                        AS IDENTIDADE,
       ppessoa.dtemissaoident                                                                                        AS EMISSAO_IDENTIDADE,
       ppessoa.ORGEMISSORIDENT + '-'
       + ppessoa.UFCARTIDENT                                                                                         AS ORGAO_EMISSOR,
       sinstituicao.NOME                                                                                             AS NOME_INSTITUICAO,
       sgrau.DESCRICAO                                                                                               AS GRAU,
       SINSTITUICAO.CIDADE                                                                                           AS CIDADE_INSTITUICAO,
       sinstituicao.UF                                                                                               AS INSTITUICAO_UF,
       SPESSOA.ANOULTIMAINST                                                                                         AS ANO_ULT_INSTITUICAO,
       stipoingresso.descricao                                                                                       AS TIPO_INGRESSO,
       CONVERT(VARCHAR, (SELECT DATAVESTIBULAR
                         FROM   SALUNOCOMPL
                         WHERE  RA = SALUNO.RA), 103)                                                                AS DATA_INGRESSO,
       shabilitacaoaluno.pontosvestibular                                                                            AS PONTO_VESTIBULAR,
       shabilitacaoaluno.CLASSIFICACAOVESTIBULAR                                                                     AS CLASSIFICACAO_VESTIBULAR,
       shabilitacaoaluno.DTPROCESSOSELETIVO,
       shabilitacaoaluno.DTCOLACAOGRAU,
       shabilitacaoaluno.DTCONCLUSAOCURSO,
       shabilitacaoaluno.DTEMISDIPLOMA,
       Cast(Month(shabilitacaoaluno.DTINGRESSO)AS VARCHAR)
       + '/'
       + Cast(Year(SHABILITACAOALUNO.DTINGRESSO)AS VARCHAR)                                                          AS MESANOINGRESSO,
       Getdate()                                                                                                     AS EMISSAOHISTORICO,
       Upper(scurso.nome)                                                                                            AS CURSO,
       (SELECT CODEMEC
        FROM   SCURSOMEC
        WHERE  SHABILITACAOFILIAL.CODCOLIGADA = SCURSOMEC.CODCOLIGADA
               AND SHABILITACAOFILIAL.IDCURSOMEC = SCURSOMEC.IDCURSOMEC)                                             AS CODEMEC,
       CASE
         WHEN SHABILITACAOFILIAL .CODFILIAL = 1 THEN SCURSOCOMPL.Historico
         WHEN SHABILITACAOFILIAL .CODFILIAL = 2 THEN SCURSOCOMPL.HIST_FILIAL2
         WHEN SHABILITACAOFILIAL .CODFILIAL = 3 THEN SCURSOCOMPL.HIST_FILIAL3
         WHEN SHABILITACAOFILIAL .CODFILIAL = 5 THEN SCURSOCOMPL.HIST_FILIAL5
         WHEN SHABILITACAOFILIAL .CODFILIAL = 6 THEN SCURSOCOMPL.HIST_FILIAL6
         WHEN SHABILITACAOFILIAL .CODFILIAL = 7 THEN SCURSOCOMPL.HIST_FILIAL7
       END                                                                                                           AS HISTORICO,
       /*scursocompl.Historico as HISTORICO,*/

       shabilitacao.NOME                                                                                             AS HABILITACAO,
       shabilitacaofilial.idhabilitacaofilial                                                                        AS IDHABILITACAOFILIAL,
       CASE
         WHEN SHABILITACAOFILIAL .CODFILIAL = 1 THEN 'Paracatu - MG'
         WHEN SHABILITACAOFILIAL .CODFILIAL = 2 THEN 'Sete Lagoas - MG'
         WHEN SHABILITACAOFILIAL .CODFILIAL = 3 THEN 'Passos - MG'
       END                                                                                                           AS FILIAL,
       CASE
         WHEN SHABILITACAOFILIAL .CODFILIAL = 1 THEN 'PARACATU - MG'
         WHEN SHABILITACAOFILIAL .CODFILIAL = 2 THEN 'SETE LAGOAS - MG'
         WHEN SHABILITACAOFILIAL .CODFILIAL = 3 THEN 'PASSOS - MG'
       END                                                                                                           AS FILIAL2,
       CASE
         WHEN SALUNO.OBSHIST IS NULL THEN 'Aluno(a) Regular.'
         ELSE SALUNO.OBSHIST
       END                                                                                                           AS OBS_HISTORICO,
       CASE
         WHEN CODFILIAL = 1 THEN 'Rua Euridamas Avelino de Barros n° 60 - Bairro Lavrado'
         WHEN CODFILIAL = 2 THEN 'Avenida Prefeito Alberto Moura nº 6000 - Bairro Distrito Industrial'
         WHEN CODFILIAL = 3 THEN 'Rua Oscar Candido Monteiro nº 1.000 - Bairro Jardim Colégio de Passos'
       END                                                                                                           AS ENDERECO,
       CASE
         WHEN CODFILIAL = 1 THEN 'Paracatu-MG    CEP:38.600-000'
         WHEN CODFILIAL = 2 THEN 'Sete Lagoas-MG    CEP 35.702-383'
         WHEN CODFILIAL = 3 THEN 'Passos-MG    CEP 37.900.380'
       END                                                                                                           AS CIDADE_ESTADO,
       CASE
         WHEN CODFILIAL = 1 THEN 'Telefone: (38) 3672-3737    e-mail: faculdade@atenas.edu.br'
         WHEN CODFILIAL = 2 THEN 'Telefone: (31) 3509-2000    e-mail: faculdade@atenas.edu.br'
         WHEN CODFILIAL = 3 THEN 'Telefone: (35) 3115-1200    e-mail: faculdade@atenas.edu.br'
       END                                                                                                           AS TELEFONE_EMAIL,
       /*(SELECT Cast(Sum(SHISTORICO.CH) AS INT)
        FROM   SHISTORICO
        WHERE  SHISTORICO.RA = :RA1
               AND SHISTORICO.CODSTATUS != 13
               AND SHISTORICO.IDHABILITACAOFILIAL IN (SELECT idhabilitacaofilial
                                                      FROM   SHABILITACAOALUNO (NOLOCK)
                                                      WHERE  shabilitacaoaluno.RA = saluno.ra
                                                             AND shabilitacaoaluno.codstatus IN ( 14, 43,12 ))) TOTAL_CARGA_HORARIA,
       (SELECT Cast(Sum(SHISTORICO.CH) AS INT)*50/60
        FROM   SHISTORICO
        WHERE  SHISTORICO.RA = :RA1
               AND SHISTORICO.CODSTATUS != 13
               AND SHISTORICO.IDHABILITACAOFILIAL IN (SELECT idhabilitacaofilial
                                                      FROM   SHABILITACAOALUNO (NOLOCK)
                                                      WHERE  shabilitacaoaluno.RA = saluno.ra
                                                             AND shabilitacaoaluno.codstatus IN ( 14, 43,12 ))) TOTAL_CARGA_HORARIA_RELOGIO,*/
       /*linhas acima comentada para corrigir o valor das horas calculadas - solicitado por Larissa da Secretaria - 08/11/2022*/
       /*linhas abaixo substitui as anteriores acima comentada*/
       (SELECT Cast(Sum(SHISTORICO.CH) AS INT)
        FROM   SHISTORICO
        WHERE  SHISTORICO.RA = :RA1
               AND ( SHISTORICO.CODSTATUS IN ( 5, 52, 8, 54,
                                               3, 55 )
                      OR SHISTORICO.CODSTATUS IS NULL )
               AND SHISTORICO.IDHABILITACAOFILIAL IN (SELECT idhabilitacaofilial
                                                      FROM   SHABILITACAOALUNO (NOLOCK)
                                                      WHERE  shabilitacaoaluno.RA = saluno.ra
                                                             AND shabilitacaoaluno.codstatus IN ( 12, 14, 26, 43 ))) TOTAL_CARGA_HORARIA,
       (SELECT Cast(Sum(SHISTORICO.CH) AS INT) * 50 / 60
        FROM   SHISTORICO
        WHERE  SHISTORICO.RA = :RA1
               AND ( SHISTORICO.CODSTATUS IN ( 5, 52, 8, 54,
                                               3, 55 )
                      OR SHISTORICO.CODSTATUS IS NULL )
               AND SHISTORICO.IDHABILITACAOFILIAL IN (SELECT idhabilitacaofilial
                                                      FROM   SHABILITACAOALUNO (NOLOCK)
                                                      WHERE  shabilitacaoaluno.RA = saluno.ra
                                                             AND shabilitacaoaluno.codstatus IN ( 12, 14, 26, 43 ))) TOTAL_CARGA_HORARIA_RELOGIO,
       CASE
         WHEN (SELECT Sum(SA.CARGAHORARIAATV)
               FROM   SATIVIDADEALUNO SA(NOLOCK)
               WHERE  SA.IDHABILITACAOFILIAL = shabilitacaoaluno.idhabilitacaofilial
                      AND SA.RA = saluno.ra
                      AND SA.CODCOMPONENTE IN ( 21, 31 )) > (SELECT SG.ATVCOMPL
                                                             FROM   SGRADECOMPL SG
                                                             WHERE  SG.CODCURSO = SHABILITACAOFILIAL.CODCURSO
                                                                    AND SG.CODHABILITACAO = SHABILITACAOFILIAL.CODHABILITACAO
                                                                    AND SG.CODGRADE = SHABILITACAOFILIAL.CODGRADE) THEN (SELECT SG.ATVCOMPL
                                                                                                                         FROM   SGRADECOMPL SG
                                                                                                                         WHERE  SG.CODCURSO = SHABILITACAOFILIAL.CODCURSO
                                                                                                                                AND SG.CODHABILITACAO = SHABILITACAOFILIAL.CODHABILITACAO
                                                                                                                                AND SG.CODGRADE = SHABILITACAOFILIAL.CODGRADE)
         ELSE (SELECT Sum(SA.CARGAHORARIAATV)
               FROM   SATIVIDADEALUNO SA(NOLOCK)
               WHERE  SA.IDHABILITACAOFILIAL = shabilitacaoaluno.idhabilitacaofilial
                      AND SA.RA = saluno.ra
                      AND SA.CODCOMPONENTE IN ( 21, 31 ))
       END                                                                                                           CARGA_HORARIA_ATIVIDADE,
       (SELECT Sum(SA.CARGAHORARIAATV) CARGA
        FROM   SATIVIDADEALUNO SA(NOLOCK)
        WHERE  SA.IDHABILITACAOFILIAL = shabilitacaoaluno.idhabilitacaofilial
               AND SA.RA = saluno.ra
               AND SA.CODCOMPONENTE IN ( 33 ))                                                                       CARGA_HORARIA_EXTENSAO,
       CASE
         WHEN SHABILITACAOFILIAL.CODFILIAL = 1 THEN 'ANDRESSA CRISTINA DE SOUZA ALMEIDA'
         WHEN SHABILITACAOFILIAL.CODFILIAL = 2 THEN 'LIGIA BARBOSA OLIVEIRA'
         WHEN SHABILITACAOFILIAL.CODFILIAL = 3 THEN 'VANESSA DE SOUZA MARTINS'
       END                                                                                                           AS COORDENADORA,
       CASE
         WHEN SHABILITACAOFILIAL .CODFILIAL = 1 THEN 'Reitor'
         ELSE 'Diretor-Geral'
       END                                                                                                           AS REITORDIRETOR,
       CASE
         WHEN SHABILITACAOFILIAL .CODFILIAL = 1 THEN 'Coord. Sec. Acadêmica'
         ELSE 'Secretária Acadêmica'
       END                                                                                                           AS secretaria,
       CASE
         WHEN SALUNO.RA LIKE 'E%' THEN CONCAT(Substring(SALUNO.RA, 5, 1), 'º - ', CASE
                                                                                    WHEN Month(SHABILITACAOALUNO.DTINGRESSO) >= 10 THEN Cast(Year(SHABILITACAOALUNO.DTINGRESSO) + 1 AS VARCHAR)
                                                                                    ELSE Cast(Year(SHABILITACAOALUNO.DTINGRESSO) AS VARCHAR)
                                                                                  END)
         ELSE CONCAT(Substring(SALUNO.RA, 4, 1), 'º - ', CASE
                                                           WHEN Month(SHABILITACAOALUNO.DTINGRESSO) >= 10 THEN Cast(Year(SHABILITACAOALUNO.DTINGRESSO) + 1 AS VARCHAR)
                                                           ELSE Cast(Year(SHABILITACAOALUNO.DTINGRESSO) AS VARCHAR)
                                                         END)
       END                                                                                                           AS INGRESSOALUNO
FROM   SALUNO (NOLOCK)
       LEFT JOIN PPESSOA(NOLOCK)
              ON ppessoa.CODIGO = SALUNO.CODPESSOA
       LEFT JOIN SPESSOA(NOLOCK)
              ON spessoa.CODIGO = SALUNO.CODPESSOA
       LEFT JOIN sinstituicao(NOLOCK)
              ON spessoa.codinst2grau = sinstituicao.codinst
       LEFT JOIN sgrau(NOLOCK)
              ON spessoa.grauultimainst = sgrau.codgrau
       LEFT JOIN SHABILITACAOALUNO(NOLOCK)
              ON shabilitacaoaluno.CODCOLIGADA = saluno.CODCOLIGADA
                 AND shabilitacaoaluno.RA = saluno.ra
       LEFT JOIN shabilitacaoalunocompl (NOLOCK)
              ON shabilitacaoalunocompl.codcoligada = shabilitacaoaluno.codcoligada
                 AND shabilitacaoalunocompl.idhabilitacaofilial = shabilitacaoaluno.idhabilitacaofilial
                 AND shabilitacaoalunocompl.ra = shabilitacaoaluno.ra
       LEFT JOIN STIPOINGRESSO(NOLOCK)
              ON stipoingresso.CODCOLIGADA = shabilitacaoaluno.codcoligada
                 AND stipoingresso.CODTIPOINGRESSO = SHABILITACAOALUNO.CODTIPOINGRESSO
       LEFT JOIN SHABILITACAOFILIAL(NOLOCK)
              ON shabilitacaoaluno.CODCOLIGADA = shabilitacaofilial.CODCOLIGADA
                 AND shabilitacaofilial.IDHABILITACAOFILIAL = shabilitacaoaluno.idhabilitacaofilial
       LEFT JOIN SCURSO(NOLOCK)
              ON scurso.CODCOLIGADA = shabilitacaofilial.codcoligada
                 AND scurso.CODCURSO = shabilitacaofilial.codcurso
       LEFT JOIN SCURSOCOMPL(NOLOCK)
              ON scurso.CODCOLIGADA = scursocompl.CODCOLIGADA
                 AND scurso.CODCURSO = scursocompl.CODCURSO
       LEFT JOIN SHABILITACAO(NOLOCK)
              ON SHABILITACAO.CODCOLIGADA = scurso.CODCOLIGADA
                 AND scurso.CODCURSO = SHABILITACAO.CODCURSO
       LEFT JOIN PCODNACAO(NOLOCK)
              ON ppessoa.NACIONALIDADE = pcodnacao.CODCLIENTE
WHERE  saluno.CODCOLIGADA = :CODCOLIGADA1
       AND saluno.RA = :RA1
       AND shabilitacaofilial.idhabilitacaofilial = :idhabilitacaofilial1 /*IN (SELECT idhabilitacaofilial
                                                                                                                                                                                                                                                                                 FROM   SHABILITACAOALUNO (NOLOCK)
                                                                                                                                                                                                                                                                                 WHERE  shabilitacaoaluno.RA = saluno.ra
                                                                                                                                                                                                                                                                                        AND shabilitacaoaluno.codstatus IN ( 14, 16, 43, 12 )) */
