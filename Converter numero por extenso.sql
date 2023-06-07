CREATE FUNCTION [DBO].[NEXTENSO_EXTENSO](@NUMERO INTEGER) RETURNS VARCHAR(50) AS BEGIN
    RETURN CASE @NUMERO
                                                                                                  WHEN 1000 THEN 'Mil'
                                                                                                  WHEN 1000000 THEN 'Milhões'
                                                                                                  WHEN 1000000000 THEN 'Bilhões'
                                                                                                  WHEN 100 THEN 'Cento'
                                                                                                  WHEN 200 THEN 'Duzentos'
                                                                                                  WHEN 300 THEN 'Trezentos'
                                                                                                  WHEN 400 THEN 'Quatrocentos'
                                                                                                  WHEN 500 THEN 'Quinhentos'
                                                                                                  WHEN 600 THEN 'Seiscentos'
                                                                                                  WHEN 700 THEN 'Setecentos'
                                                                                                  WHEN 800 THEN 'Oitocentos'
                                                                                                  WHEN 900 THEN 'Novecentos'
                                                                                                  WHEN 10 THEN 'Dez'
                                                                                                  WHEN 11 THEN 'Onze'
                                                                                                  WHEN 12 THEN 'Doze'
                                                                                                  WHEN 13 THEN 'Treze'
                                                                                                  WHEN 14 THEN 'Quartorze'
                                                                                                  WHEN 15 THEN 'Quinze'
                                                                                                  WHEN 16 THEN 'Dezesseis'
                                                                                                  WHEN 17 THEN 'Dezesete'
                                                                                                  WHEN 18 THEN 'Dezoito'
                                                                                                  WHEN 19 THEN 'Dezenove'
                                                                                                  WHEN 20 THEN 'Vinte'
                                                                                                  WHEN 30 THEN 'Trinta'
                                                                                                  WHEN 40 THEN 'Quarenta'
                                                                                                  WHEN 50 THEN 'Cinquenta'
                                                                                                  WHEN 60 THEN 'Sessenta'
                                                                                                  WHEN 70 THEN 'Setenta'
                                                                                                  WHEN 80 THEN 'Oitenta'
                                                                                                  WHEN 90 THEN 'Noventa'
                                                                                                  WHEN 1 THEN 'Um'
                                                                                                  WHEN 2 THEN 'Dois'
                                                                                                  WHEN 3 THEN 'Tres'
                                                                                                  WHEN 4 THEN 'Quatro'
                                                                                                  WHEN 5 THEN 'Cinco'
                                                                                                  WHEN 6 THEN 'Seis'
                                                                                                  WHEN 7 THEN 'Sete'
                                                                                                  WHEN 8 THEN 'Oito'
                                                                                                  WHEN 9 THEN 'Nove'
                                                                                                  ELSE NULL
                                                                                              END
END GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION [DBO].[NEXTENSO_FATOR](@NUMERO INTEGER) RETURNS INTEGER AS BEGIN
    IF @NUMERO < 10 RETURN 1 ELSE IF @NUMERO < 100 RETURN 10 ELSE IF @NUMERO < 1000 RETURN 100 ELSE IF @NUMERO < 1000000 RETURN 1000 ELSE IF @NUMERO < 1000000000 RETURN 1000000 ELSE IF @NUMERO < 1000000000000 RETURN 1000000000
    RETURN NULL
END GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION [DBO].[NEXTENSO_CONVERT](@NUMERO DECIMAL(18, 6), @FAT DECIMAL(18, 6)) RETURNS VARCHAR(1000) AS BEGIN

    DECLARE @RET VARCHAR(1000), @_NUM DECIMAL(18, 6)
    SET @RET = ''
    SET @_NUM = 0
    IF @FAT > 0 BEGIN
        IF @NUMERO = 1000000000 BEGIN
            SET @RET = @RET + ' Um Bilhão'
        END ELSE IF @NUMERO = 1000000 BEGIN
            SET @RET = @RET + ' Um Milhão'
        END ELSE IF @NUMERO = 1000 BEGIN
            SET @RET = @RET + ' Um Mil'
        END ELSE IF @NUMERO = 100 BEGIN
            SET @RET = @RET + 'Cem'
        END ELSE IF @NUMERO > 10
            AND @NUMERO < 20 BEGIN
            SET @RET = @RET + ISNULL(DBO.NEXTENSO_EXTENSO(@NUMERO) + ' e ', '')
        END ELSE BEGIN
            IF @FAT >= 1000 BEGIN
                SET @_NUM = CAST((@NUMERO - (@NUMERO % @FAT)) * (CAST(1 AS DECIMAL(18, 6)) / @FAT) AS INTEGER)
                IF @_NUM = 1 BEGIN
                    SET @RET = @RET + ISNULL(DBO.NEXTENSO_CONVERT(@FAT, @FAT * .1), '')
                END ELSE BEGIN
                    SET @RET = @RET + ISNULL(DBO.NEXTENSO_CONVERT(@_NUM, DBO.NEXTENSO_FATOR(@_NUM)), '') + ' ' + ISNULL(DBO.NEXTENSO_EXTENSO(@FAT), '')
                END
                SET @_NUM = @NUMERO - (@_NUM * @FAT)
                SET @FAT = DBO.NEXTENSO_FATOR(@_NUM)
                SET @RET = @RET + CASE
                      WHEN (@FAT > 100
                    OR @FAT < 100)
                    AND CAST((@_NUM - (@_NUM % @FAT)) * (CAST(1 AS DECIMAL(18, 6)) / @FAT) AS INTEGER) < 100 THEN ' e '
                      ELSE ', '
                  END + ISNULL(DBO.NEXTENSO_CONVERT(@_NUM, @FAT), '')
            END ELSE BEGIN
                SET @_NUM = @NUMERO - (@NUMERO % @FAT)
                SET @RET = @RET + ISNULL(DBO.NEXTENSO_EXTENSO(@_NUM) + ' e ', '') + DBO.NEXTENSO_CONVERT(@NUMERO - @_NUM, @FAT * .1)
            END
        END
    END
    RETURN REPLACE(REPLACE(@RET + '.', ' e .', ''), '.', '')
END GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION [DBO].[NEXTENSO](@NUMERO DECIMAL(15, 2)) RETURNS VARCHAR(1000) AS BEGIN
    DECLARE @RET VARCHAR(500)
    IF @NUMERO > 0 BEGIN
        SET @RET = ''
        SET @RET = DBO.NEXTENSO_CONVERT(@NUMERO, DBO.NEXTENSO_FATOR(@NUMERO)) + CASE FLOOR(@NUMERO)
                                                                            WHEN 0 THEN ''
                                                                            WHEN 1 THEN ' Real'
                                                                            ELSE ' Reais'
                                                                        END + CASE FLOOR(@NUMERO)
                                                                                  WHEN 0 THEN ''
                                                                                  ELSE ' e '
                                                                              END
        SET @NUMERO = @NUMERO - FLOOR(@NUMERO)
        IF @NUMERO > 0 BEGIN
            SET @NUMERO = REPLACE(CAST(@NUMERO AS VARCHAR(20)), '0.', '')
            SET @RET = @RET + DBO.NEXTENSO_CONVERT(@NUMERO, DBO.NEXTENSO_FATOR(@NUMERO)) + CASE @NUMERO
                                                                                   WHEN 1 THEN ' Centavo'
                                                                                   ELSE ' Centavos'
                                                                               END
        END
    END ELSE BEGIN
        SET @RET = 'Zero Reais'
    END
    RETURN @RET
END GO
SELECT DBO.NEXTENSO(0)