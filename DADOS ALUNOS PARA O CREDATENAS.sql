select
    SPLETIVO.DESCRICAO AS 'SEMESTRE',
    SCURSO.NOME AS 'CURSO',
    STURNO.NOME AS 'TURNO',
    FCFO.NOME AS 'RESPONSAVEL_NOME',
    PCODNACAO.DESCRICAO AS 'NACIONALIDADE',
    /*	case 
          when (Select FCFO.CODMUNICIPIO 
                  where (replace(replace(fcfo.cgccfo,'.',''),'-','')) = (replace(replace(PPESSOA.cpf,'.',''),'-',''))
		          and SMATRICPL.RA =SALUNO.RA )IS  null
		           then
		        (select cidade from fcfo as dc where dc.codcfo = fcfo.codcfo)
		  else*/
    (Select top 1
        PPESSOA.NATURALIDADE
    from PPESSOA, saluno, fcfo
    where (replace(replace(fcfo.cgccfo,'.',''),'-','')) = (replace(replace(PPESSOA.cpf,'.',''),'-',''))
        and SMATRICPL.RA =SALUNO.RA
        and fcfo.CODCFO=saluno.CODCFO  )
		           /* and saluno.codpessoa=PPESSOA.codigo)	  end */
	  as 'NATURALIDADE',
    PCODESTCIVIL.DESCRICAO AS 'ESTADO_CIVIL',

    fcfo.cgccfo as CPF,
    fcfo.cidentidade as RG,
    DTIPORUA.DESCRICAO+' '+fcfo.rua+' nº '+fcfo.numero  'RUA',
    fcfo.complemento as COMP,
    fcfo.bairro as BAIRRO,
    fcfo.cep as CEP,
    fcfo.telefone as FONE_COMUM,
    fcfo.telex as CELULAR,
    fcfo.telefonecomercial as FONE_COMER,
    PPESSOA.DTNASCIMENTO AS 'Data_Nascimento',
    PPESSOA.NOME AS 'ALUNO',
    (SELECT P.NOME
    FROM PPESSOA P
    WHERE P.CODIGO = SPESSOA.CODPESSOAPAI) AS 'PAI',
    (SELECT P.NOME
    FROM PPESSOA P
    WHERE P.CODIGO = SPESSOA.CODPESSOAMAE) AS 'MAE',
    FCFO.CIDADE+' / '+FCFO.CODETD AS CIDADE_ESTADO
	, (select SUM (valor)
    from
        SCONTRATO
        inner join SPLANOPGTO on 
				scontrato.CODCOLIGADA = splanopgto.CODCOLIGADA
            and scontrato.IDPERLET = splanopgto.idperlet
            and scontrato.CODPLANOPGTO = splanopgto.CODPLANOPGTO
        inner join SPARCPLANO on 
				sparcplano.CODCOLIGADA = SPLANOPGTO.CODCOLIGADA
            and sparcplano.idperlet = SPLANOPGTO.idperlet
            and sparcplano.CODPLANOPGTO = SPLANOPGTO.codplanopgto
    where 
			scontrato.RA = smatricpl.ra
        and scontrato.IDPERLET = smatricpl.idperlet) AS VALOR_CONTRATO
	, SCONTRATO.DTASSINATURA
	, CASE 
		WHEN SCURSO.CODTIPOCURSO='1' THEN 'Presencial'
		WHEN SCURSO.CODTIPOCURSO='2' THEN 'EAD'
	 END AS REGIME
from
    SCONTRATO
    JOIN SMATRICPL (NOLOCK)
    ON  scontrato.CODCOLIGADA = smatricpl.CODCOLIGADA
        and scontrato.IDPERLET = smatricpl.IDPERLET
        and scontrato.IDHABILITACAOFILIAL = smatricpl.IDHABILITACAOFILIAL
        and scontrato.RA = smatricpl.ra
    JOIN
    SALUNO (NOLOCK)
    ON SALUNO.CODCOLIGADA = SMATRICPL.CODCOLIGADA
        AND SALUNO.RA = SMATRICPL.RA
    JOIN
    PPESSOA (NOLOCK) ON PPESSOA.CODIGO = SALUNO.CODPESSOA
    JOIN
    SHABILITACAOALUNO (NOLOCK) ON SHABILITACAOALUNO.CODCOLIGADA = SMATRICPL.CODCOLIGADA
        AND SHABILITACAOALUNO.IDHABILITACAOFILIAL = SMATRICPL.IDHABILITACAOFILIAL
        AND SHABILITACAOALUNO.RA = SMATRICPL.RA

    JOIN
    SHABILITACAOFILIAL (NOLOCK)
    ON SHABILITACAOFILIAL.CODCOLIGADA = SHABILITACAOALUNO.CODCOLIGADA
        AND SHABILITACAOFILIAL.IDHABILITACAOFILIAL = SHABILITACAOALUNO.IDHABILITACAOFILIAL
        and shabilitacaofilial.codcoligada = smatricpl.codcoligada
        and shabilitacaofilial.idhabilitacaofilial = smatricpl.idhabilitacaofilial
    JOIN
    STURNO (NOLOCK) ON STURNO.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
        AND STURNO.CODTURNO = SHABILITACAOFILIAL.CODTURNO
    LEFT JOIN
    SPLETIVO (NOLOCK) ON SPLETIVO.CODCOLIGADA = SMATRICPL.CODCOLIGADA
        AND SPLETIVO.IDPERLET = SMATRICPL.IDPERLET
    LEFT JOIN
    PCODNACAO (NOLOCK) ON PCODNACAO.CODCLIENTE = PPESSOA.NACIONALIDADE

    LEFT JOIN
    SPESSOA (NOLOCK) ON SPESSOA.CODIGO = PPESSOA.CODIGO
    LEFT JOIN SALUNOCOMPL  (NOLOCK) ON SALUNOCOMPL.CODCOLIGADA = SALUNO.CODCOLIGADA
        AND SALUNOCOMPL.RA = SALUNO.RA
    LEFT JOIN
    SCURSO (NOLOCK) ON SCURSO.CODCOLIGADA = SHABILITACAOFILIAL.CODCOLIGADA
        AND SCURSO.CODCURSO = SHABILITACAOFILIAL.CODCURSO
    LEFT JOIN FCFO (NOLOCK) ON FCFO.CODCOLIGADA = SALUNO.CODCOLCFO
        AND FCFO.CODCFO = SALUNO.CODCFO
    LEFT JOIN
    PCODESTCIVIL (NOLOCK) ON PCODESTCIVIL.CODCLIENTE = FCFO.ESTADOCIVIL
    LEFT JOIN
    DTIPORUA (NOLOCK) ON DTIPORUA.CODIGO = fcfo.TIPORUA

where 
	SCONTRATO.STATUS = 'N'

    and SCONTRATO.RA=:RA1
    and SCONTRATO.codcoligada = :CODCOLIGADA1
    and scontrato.idperlet = :IDPERLET1
    and scontrato.codcontrato = :CODCONTRATO1