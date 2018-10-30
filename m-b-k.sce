// Mass, Damper, Spring m-b-k.sce 
// M. Lohöfener, HS Merseburg, 24/10/2016
// Parameter

clear
close

m = 0.141;	// kg
k = 20;	// N/m
b = 0.5;	// Ns/m
F = 1;	// N

// Transfer functions
s = poly(0,'s');
G = syslin ('c', 1 / (m*s^2 + b*s + k))*F;

// Presentation
instants = 0:0.01:4;
y = csim ('step', instants, G);
xset ("font size", 3);
xtitle ("Step answer h(t)", "Time t [s]", "Deflection");
xgrid (32);				// Grid
plot2d (instants, y, 2);
legend ('y(t)');
