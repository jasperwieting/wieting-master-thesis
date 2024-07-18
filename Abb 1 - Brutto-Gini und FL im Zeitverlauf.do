* Arbeitsverzeichnis definieren 
cd "hier den Dateipfad eintragen"

* Einlesen des Datensatzes 
use Wieting_MA_Rohdaten, clear


* Paneldatenstruktur festlegen
xtset c_id year

* Daten sortieren nach Jahr
sort year

* Durchschnittlichen Gini-Koeffizienten und durchschnittliche Finanzmarktliberalisierungen für jedes Jahr berechnen
collapse (mean) avg_gini_mkt=gini_mkt avg_sum_16_omori=sum_16_omori, by(year)

correlate avg_gini_mkt avg_sum_16_omori

* Verlauf des Brutto-Gini-Koeffizienten und der Finanzmarktliberalisierungen plotten 
		twoway ///
(line avg_gini_mkt year, yaxis(1) lcolor(ebblue) lwidth(thick)) ///
(line avg_sum_16_omori year, yaxis(2) lcolor(maroon) lwidth(thick) lpattern(dash)), ///
ytitle("avg_gini_mkt", axis(1)) ///
ytitle("avg_sum_16_omori", axis(2)) ///
xtitle("Jahr") ///
legend(order(1 "Durschnittlicher Brutto-Gini-Koeffizient (avg_gini_mkt)" 2 "Multidimensionaler Finanzmarktliberalisierungsindex (avg_sum_16_omori)") ///
       position(6) ///
       cols(1)) ///
title("") ///
note("Korrelation = .930", position(4) ring(0) margin(small)) 