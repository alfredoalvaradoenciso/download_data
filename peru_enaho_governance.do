/* Standardize ENAHO Governance (Modulo de Gobernabilidad) datasets and include them all in a single folder per year. Data are saved in "ENAHO\year" regardless of "mod" and "i" codes */

clear
set more off, perma
gl user "Dell"
gl ubicacion "C:\Users\\$user\Desktop\Bases\ENAHO" 

cap mkdir $ubicacion
local year = 2018
foreach mod of numlist 634 603 546 498 440 404 324 291 279 285 284 283 282 281 280 {
cd $ubicacion
cap mkdir `year'
cd `year'
foreach i in 85 {
display "`i'" " " "`year'" " " "`mod'"
cap copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo`i'.zip enaho_`year'_mod_`i'.zip 
cap unzipfile enaho_`year'_mod_`i'.zip, replace
cap erase enaho_`year'_mod_`i'.zip
}
local year = `year' - 1
}


local year = 2018 
foreach i in 85 {
foreach mod of numlist 634 603 546 498 440 404 324 291 279 285 284 283 282 281 280 {
foreach j in  1 2 3 {
cd $ubicacion
cd `year'
display  "`year'" " " "`j'"
cap copy "Enaho01B-`year'-`j'.dta" "Enaho01B-`year'-`j'1.dta"
cap erase "Enaho01B-`year'-`j'.dta"
cap copy "Enaho01B-`year'-`j'1.dta" "enaho01b-`year'-`j'.dta"
cap erase "Enaho01B-`year'-`j'1.dta"
cap copy "enaho01b_`year'_`j'.dta" "enaho01b-`year'-`j'.dta"
cap erase "enaho01b_`year'_`j'.dta" 
cap copy "`mod'-Modulo`i'\enaho01b_`year'_`j'.dta" "enaho01b-`year'-`j'.dta"
cap copy "`mod'-Modulo`i'\enaho01b-`year'-`j'.dta" "enaho01b-`year'-`j'.dta" 
}
local year = `year' - 1
}
}
