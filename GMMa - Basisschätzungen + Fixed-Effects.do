* Arbeitsverzeichnis definieren 
cd "hier den Dateipfad eintragen"

* Einlesen des Datensatzes 
use Wieting_MA_4yr_Daten, clear 

xtset country_id year


**# FE-Schätzungen 1 bis 4
* FE[4] mit ln_sum_16_omori FE
xtreg ln_gini_mkt ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, fe vce(robust)
* FE[2] mit ln_sum_16_omori ohne Controls FE
xtreg ln_gini_mkt ln_sum_16_omori y*, fe vce(robust)
* FE[3] mit ln_sum_16_omori ohne Jahresdummies FE
xtreg ln_gini_mkt ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling, fe vce(robust)
* FE[1] mit ln_sum_16_omori ohne Jahresdummies und Controls FE
xtreg ln_gini_mkt ln_sum_16_omori, fe vce(robust)



**# GMM-Basis-Schätzungen 1 bis 4
* mit ln_sum_16_omori [GMM4]
xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori infl_gdp_defl gdp_per_capita ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse lag(7 7)) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(infl_gdp_defl gdp_per_capita ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep
* mit ln_sum_16_omori ohne Controls [GMM2]
xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori y*, gmm(l.ln_gini_mkt, lag(7 7) collapse) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(y* ln_bank_superv legor_uk legor_fr) small orthogonal robust twostep
* mit ln_sum_16_omori ohne Jahresdummies [GMM3
xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori infl_gdp_defl gdp_per_capita ln_trade ln_schooling, gmm(l.ln_gini_mkt, lag(7 7) collapse) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(infl_gdp_defl gdp_per_capita ln_trade ln_schooling ln_bank_superv legor_uk legor_fr) small orthogonal robust twostep
* mit ln_sum_16_omori ohne Jahresdummies und Controls [GMM1]
xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori, gmm(l.ln_gini_mkt, lag(8 8) collapse) gmm(ln_sum_16_omori, lag(8 8) collapse) iv(ln_bank_superv legor_uk legor_fr) small orthogonal robust twostep


**# FE-Schätzungen 1 bis 4 abspeichern und darstellen
eststo clear

eststo: xtreg ln_gini_mkt ln_sum_16_omori, fe vce(robust)
eststo: xtreg ln_gini_mkt ln_sum_16_omori y*, fe vce(robust)
eststo: xtreg ln_gini_mkt ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling, fe vce(robust)
eststo: xtreg ln_gini_mkt ln_sum_16_omori gdp_per_capita infl_gdp_defl ln_trade ln_schooling y*, fe vce(robust)
esttab using FE.rtf, b(%9.3f) se(%9.3f) r2(3) nonumbers mtitle("Ohne Jahresdummies und Kontrollvariablen" "Mit Jahresdummies, ohne Kontrollvariablen" "Ohne Jahresdummies, mit Kontrollvariablen" "Mit Jahresdummies, mit Kontrollvariablen") ///
star(* 0.10 ** 0.05 *** 0.01) ///
addnote("Notizen: Standardfehler in den Klammern. Konstante und Jahresdummies sind in die Schätzungen inkludiert, werden jedoch hier aus Platzgründen nicht ausgewiesen (siehe Anhang Tabelle).\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")


**# GMM-Basis-Schätzungen 1 bis 4 abspeichern und darstellen
eststo clear

eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori, gmm(l.ln_gini_mkt, lag(8 8) collapse) gmm(ln_sum_16_omori, lag(8 8) collapse) iv(ln_bank_superv legor_uk legor_fr) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori y*, gmm(l.ln_gini_mkt, lag(7 7) collapse) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(y* ln_bank_superv legor_uk legor_fr) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori infl_gdp_defl gdp_per_capita ln_trade ln_schooling, gmm(l.ln_gini_mkt, collapse lag(7 7)) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(infl_gdp_defl gdp_per_capita ln_trade ln_schooling ln_bank_superv legor_uk legor_fr) small orthogonal robust twostep
eststo: xtabond2 ln_gini_mkt l.ln_gini_mkt ln_sum_16_omori infl_gdp_defl gdp_per_capita ln_trade ln_schooling y*, gmm(l.ln_gini_mkt, collapse lag(7 7)) gmm(ln_sum_16_omori, lag(9 9) collapse) iv(infl_gdp_defl gdp_per_capita ln_trade ln_schooling ln_bank_superv legor_uk legor_fr y*) small orthogonal robust twostep

esttab using GMM-Basis-wide.rtf, b(%9.3f) se(%9.3f) r2(3) wide nonumbers nogaps mtitle("GMM[1]" "GMM[2]" "GMM[3]" "GMM[4]") ///
star(* 0.10 ** 0.05 *** 0.01) ///
nonotes ///
addnote("Notizen: Standardfehler in den Klammern. Konstante und Jahresdummies sind in die Schätzungen inkludiert, werden jedoch hier aus Platzgründen nicht ausgewiesen (siehe Anhang Tabelle).\n* Kennzeichnet Signifikanz zum 10%-Niveau; ** Kennzeichnet Signifikanz zum 5%-Niveau; *** Kennzeichnet Signifikanz zum 1%-Niveau.")