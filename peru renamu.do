** 

version 13
global ubicacion "C:\Users\ALFREDO\Desktop\Bases\RENAMU" 


local t = 2007
foreach f  in 208 225 249 269 304 328 388 430 499 538 594 624 {
cd $ubicacion
cap mkdir `t'
cd `t'
	foreach i  in 87 730 731 1345 {
		display "`i'" " " "`t'" " " "`f'"
		cap copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/`f'-Modulo`i'.zip Renamu_`t'_`i'.zip 
		cap unzipfile Renamu_`t'_`i'.zip, replace
		cap erase Renamu_`t'_`i'.zip
}
local t=`t'+1
}


local archivos : dir "$ubicacion\\`t'" files "*.sav"
		foreach file in `archivos' {
		quietly usespss `file', clear
		local file_sin_sav = reverse(substr(reverse(upper("`file'")),5,.))
		save "`file_sin_sav'.dta", replace
}


/* Sexo del alcalde
local t = 2007
foreach f  in 208 226 250 270 305 329 402 432 508 543 609 {
cd $ubicacion
cap mkdir `t'
cd `t'
	foreach i  in 89 {
		display "`i'" " " "`t'" " " "`f'"
		cap copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/`f'-Modulo`i'.zip Renamu_`t'_`i'.zip 
		cap unzipfile Renamu_`t'_`i'.zip, replace
		cap erase Renamu_`t'_`i'.zip
}
local t=`t'+1
}


local archivos : dir "$ubicacion\\`t'" files "*.sav"
		foreach file in `archivos' {
		quietly usespss `file', clear
		local file_sin_sav = reverse(substr(reverse(upper("`file'")),5,.))
		save "`file_sin_sav'.dta", replace
}

