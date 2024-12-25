*** Objetivo: Descargar las Bases de Datos de la ENDES 2010-2015
clear all

*32, 150, 183, 194, 209, 238

forvalues j = 2000/2016 {
cap mkdir "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
	if `j'==20000 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/35-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}
	if `j'==20100 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/260-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}	
	else if `j'==20110 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/290-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}
	else if `j'==20120 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/323-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}
	else if `j'==2013 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/407-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}
	else if `j'==2014 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/441-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}
	else if `j'==2015 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/504-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}	
	else if `j'==2016 {
			foreach num of numlist 64/67 69/74 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\\`j'"
				copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/548-Modulo`num'.zip endes`num'.zip
				unzipfile endes`num'.zip, replace
				erase endes`num'.zip		
			}
	}	
	
	}
*


/*
			foreach num of numlist 75/200 {
				cd "C:\Users\ALFREDO\Desktop\Bases\ENDES\"
				cap copy http://iinei.inei.gob.pe/iinei/srienaho/descarga/SPSS/35-Modulo`num'.zip endes`num'.zip	
				}
