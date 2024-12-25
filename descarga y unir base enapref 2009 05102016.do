clear 
set more off

/* El código descarga todas las bases de la Encuesta Nacional de Presupuestos Familiares 2008-2009 
en una carpeta.  A partir de la línea 23, el código une todas las bases en una sola identificando el
gasto por individuo y código de producto
*/

global ubicacion "D:\ALVARADO\Bases\ENAPREF" 
cap mkdir $ubicacion
cd $ubicacion

forval mod = 190/206 {
display  "`mod'"
cap copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/332-Modulo`mod'.zip enapref_`mod'.zip 
cap unzipfile enapref_`mod'.zip , replace
cap erase enapref_`mod'.zip 
		local archivos : dir "$ubicacion\332-Modulo`mod'" files "*.sav"
		foreach file in `archivos' {
		quietly usespss "$ubicacion\332-Modulo`mod'\\`file'", clear
		local file_sin_sav = reverse(substr(reverse(upper("`file'")),5,.))
		save "`file_sin_sav'.dta", replace
}
}
****************************************** DIARIO 

use "P401_GASTO DIARIO HOGAR - BIENES Y SERVICIOS", clear
rename P401_A_COD_O CODIGO
rename I401_G GASTOD1 
gen PRECIOD1=P401_G/P401_B1
*gen sinmarca=(P401_C_COD=="88888888")
collapse (sum) GASTO (mean) PRECIO ,  by(CONG VIV HOG CODIGO)
tempfile p401
save `p401'

use "P402_GASTO DIARIO HOGAR - MEDICINAS Y OTROS", clear
rename P402_A_COD_O CODIGO
rename I402_G GASTOD2 
*gen sinmarca=(P402_C_COD=="88888888")
gen PRECIOD2=P402_G/P402_B1
collapse (sum) GASTO  (mean) PRECIO ,  by(CONG VIV HOG CODIGO)
tempfile p402
save `p402'

use "P501_GASTO DIARIO PERSONAL - BIENES Y SERVICIOS", clear
rename P501_A_COD_O CODIGO
rename I501_G GASTOD3 
*gen sinmarca=(P501_C_COD=="88888888")
gen PRECIOD3=P501_G/P501_B1
collapse (sum) GASTO  (mean) PRECIO ,  by(CONG VIV HOG CODIGO)
tempfile p501
save `p501'

use "P502_GASTO DIARIO PERSONAL - MEDICINAS Y OTROS", clear
rename P502_A_COD_O CODIGO
rename I502_G GASTOD4 
gen PRECIOD4=P502_G/P502_B1
*gen sinmarca=(P502_C_COD=="88888888")
collapse (sum) GASTO  (mean) PRECIO,  by(CONG VIV HOG CODIGO)
tempfile p502
save `p502'

********************************************** MENSUAL

use "P601_GASTO MENSUAL - ENSE¤ANZA", clear
egen GASTOM1=rowtotal(I601_C1 I601_D1 I601_E1 I601_F1 I601_G1 I601_H1)
egen PRECIOM1=rowmean(P601_C1 P601_D1 P601_E1 P601_F1 P601_G1 P601_H1)
collapse (sum) GASTO (mean) PRECIO, by(CONGLOME VIVIENDA HOGAR)
gen CODIGO="0600000000" // Falta codificar, provicionalmente todo está en "Salud" 0600000000
*gen sinmarca=1
tempfile p601
save `p601'

use "P603_GASTO MENSUAL - CUIDADO PERSONAL", clear
rename P603_A_COD_O CODIGO
rename I603_G GASTOM2 
gen PRECIOM2=P603_G/P603_B1
*gen sinmarca=(P603_C_COD=="88888888")
collapse (sum) GASTO (mean) PRECIO ,by(CONG VIV HOG CODIGO)
tempfile p603
save `p603'

