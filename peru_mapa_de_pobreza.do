
global ubicacion "C:\Users\ALFREDO\Desktop\Bases\Mapa de pobreza" 

cap mkdir $ubicacion
cd $ubicacion


forval mod = 458/482 {
local dep = `mod'-457
foreach i in 632 633 634 635 {
display "`i'" " "  "`dep'"
cap copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo`i'.zip mapa_pobreza_`dep'.zip 
cap unzipfile mapa_pobreza_`dep'.zip , replace
cap erase mapa_pobreza_`dep'.zip

}
}

qui foreach dep of numlist 1/25 {
if `dep'<=9 local CCDD="0`dep'"
	else local CCDD="`dep'"
	noi di "`CCDD'"
	
cap copy "$ubicacion\enaho_`CCDD'.dta" "$ubicacion\enaho_`dep'.dta"
erase "$ubicacion\enaho_`CCDD'.dta" 
cap copy "$ubicacion\enaho_ext_`CCDD'.dta" "$ubicacion\enaho_ext_`dep'.dta"
erase "$ubicacion\enaho_ext_`CCDD'.dta" 
cap copy "$ubicacion\sisfoh_`CCDD'.dta"  "$ubicacion\sisfoh_`dep'.dta"
erase "$ubicacion\sisfoh_`CCDD'.dta"  
cap copy "$ubicacion\sisfoh_ext_`CCDD'.dta" "$ubicacion\sisfoh_ext_`dep'.dta"
erase "$ubicacion\sisfoh_ext_`CCDD'.dta" 
cap copy "$ubicacion\ydump_`CCDD'.dta" "$ubicacion\ydump_`dep'.dta"
erase "$ubicacion\ydump_`CCDD'.dta" 
}


http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/458-Modulo632.zip
http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/459-Modulo632.zip
http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/460-Modulo632.zip

http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/482-Modulo632.zip

http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/461-Modulo632.zip
http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/461-Modulo633.zip
http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/461-Modulo634.zip
http://iinei.inei.gob.pe/iinei/srienaho/descarga/STATA/461-Modulo635.zip
