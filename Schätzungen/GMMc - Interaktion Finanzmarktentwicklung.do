* Arbeitsverzeichnis definieren 
cd "hier den Dateipfad eintragen"

* Einlesen des Datensatzes 
use Wieting_MA_4yr_Daten, clear 

xtset country_id year


**# Interaktion mit Finanzmarktentwicklung und ln_sum_16_omori 
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse lag(8 10)) gmm(c.priv_credit##c.ln_sum_16_omori, lag(4 7) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_sum_16_omori, collapse lag(1 3)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_sum_16_omori, collapse lag(5 7)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# Interaktion mit Finanzmarktentwicklung und ln_sum_domestic_omori
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse lag(8 10)) gmm(c.priv_credit##c.ln_sum_domestic_omori, lag(4 7) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_sum_domestic_omori, lag(1 3) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_sum_domestic_omori, collapse lag(2 5)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# Interaktion mit Finanzmarktentwicklung und ln_sum_efw
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt c.priv_credit##c.ln_sum_efw, collapse lag(4 8)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_sum_efw, collapse lag(8 10)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_sum_efw, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep


**# Interaktion mit Finanzmarktentwicklung und ln_KAOPEN 
* Brutto-Gini
xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt c.priv_credit##c.ln_KAOPEN, collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Netto-Gini
xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_KAOPEN, lag(0 .) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* Einkommensanteile
xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_KAOPEN, lag(4 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep



**# Interaktion mit Finanzmarktentwicklung und Brutto-Gini abspeichern und darstellen (GMM[12], GMM[13], GMM[14], GMM[15])
eststo clear

eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse lag(8 10)) gmm(c.priv_credit##c.ln_sum_16_omori, lag(4 7) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse lag(8 10)) gmm(c.priv_credit##c.ln_sum_domestic_omori, lag(4 7) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt c.priv_credit##c.ln_sum_efw, collapse lag(4 8)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt c.priv_credit##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_mkt c.priv_credit##c.ln_KAOPEN, collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-privcredit-gini_mkt.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[12]" "GMM[13]" "GMM[14]" "GMM[15]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Konstante und Jahresdummies sind in die Schätzungen inkludiert, werden jedoch hier aus Platzgründen nicht ausgewiesen (siehe Anhang Tabelle).\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")


**# Interaktion mit Finanzmarktentwicklung und Netto-Gini abspeichern und darstellen (GMM[32], GMM[33], GMM[34], GMM[35])
eststo clear

eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_sum_16_omori, collapse lag(1 3)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_sum_domestic_omori, lag(1 3) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_sum_efw, collapse lag(8 10)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_gini_disp l.ln_gini_disp c.priv_credit##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_gini_disp c.priv_credit##c.ln_KAOPEN, lag(0 .) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-privcredit-gini_disp.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[32]" "GMM[33]" "GMM[34]" "GMM[35]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Werte sind auf drei Nachkommastellen gerundet. Abhängige Variable: Gini-Koeffizient nach Steuern und Abgaben, Omori (2022) Daten, EFW und KAOPEN für die Finanzmarktliberalisierungen.\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")


**# Interaktion mit Finanzmarktentwicklung und Einkommensanteilen abspeichern und darstellen (GMM[36], GMM[37], GMM[38], GMM[39])
eststo clear

eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_sum_16_omori, collapse lag(5 7)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_sum_domestic_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_sum_domestic_omori, collapse lag(2 5)) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_sum_efw gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_sum_efw, lag(8 8) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
eststo: xtabond2 ln_top10bottom50 l.ln_top10bottom50 c.priv_credit##c.ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, gmm(l.ln_top10bottom50 c.priv_credit##c.ln_KAOPEN, lag(4 5) collapse) iv(gdp_per_capita infl_gdp_defl ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-privcredit-ln_top10bottom50.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers nogaps mtitle("GMM[36]" "GMM[37]" "GMM[38]" "GMM[39]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Werte sind auf drei Nachkommastellen gerundet. Abhängige Variable: Einkommensanteile, Omori (2022) Daten, EFW und KAOPEN für die Finanzmarktliberalisierungen.\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")
