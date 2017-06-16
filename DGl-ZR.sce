m=100;   // kg
d=1000;  // N.s/m
k=1000;  // N/m

A=[0 1
  -k/m -d/m];
B=[0
  k/m];
C=[1 0];

Modell=syslin('c',A,B,C);
Zeit=0:0.1:10; // s
y=csim('step',Zeit,Modell);
plot2d(Zeit,Modell);

