// Simulation eines P-T1-Glied RC-Gl.sci
// Vorgabe von k und T1
s=poly(0,'s');				// Gleichung bauen
sl=syslin('c',k/(T1*s+1));		// lineares System bestimmen
instants=0:0.01:1;			// Zeitachse bauen
y=csim('step',instants,sl);		// Sprungantwort simulieren
xbasc()					// alte Grafik l?schen
xtitle("Simulation P-T1-Glied","Zeit t in s","Sprungantwort")
plot2d(instants',y',2)			// Verlauf zeichnen
xgrid(32)				// Gitternetzlinien
xstring(0,-0.15,'k='+string(k)+'  T1='+string(T1))
