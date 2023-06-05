select SUM (valor) AS VALOR
	from 
		SCONTRATO (NOLOCK)
		inner join SPLANOPGTO (NOLOCK) on 
			scontrato.CODCOLIGADA = splanopgto.CODCOLIGADA 
			and scontrato.IDPERLET = splanopgto.idperlet
			and scontrato.CODPLANOPGTO = splanopgto.CODPLANOPGTO
		inner join SPARCPLANO (NOLOCK) on 
			sparcplano.CODCOLIGADA = SPLANOPGTO.CODCOLIGADA
			and sparcplano.idperlet = SPLANOPGTO.idperlet
			and sparcplano.CODPLANOPGTO = SPLANOPGTO.codplanopgto
		inner join SMATRICPL (NOLOCK) 
		on	scontrato.CODCOLIGADA = smatricpl.CODCOLIGADA
 		and scontrato.IDPERLET = smatricpl.IDPERLET
 		and scontrato.IDHABILITACAOFILIAL = smatricpl.IDHABILITACAOFILIAL
 		and scontrato.RA = smatricpl.ra
	where 
		scontrato.RA = :RA1
		and scontrato.idperlet = :IDPERLET1
		and scontrato.codcoligada = :CODCOLIGADA1
		and scontrato.codcontrato = :CODCONTRATO1