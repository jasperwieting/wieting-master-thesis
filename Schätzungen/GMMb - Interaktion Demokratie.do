* Arbeitsverzeichnis definieren 
cd "hier den Dateipfad eintragen"

* Einlesen des Datensatzes 
use Wieting_MA_4yr_Daten, clear 

xtset country_id year

**# Interaktion mit Demokratie und ln_sum_16_omori
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_sum_16_omori, lag(3 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp, collapse) gmm(c.egaldem_scal##c.ln_sum_16_omori, lag(3 6) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile 
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(6 10) collapse) gmm(c.egaldem_scal##c.ln_sum_16_omori, lag(7 10) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# Interaktion mit Demokratie und ln_sum_domestic_omori
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_sum_domestic_omori, lag(3 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.egaldem_scal##c.ln_sum_domestic_omori, lag(5 5)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(6 10) collapse) gmm(c.egaldem_scal##c.ln_sum_domestic_omori, lag(7 7) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# Interaktion mit Demokratie und ln_sum_efw
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_sum_efw, lag(5 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.egaldem_scal##c.ln_sum_efw, lag(8 8)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(8 10) collapse) gmm(c.egaldem_scal##c.ln_sum_efw, collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# Interaktion mit Demokratie und ln_KAOPEN
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_KAOPEN, lag(4 .) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*,gmm(l.ln_gini_disp, collapse lag(2 6)) gmm(c.egaldem_scal##c.ln_KAOPEN, lag(8 10) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(4 .) collapse) gmm(c.egaldem_scal##c.KAOPEN, collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep



**# Interaktion mit Demokratie und Brutto-Gini abspeichern und darstellen (GMM[8], GMM[9], GMM[10], GMM[11])
eststo clear

eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_sum_16_omori, lag(3 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_sum_domestic_omori, lag(3 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_sum_efw, lag(5 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.egaldem_scal##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse) gmm(c.egaldem_scal##c.ln_KAOPEN, lag(4 .) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-vdem-gini_mkt.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[8]" "GMM[9]" "GMM[10]" "GMM[11]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Konstante und Jahresdummies sind in die Schätzungen inkludiert, werden jedoch hier aus Platzgründen nicht ausgewiesen (siehe Anhang Tabelle).\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")


**# Interaktion mit Demokratie und Netto-Gini abspeichern und darstellen (GMM[24], GMM[25], GMM[26], GMM[27])
eststo clear

eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp, collapse) gmm(c.egaldem_scal##c.ln_sum_16_omori, lag(3 6) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.egaldem_scal##c.ln_sum_domestic_omori, lag(5 5)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.egaldem_scal##c.ln_sum_efw, lag(8 8)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.egaldem_scal##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*,gmm(l.ln_gini_disp, collapse lag(2 6)) gmm(c.egaldem_scal##c.ln_KAOPEN, lag(8 10) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


esttab using GMM-vdem-gini_disp.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[24]" "GMM[25]" "GMM[26]" "GMM[27]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Werte sind auf drei Nachkommastellen gerundet. Abhängige Variable: Gini-Koeffizient nach Steuern und Abgaben, Omori (2022) Daten, EFW und KAOPEN für die Finanzmarktliberalisierungen.\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")


**# Interaktion mit Demokratie und Einkommensanteilen abspeichern und darstellen (GMM[28], GMM[29], GMM[30], GMM[31])
eststo clear

eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(6 10) collapse) gmm(c.egaldem_scal##c.ln_sum_16_omori, lag(7 10) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(6 10) collapse) gmm(c.egaldem_scal##c.ln_sum_domestic_omori, lag(7 7) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(8 10) collapse) gmm(c.egaldem_scal##c.ln_sum_efw, collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.egaldem_scal##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(4 .) collapse) gmm(c.egaldem_scal##c.KAOPEN, collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


esttab using GMM-vdem-ln_top10bottom50.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[28]" "GMM[29]" "GMM[30]" "GMM[31]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Werte sind auf drei Nachkommastellen gerundet. Abhängige Variable: Einkommensanteile, Omori (2022) Daten, EFW und KAOPEN für die Finanzmarktliberalisierungen.\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")

