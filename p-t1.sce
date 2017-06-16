// Simulation of a P-T1-System p-t1.sci
K=4.5;
T=0.4;
s=poly(0,'s');				// Laplace-Operator
sl=syslin('c',(K/(T*s+1)));		// Linear System
instants=0:0.01:3.2;			// Time Axis
y=csim('step',instants,sl);		// Step Response
xbasc()					// clear old Graph
xset("font",2,24)
xset("thickness",2)
xset("wdim",1200,900)
xset("wresize",1)
xtitle("Simulation","Zeit [s]","Übergangsfunktion")
plot2d(instants',y',2)			// plot Step Response
xgrid(32)				// draw Grid
