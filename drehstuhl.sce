// Uebergangsfunktion Drehstuhl
// Lohoefener, 17.1.2006
m=50;  // kg
k=5000;  // N/m
d=500; // N.s/m
s=poly(0,'s');
sl=syslin('c',(1+s*d/k)/(1+s*d/k+s*s*m/k));	// Uebertragungsfunktion
instants=0:0.01:2;
y=csim('step',instants,sl);
xbasc();					// alte Grafik loeschen
// xset("font size",24);
xtitle("Uebergangsfunktion h(t)","Zeit t [s]","Hoehe");
xgrid(32);				// Gitternetzlinien
plot2d(instants',y',2);