use "P604_GASTO MENSUAL - MEDICINAS Y OTROS", clear
rename P604_A_COD_O CODIGO
rename I604_G GASTOM3
gen PRECIOM3=P604_G/P604_B1
*gen sinmarca=(P604_C_COD=="88888888")
/*
destring P604_D_COD, gen(forma)
replace forma=1 if forma==3 | forma==7 | forma==14 | forma== 27 | forma== 32
replace forma=2 if forma==4
replace forma=3 if forma>=3 & forma!=.
*/
collapse (sum) GASTO (mean) PRECIO , by(CONG VIV HOG CODIGO)
tempfile p604
save `p604'


use "P605_GASTO MENSUAL - OTROS GASTOS", clear
rename P605_A_COD_O CODIGO
rename I605_G GASTOM4 
gen PRECIOM4=P605_G/P605_B1
*gen sinmarca=(P605_C_COD=="88888888")
collapse (sum) GASTO (mean) PRECIO ,by(CONG VIV HOG CODIGO)
tempfile p605
save `p605'

********************************************* TRIMESTRAL

use "P606_GASTO TRIMESTRAL", clear
rename P606_A_COD_O CODIGO
rename I606_G GASTOT 
gen PRECIOT=P606_G/P606_B1
*gen sinmarca=(P606_C_COD=="88888888")
collapse (sum) GASTO  (mean) PRECIO ,by(CONG VIV HOG  CODIGO)
tempfile p606
save `p606'

*********************************************** ANUAL

use "P607_GASTO ANUAL", clear
rename P607_A_COD_O CODIGO
rename I607_G GASTOA1 
gen PRECIOA1=P607_G/P607_B1
*gen sinmarca=(P607_C_COD=="88888888")
collapse (sum) GASTO (mean) PRECIO  ,by(CONG VIV HOG CODIGO)
tempfile p607
save `p607'

use "P602_GASTO ANUAL - ENSE¤ANZA", clear
egen GASTOA2=rowtotal(I602_C-I602_H )
egen PRECIOA2=rowmean(P602_C-P602_H )
collapse (sum) GASTO (mean) PRECIO , by(CONGLOME VIVIENDA HOGAR)
gen CODIGO="0600000000" // Falta codificar, provicionalmente todo está en "Salud" 0600000000
*gen sinmarca=1
tempfile p602
save `p602'

use "CAP. 100_VIVIENDA-HOGAR.dta", clear
keep if RFINAL==1 | RFINAL==2
egen GASTOV=rowtotal(I110_A1-I110_A9 I111_C1-I111_C8 I112_A1-I112_A5 I113_A1-I113_A9 I116_A1-I116_A9)
egen PRECIOV=rowmean(P110_A1 P110_A2 P110_A3 P110_A4 P110_A5 P110_A6 P110_A7 P110_A8 P110_A9 ///
P111_C1 P111_C2 P111_C3 P111_C4 P111_C5 P111_C6 P111_C7 P111_C8 P112_A1 P112_A2 P112_A3 P112_A4 P112_A5 ///
P113_A1 P113_A2 P113_A3 P113_A4 P113_A5 P113_A6 P113_A7 P113_A8 P113_A9 P116_A1 P116_A2 P116_A3 P116_A4 ///
 P116_A5 P116_A6 P116_A7 P116_A8 P116_A9)
collapse (sum) GASTO (mean) PRECIO, by(CONGLOME VIVIENDA HOGAR)
gen CODIGO="0400000000" // Falta codificar, provicionalmente todo está en "Alojamiento, agua, electricidad, gas y otros combustibles" 0400000000
*gen sinmarca=1
tempfile p100
save `p100'


*********************************************** UNIÓN DE BASES

use `p401', clear
foreach i in p402 p501 p502 p601 p602 p603 p604 p605 p606 p607 p100 {
merge 1:1 CONG VIV HOG CODIGO  using ``i'', nogen
}
egen GASTO=rowtotal(GASTO*)
egen PRECIO=rowmean(PRECIO*)
format GASTO* %15.2fc
* br if PRECIO==. & GASTO!=0 // se observa 9 observaciones sin precio que resultan tener gasto gracias a la imputación del INEI.
merge m:1 CONG VIVI HOG using "SUMARIA", nogen keepus(MIEPERHO DOMINIO ESTRATO FACTOR_EXPANSION_2008 )
saveold "Gasto total unido ENAPREF", replace
