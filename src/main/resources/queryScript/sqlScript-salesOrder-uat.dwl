%dw 2.0
output text/plain
---
"SELECT 
    f1.SDADDJ, 
    f1.SDSHPN, 
    f1.SDKCOO, 
    f1.SDUNCS, 
    f1.SDSHAN, 
    f1.SDDCTO, 
    f1.SDDOCO, 
    f1.SDLNID, 
    f1.SDAEXP, 
    f1.SDUPRC, 
    f1.SDLITM, 
    f1.SDUORG, 
    f1.SDSOQS, 
    f1.SDVR02, 
    f1.SDVR01, 
    f1.SDPPDJ, 
    f1.SDCRCD,
    f1.SDRLNU,
    f1.SDCARS,
    f2.ABALPH, 
    f3.AXDC, 
    f4.IVCITM, 
    f5.DRDL01,
    f5.DRKY,
    f6.IMDRAW, 
    f7.IBPRP1, 
    f7.IBSRP4,
    f8.DRDL01 AS DRDLO1_FREIGHT,
    f8.DRKY AS FREIGHT_DRKY
FROM 
    CRPDTA.F4211 f1
LEFT JOIN 
    CRPDTA.F0101 f2 
ON 
    TRIM(f2.ABAN8) = TRIM(f1.SDCARS)
LEFT JOIN 
    CRPDTA.F4780 f3 
ON 
    TRIM(f3.AXAN8) = TRIM(f1.SDSHAN) 
    AND TRIM(f3.AXXRTS) = 'SF'
LEFT JOIN 
    CRPDTA.F4104 f4 
ON 
    TRIM(f4.IVLITM) = TRIM(f1.SDLITM) 
    AND f4.IVXRT = 'C' 
    AND TRIM(f4.IVEFTJ) <= $(vars.jobRun.date) 
    AND TRIM(f4.IVEXDJ) >= $(vars.jobRun.date)
LEFT JOIN 
    CRPCTL.F0005 f5 
ON 
    TRIM(f5.DRKY) = 
        (CASE 
            WHEN (TRIM(f1.SDNXTR) = '999' OR TRIM(f1.SDNXTR) = '987' OR TRIM(f1.SDNXTR) = '902') 
            THEN TRIM(f1.SDNXTR) 
            ELSE TRIM(f1.SDLTTR) 
        END)  
    AND TRIM(f5.DRSY) = '40' 
    AND TRIM(f5.DRRT) = 'AT'
LEFT JOIN 
    CRPCTL.F0005 f8
ON  TRIM(f8.DRKY) = TRIM(f1.SDFRTH)
    AND TRIM(f8.DRSY) = '42' 
    AND TRIM(f8.DRRT) = 'FR'
LEFT JOIN 
    CRPDTA.F4101 f6 
ON 
    TRIM(f6.IMLITM) = TRIM(f1.SDLITM)
LEFT JOIN 
    CRPDTA.F4102 f7 
ON 
    TRIM(f7.IBMCU) = '1801' 
    AND TRIM(f7.IBLITM) = trim(F1.SDLITM)
WHERE
    TRIM(f1.SDUPMJ) >= $(vars.jobRun.date)
    AND TRIM(f1.SDTDAY) < $(vars.previousJobRun.time) 
	AND trim(f1.SDMCU) = '1801'
    AND trim(f1.SDKCOO) = '00010' 
    AND trim(f1.SDVR02) LIKE '%SA-%'
    AND trim(f1.SDSHAN) IN ('30256','30257')"