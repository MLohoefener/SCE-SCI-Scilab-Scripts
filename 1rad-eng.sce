// Scilab program 1Rad.sci
// Prof. Dr. M. Lohöfener, 26.5.03
// Data input
kA=32500;
dA=10000;
mA=1300;
kR=50000;
mR=20;
xS=1;
// differential equation system 
M=[mA 0
   0 mR];
D=[dA -dA
   -dA dA];
K=[kA -kA
   -kA kR+kA];
Ke=[0
    kR];
// Transformation in state space
[nr,nc]=size(M);
A=[zeros(nr,nc) eye(nr,nc)
   -inv(M)*K -inv(M)*D];
B=[zeros(nr,1)
   inv(M)*Ke];
C=[eye(nr,nc) zeros(nr,nc)];
Einrad=syslin('c',A,B,C);
instants=0:0.01:4;
y=csim('step',instants,Einrad);
//xbasc()	// clean old graphic
xtitle("Simulation Einrad","Zeit t in s","Sprungantwort")
xgrid(32)
plot2d(instants',y')
