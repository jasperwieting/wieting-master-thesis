* Arbeitsverzeichnis definieren 
cd "hier den Dateipfad eintragen"

* Einlesen des Datensatzes 
use Wieting_MA_4yr_Daten, clear

xtset country_id year

*Deskriptive Statistik 
estpost sum ln_gini_mkt ln_gini_disp ln_top10bottom50 ln_sum_16_omori ln_sum_domestic_omori ln_sum_efw ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling egaldem_scal priv_credit legor_uk legor_fr ln_bank_superv
esttab using Deskriptiv.rtf, cells("N(fmt(3)) mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3))") nomtitle nonumber

*Korrelationsmatrix
correlate ln_gini_mkt ln_gini_disp ln_top10bottom50 ln_sum_16_omori ln_sum_domestic_omori ln_sum_efw ln_KAOPEN gdp_per_capita infl_gdp_defl ln_trade ln_schooling egaldem_scal priv_credit legor_uk legor_fr ln_bank_superv






