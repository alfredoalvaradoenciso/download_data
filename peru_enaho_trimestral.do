
** Download and standardize all ENAHO trimester datasets and include them all in a single folder per year. Data are saved in "ENAHO\Trimestres\t" where "t" is the trimester (regardless of "mod" and "i" codes)

clear
set more off, perma
gl user "Dell"
gl ubicacion "C:\Users\\$user\Desktop\Bases\ENAHO\Trimestres" 

cap mkdir $ubicacion

forval y = 2011/2017 {
cd $ubicacion
cap mkdir `y'
cd `y'
if `y'==2011 {
local t = 1
foreach mod in 307 308 309 310{
cap mkdir `t'
cd `t'
forval i =1/5 {
display "`i'" " " "`y'" " " "`mod'"
copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo0`i'.zip enaho_`y'_mod_`i'.zip 
quietly unzipfile enaho_`y'_mod_`i'.zip, replace
erase enaho_`y'_mod_`i'.zip 
cap local archivos : dir "`mod'-Modulo0`i'" files "*.dta"
	if _rc==0 {
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
				dis "`file' in folder"
				use "`mod'-Modulo0`i'\\`file'", clear
				save "`file2'", replace
		}
	}
}
local archivos : dir "`pwd'" files "*.dta"
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
			if "`file'"!="`file2'" {
				dis "`file' renamed"
				use `file', clear
				save "`file2'", replace
			}
		}
local t = `t' + 1
cd ".."
}
}
if `y'==2012 {
local t = 1
foreach mod in 311 312 317 321 {
cap mkdir `t'
cd `t'
forval i =1/5 {
display "`i'" " " "`y'" " " "`mod'"
copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo0`i'.zip enaho_`y'_mod_`i'.zip 
quietly unzipfile enaho_`y'_mod_`i'.zip, replace
erase enaho_`y'_mod_`i'.zip 
cap local archivos : dir "`mod'-Modulo0`i'" files "*.dta"
	if _rc==0 {
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
				dis "`file' in folder"
				use "`mod'-Modulo0`i'\\`file'", clear
				save "`file2'", replace
		}
	}
}

local archivos : dir "`pwd'" files "*.dta"
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
		cap use `file', clear
		if "`file'"!="`file2'" {
		dis "`file' renamed"
		use `file', clear
		save "`file2'", replace
			}
		}
local t = `t' + 1
cd ".."
}
}
if `y'==2013 {
local t = 1
foreach mod in 331 365 389 399 {
cap mkdir `t'
cd `t'
forval i =1/5 {
display "`i'" " " "`y'" " " "`mod'"
copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo0`i'.zip enaho_`y'_mod_`i'.zip 
quietly unzipfile enaho_`y'_mod_`i'.zip, replace
erase enaho_`y'_mod_`i'.zip 
cap local archivos : dir "`mod'-Modulo0`i'" files "*.dta"
	if _rc==0 {
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
				dis "`file' in folder"
				use "`mod'-Modulo0`i'\\`file'", clear
				save "`file2'", replace
		}
	}
}

local archivos : dir "`pwd'" files "*.dta"
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
		cap use `file', clear
		if "`file'"!="`file2'" {	
		dis "`file' renamed"
		use `file', clear
		save "`file2'", replace
			}
		}
local t = `t' + 1
cd ".."
}
}
if `y'==2014 {
local t = 1
foreach mod in 415 424 433 437 {
cap mkdir `t'
cd `t'
forval i =1/5 {
display "`i'" " " "`y'" " " "`mod'"
copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo0`i'.zip enaho_`y'_mod_`i'.zip 
quietly unzipfile enaho_`y'_mod_`i'.zip, replace
erase enaho_`y'_mod_`i'.zip 

cap local archivos : dir "`mod'-Modulo0`i'" files "*.dta"
	if _rc==0 {
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
				dis "`file' in folder"
				use "`mod'-Modulo0`i'\\`file'", clear
				save "`file2'", replace
		}
	}
}

local archivos : dir "`pwd'" files "*.dta"
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
		if "`file'"!="`file2'" {		
		use `file', clear
		dis "`file' renamed"
		save "`file2'", replace
			}
		}

local t = `t' + 1
cd ".."
}
}
if `y'==2015 {
local t = 1
foreach mod in 446 452 484 494 {
cap mkdir `t'
cd `t'
forval i =1/5 {
display "`i'" " " "`y'" " " "`mod'"
copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo0`i'.zip enaho_`y'_mod_`i'.zip 
quietly unzipfile enaho_`y'_mod_`i'.zip, replace
erase enaho_`y'_mod_`i'.zip 

cap local archivos : dir "`mod'-Modulo0`i'" files "*.dta"
	if _rc==0 {
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
				dis "`file' in folder"
				use "`mod'-Modulo0`i'\\`file'", clear
				save "`file2'", replace
		}
	}
}

local archivos : dir "`pwd'" files "*.dta"
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
		cap use `file', clear
		if "`file'"!="`file2'" {		
		dis "`file' renamed"
		use `file', clear
		save "`file2'", replace
		}
	}

local t = `t' + 1
cd ".."
}
}
if `y'==2016 {
local t = 1
foreach mod in 510 528 536 536 {
cap mkdir `t'
cd `t'
forval i =1/5 {
display "`i'" " " "`y'" " " "`mod'"
copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo0`i'.zip enaho_`y'_mod_`i'.zip 
quietly unzipfile enaho_`y'_mod_`i'.zip, replace
erase enaho_`y'_mod_`i'.zip 

cap local archivos : dir "`mod'-Modulo0`i'" files "*.dta"
	if _rc==0 {
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
				dis "`file' in folder"
				use "`mod'-Modulo0`i'\\`file'", clear
				save "`file2'", replace
		}
	}
}

local archivos : dir "`pwd'" files "*.dta"
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
		cap use `file', clear
		if "`file'"!="`file2'" {		
		use `file', clear
		dis "`file' renamed"
		save "`file2'", replace
		}
	}


local t = `t' + 1
cd ".."
}
}
if `y'==2017 {
local t = 1
foreach mod in 551 583 588 600  {
cap mkdir `t'
cd `t'
forval i =1/5 {
display "`i'" " " "`y'" " " "`mod'"
copy http://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/`mod'-Modulo0`i'.zip enaho_`y'_mod_`i'.zip 
quietly unzipfile enaho_`y'_mod_`i'.zip, replace
erase enaho_`y'_mod_`i'.zip 

cap local archivos : dir "`mod'-Modulo0`i'" files "*.dta"
	if _rc==0 {
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
				dis "`file' in folder"
				use "`mod'-Modulo0`i'\\`file'", clear
				save "`file2'", replace
		}
	}
}

local archivos : dir "`pwd'" files "*.dta"
		foreach file in `archivos' {
		local file2 = lower(subinstr("`file'","_","-",.))
		cap use `file', clear
		if "`file'"!="`file2'" {		
		dis "`file' renamed"
		use `file', clear
		save "`file2'", replace
		}
	}

local t = `t' + 1
cd ".."
}
}
}
**Some folders (e.g. in 4 trimester of 2013) are not standarized because they have a folder name "xxx". 
