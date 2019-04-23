function um=mergecontrol(u)
% u(1) = dot_x
% u(2) = dot_y
% u(3) = omega

%um(1)=v
%um(2)=omega
% see paper Hager et al Eq. (15)-(17)

kappa1=0.25;
kappa2=3.0;
% eta=0.3;
K1=2.0/(1+abs(u(1))/kappa1);
K2=0.3/(1+abs(u(1))/kappa2);
um(1)=u(2);
um(2)=K1*u(3)-K2*u(1);