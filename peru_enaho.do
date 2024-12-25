********************  
** Download and standardize all ENAHO datasets and include them all in a single folder per year. Data are saved in "ENAHO\year" regardless of "mod" and "i" code

clear
set more off, perma
gl user "Dell"
gl ubicacion "C:\Users\\$user\Desktop\Bases\ENAHO" 

cap mkdir $ubicacion

local year = 2015
foreach mod of numlist 498 440 404 324 291 279 285 284 283 282 281 280{
cd $ubicacion
cap mkdir `year'
cd `year'
qui foreach r of numlist 1/85 {
	if `r'<=9 local i = "0`r'"
	else local i = "`r'"
	display "`i'" " " "`year'" " " "`mod'"
	cap copy "http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo`i'.zip" "enaho_`year'_mod_`i'.zip"
	cap unzipfile enaho_`year'_mod_`i'.zip, replace
	cap copy "SUMARIA_`year'.dta" "SUMARIA-`year'1.dta"
	cap copy "SUMARIA-`year'.dta" "SUMARIA-`year'1.dta"
	cap erase "SUMARIA-`year'.dta"
	cap copy "SUMARIA-`year'1.dta" "sumaria-`year'.dta"
	cap erase "SUMARIA-`year'1.dta"
	cap copy "sumaria_`year'.dta" "sumaria-`year'.dta"
	cap erase "sumaria_`year'.dta" 
	cap copy "`mod'-Modulo`i'\SUMARIA-`year'.dta" "sumaria-`year'.dta"
	cap copy "`mod'-Modulo`i'\SUMARIA_`year'.dta" "sumaria-`year'.dta"
	cap copy "`mod'-Modulo`i'\sumaria_`yea	r'.dta" "sumaria-`year'.dta"
	cap copy "`mod'-Modulo`i'\sumaria-`year'.dta" "sumaria-`year'.dta"
	cap confirm file enaho_`year'_mod_`i'.zip
    if _rc==0 {
		foreach t in Enaho01A Enaho01B Enaho01 Enaho02 Enaho04 {
		local lowert `=lower("`t'")'
			foreach j in 100 200 300 400 500 601 602 602a 603 604 605 606 607 609 610 611 612 700 700a 700b 2000 2000a 2100 2200 2300 2400 250a 2400 2500 2600 2700 1-preg-1-a-13 2-preg-14-a-22 2-preg-9 3-preg-10 4-preg-14-a-22 5-preg-23 3-preg-23 4-preg-24 5-preg-25 6-preg-26-a-32 606d 800a 800b 1 2 3 {
			cap copy "`t'_`year'_`j'.dta" "`t'-`year'-`j'1.dta"
			cap copy "`t'-`year'-`j'.dta" "`t'-`year'-`j'1.dta"
			cap erase "`t'-`year'-`j'.dta"
			cap copy "`t'-`year'-`j'1.dta" "`lowert'-`year'-`j'.dta"
			cap erase "`t'-`year'-`j'1.dta"
			cap copy "`lowert'_`year'_`j'.dta" "`lowert'-`year'-`j'.dta"
			cap erase "`lowert'_`year'_`j'.dta" 
			cap copy "`mod'-Modulo`i'\\`t'-`year'-`j'.dta" "`lowert'-`year'-`j'.dta"
			cap copy "`mod'-Modulo`i'\\`lowert'-`year'-`j'.dta" "`lowert'-`year'-`j'.dta"
			cap copy "`mod'-Modulo`i'\\`t'_`year'_`j'.dta" "`lowert'-`year'-`j'.dta"
			cap copy "`mod'-Modulo`i'\\`lowert'_`year'_`j'.dta" "`lowert'-`year'-`j'.dta"
			cap copy "440-Modulo03\enaho01a-20114-300.dta" "enaho01a-2014-300.dta"
			}
		cap erase enaho_`year'_mod_`i'.zip
		}
	}
	}
	local year = `year' - 1
}
