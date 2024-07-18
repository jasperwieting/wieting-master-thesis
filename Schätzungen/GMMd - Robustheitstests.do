* Arbeitsverzeichnis definieren 
cd "hier den Dateipfad eintragen"

* Einlesen des Datensatzes 
use Wieting_MA_4yr_Daten, clear 

xtset country_id year

**# ln_sum_16_omori bei unterschiedlichen Liberalisierungsindizes
xtabond2 ln_gini_disp l.ln_gini_disp ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp, lag(6 6) collapse) gmm(ln_sum_16_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(2 2) collapse) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# ln_sum_domestic_omori bei unterschiedlichen Liberalisierungsindizes
xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, lag(6 6) collapse) gmm(ln_sum_domestic_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

xtabond2 ln_gini_disp l.ln_gini_disp ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp, lag(6 6) collapse) gmm(ln_sum_domestic_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(2 2) collapse) gmm(ln_sum_domestic_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# ln_sum_efw bei unterschiedlichen Liberalisierungsindizes
xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, lag(4 7) collapse) gmm(ln_sum_efw, lag(3 6) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

xtabond2 ln_gini_disp l.ln_gini_disp ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp ln_sum_efw, lag(3 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(4 7) collapse) gmm(ln_sum_efw, lag(3 6) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# ln_KAOPEN bei unterschiedlichen Liberalisierungsindizes
xtabond2 ln_gini_mkt l.ln_gini_mkt ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt ln_KAOPEN, lag(6 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

xtabond2 ln_gini_disp l.ln_gini_disp ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp ln_KAOPEN, lag(6 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 ln_KAOPEN, lag(2 2) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep



*Brutto-Gini bei den verschiedenen Liberalisierungsindizes abspeichern und darstellen (GMM[5], GMM[6], GMM[7])
eststo clear

eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, lag(6 6) collapse) gmm(ln_sum_domestic_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, lag(4 7) collapse) gmm(ln_sum_efw, lag(3 6) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt ln_KAOPEN, lag(6 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-gini_mkt-verschiedeneFL.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[5]" "GMM[6]" "GMM[7]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Konstante und Jahresdummies sind in die Schätzungen inkludiert, werden jedoch hier aus Platzgründen nicht ausgewiesen (siehe Anhang Tabelle A.7).\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")


*Netto-Gini bei verschiedenen Liberalisierungsindizes abspeichern und darstellen (GMM[16], GMM[17], GMM[18], GMM[19])
eststo clear

eststo:xtabond2 ln_gini_disp l.ln_gini_disp ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp, lag(6 6) collapse) gmm(ln_sum_16_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp, lag(6 6) collapse) gmm(ln_sum_domestic_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp ln_sum_efw, lag(3 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp ln_KAOPEN, lag(6 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-gini_disp-verschiedeneFL_wide.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[16]" "GMM[17]" "GMM[18]" "GMM[19]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Werte sind auf drei Nachkommastellen gerundet. Abhängige Variable: Gini-Koeffizient nach Steuern und Abgaben, Omori (2022) Daten, EFW und KAOPEN für die Finanzmarktliberalisierungen.\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")



*Einkommensanteile bei verschiedenen Liberalisierungsindizes abspeichern und darstellen (GMM[20], GMM[21], GMM[22], GMM[23])
eststo clear

eststo:xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(2 2) collapse) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(2 2) collapse) gmm(ln_sum_domestic_omori, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50, lag(4 7) collapse) gmm(ln_sum_efw, lag(3 6) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 ln_KAOPEN, lag(2 2) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-ln_top10bottom50-verschiedeneFL.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[20]" "GMM[21]" "GMM[22]" "GMM[23]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Werte sind auf drei Nachkommastellen gerundet. Abhängige Variable: Einkommensanteile vor Steuern und Abgaben, Omori (2022) Daten, EFW und KAOPEN für die Finanzmarktliberalisierungen.\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")
