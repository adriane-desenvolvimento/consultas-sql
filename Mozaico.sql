SELECT 
  "LAYER", 
  "STATUS", 
  sum("PESO") as "PESO" 
FROM 
  (
    SELECT 
      lpad(
        trim(u.cd_upnivel1), 
        4, 
        0
      ) || lpad(
        decode(
          trim(u.cd_upnivel2), 
          'SEQUEI', 
          '10000', 
          trim(u.cd_upnivel2)
        ), 
        5, 
        0
      ) || lpad(
        trim(u.cd_upnivel3), 
        3, 
        0
      ) as "LAYER", 
      u.cd_upnivel1 as "FAZ", 
      u.cd_upnivel2 as "PIVO", 
      u.cd_upnivel3 as "TALHAO", 
      NVL(APT_PESO.PESO, 0) AS "PESO", 
      CASE WHEN C.fg_situacao = 'A' 
      and NVL(APT_PESO.PESO, 0) = 0 THEN 'PRONTO COLHER' WHEN C.fg_situacao = 'A' 
      and NVL(APT_PESO.PESO, 0) > 0 THEN 'COLHENDO' WHEN C.fg_situacao = 'F' THEN 'COLHIDO' else 'DISPONIVEL' END AS "STATUS" 
    FROM 
      pimscs.upnivel3 u, 
      pimscs.ordem_corte c, 
      (
        SELECT 
          lpad(
            trim(c.cd_upnivel1), 
            4, 
            0
          ) || lpad(
            decode(
              trim(c.cd_upnivel2), 
              'SEQUEI', 
              '10000', 
              trim(c.cd_upnivel2)
            ), 
            5, 
            0
          ) || lpad(
            trim(c.cd_upnivel3), 
            3, 
            0
          ) as "LAYER", 
          Sum(c.qt_liquido) / 1000 AS PESO 
        FROM 
          pimscs.apt_cargas c 
        GROUP BY 
          (
            lpad(
              trim(c.cd_upnivel1), 
              4, 
              0
            ) || lpad(
              decode(
                trim(c.cd_upnivel2), 
                'SEQUEI', 
                '10000', 
                trim(c.cd_upnivel2)
              ), 
              5, 
              0
            ) || lpad(
              trim(c.cd_upnivel3), 
              3, 
              0
            )
          )
      ) apt_peso 
    WHERE 
      u.cd_safra = '22122' 
      and c.CD_UPNIVEL1(+) = u.cd_upnivel1 
      and c.CD_UPNIVEL2(+) = u.cd_upnivel2 
      and c.CD_UPNIVEL3(+) = u.cd_upnivel3 
      and (
        lpad(
          trim(u.cd_upnivel1), 
          4, 
          0
        ) || lpad(
          decode(
            trim(u.cd_upnivel2), 
            'SEQUEI', 
            '10000', 
            trim(u.cd_upnivel2)
          ), 
          5, 
          0
        ) || lpad(
          trim(u.cd_upnivel3), 
          3, 
          0
        )
      ) = apt_peso.layer (+)
  ) crosstabsubquery 
GROUP BY 
  "LAYER", 
  "STATUS" 
ORDER BY 
  "LAYER", 
  "STATUS"