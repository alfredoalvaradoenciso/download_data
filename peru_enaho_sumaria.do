********************  
** Download and standardize all ENAHO datasets and include them all in a single folder per year. Data are saved in "ENAHO\year" regardless of "mod" and "i" code

clear
set more off, perma
gl path "C:\Users\Dell\Documents\ENAHO"

cap mkdir $path

local year = 2015
foreach mod of numlist 498 440 404 324 291 279 285 284 283 282 281 280 {
cd $path
cap mkdir `year'
cd `year'
	display "`year' `mod'"
	copy "http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo34.zip" "sumaria-`year'.zip"
	unzipfile sumaria-`year'.zip, replace
	local file_list : dir "." files "*", respectcase
	foreach file of local file_list {
		local lowercase_name `=strlower("`file'")'
		local name `=subinstr("`lowercase_name'","_","-",.)'
		!rename "`file'" "`name'"
	}
	cap cd "`mod'-Modulo34"
		if _rc==0 {
		display "`year' `mod'"
		cap local file_list : dir "." files "*", respectcase
		foreach file of local file_list {
			local lowercase_name `=strlower("`file'")'
			local name `=subinstr("`lowercase_name'","_","-",.)'
		   !rename "`file'" "`name'"
			copy "sumaria-`year'.dta" "..\sumaria-`year'.dta"
			erase "sumaria-`year'.dta"
		   }
	   }
	local year = `year' - 1
}