// Z-Transformation mit Scilab am Beispiel
// cont2dis.sci, 20.03.2009, M. Lohöfener

// P-Td1-T2-Glied 
K = 1.5;
Td1 = 1;  // s
T = 2;    // s
D = 0.5;

fprintf(%io(2),'\nKontinuierliches System\n');
s=poly(0,'s');
Gs = syslin('c',(K+Td1*K*s)/(1+2*T*D*s+T^2*s^2))

// Transformation  
T0 = 1; // s
Gsdss = dscr(Gs,T0);  // kontinuierlich zu diskret 
fprintf(%io(2),'\nDiskretes System mit T0 = %g s\n',T0);
Gsd=ss2tf(Gsdss)

t=0:0.1:20;
y=csim('step',t,Gs);
u=ones(1,20);
yd=flts(u,Gsd);
for i=1:19
  yd(i)=yd(i+1);
end

clf;  // clear old figure
plot2d(t,y,2);
plot2d2((1:20),yd,5);
title("P-Td1-T2-System");
xlabel("Zeit in s");
ylabel("Verlauf");
legends(["kontinuierlich";"diskret"],[2;5],opt='ur');
set(gca(),"grid",[1,1]);

