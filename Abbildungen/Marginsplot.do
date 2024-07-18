graph set window fontface "calibri"


*Code-Listings für die Abbidlungen, die die marginalen Effekte der unterschiedlichen Liberalisierungsindizes /// 
bei verschiedenen Ausprägungen der Demokratie/Finanzmarktentwicklung anzeigen


**# Verschiedene Ausprägungen der Demokratie
**# ln_sum_16_omori
margins, dydx(ln_sum_16_omori) at(egaldem_scal=(0(1)100))

marginsplot, xdimension(egaldem_scal) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_sum_16_omori") ///
xtitle("Grad der Demokratie (egaldem_scal)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist egaldem_scal, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.2) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))


**# ln_sum_domestic_omori
margins, dydx(ln_sum_domestic_omori) at(egaldem_scal=(0(1)100))

marginsplot, xdimension(egaldem_scal) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_sum_domestic_omori") ///
xtitle("Grad der Demokratie (egaldem_scal)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist egaldem_scal, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.2) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))


**# ln_sum_efw
margins, dydx(ln_sum_efw) at(egaldem_scal=(0(1)100))

marginsplot, xdimension(egaldem_scal) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_sum_efw") ///
xtitle("Grad der Demokratie (egaldem_scal)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist egaldem_scal, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.2) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))


**# ln_KAOPEN
margins, dydx(ln_KAOPEN) at(egaldem_scal=(0(1)100))

marginsplot, xdimension(egaldem_scal) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_KAOPEN") ///
xtitle("Grad der Demokratie (egaldem_scal)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist egaldem_scal, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.2) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))



**# Verschiedene Ausprägungen der Finanzmarktentwicklung
**# ln_sum_16_omori
margins, dydx(ln_sum_16_omori) at(priv_credit=(0(1)250))

marginsplot, xdimension(priv_credit) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_sum_16_omori") ///
xtitle("Grad der Finanzmarktentwicklung (priv_credit)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist priv_credit if priv_credit >=0 & priv_credit <=300, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.5) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))


**# ln_sum_domestic_omori
margins, dydx(ln_sum_domestic_omori) at(priv_credit=(0(1)250))

marginsplot, xdimension(priv_credit) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_sum_domestic_omori") ///
xtitle("Grad der Finanzmarktentwicklung (priv_credit)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist priv_credit if priv_credit >=0 & priv_credit <=300, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.5) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))


**# ln_sum_efw
margins, dydx(ln_sum_efw) at(priv_credit=(0(1)250))

marginsplot, xdimension(priv_credit) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_sum_efw") ///
xtitle("Grad der Finanzmarktentwicklung (priv_credit)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist priv_credit if priv_credit >=0 & priv_credit <=300, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.5) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))


**# ln_KAOPEN
margins, dydx(ln_KAOPEN) at(priv_credit=(0(1)250))

marginsplot, xdimension(priv_credit) recast(line) ///
title ("GMM["hier die Nummer der Schätzung eintragen"]") ///
ytitle("Marginaler Effekt von ln_KAOPEN") ///
xtitle("Grad der Finanzmarktentwicklung (priv_credit)") ///
plotopts(lwidth(thick) lcolor(ebblue)) ///
ciopts(recast(rline) lwidth(thin) lpattern(dash) lcolor(ebblue)) ///
level(95) ///
addplot(hist priv_credit if priv_credit >=0 & priv_credit <=300, yaxis(2) yscale(alt axis(2)) ytitle("Dichte", axis(2)) fcolor(sand) bin(25) barwidth(.5) lcolor(sand) lwidth(thin)) ///
yline(0, lcolor(maroon) lwidth(medthick) lpattern(solid)) ///
legend(on order(1 "95%-Konfidenzintervall" 2 "Marginaler Effekt" 3 "Dichte") ///
position(12) ring(0) cols(1) region(lstyle(solid) lcolor(black) lwidth(thin) margin(1 1 1 1)))
