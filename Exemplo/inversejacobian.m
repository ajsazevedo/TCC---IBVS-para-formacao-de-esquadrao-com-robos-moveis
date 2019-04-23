function IJ=inversejacobian(f)
% f is a 2*n matrix of feature points
% we calculate Z from the average height f3_v-f1_v and f4_v-f2_v
ft=f';
Z = 1/(0.25*(ft(3,2)-ft(1,2))+0.25*(ft(4,2)-ft(2,2)));
% Jacobian matrix for a single point is given by
% (dot_ dot v)=( -1/Z u/Z -(1+u^2); 0 v/Z -uv)(dot_x dot_y omega)  
% Jacobian is of dimension 2n*3
[n,m]=size(ft);
J=zeros(n*2,3);
for i=1:n
    J(2*(i-1)+1,:)=[-1/Z ft(i,1)/Z -(1+ft(i,1)^2)];
    J(2*i,:)=[0 ft(i,2)/Z -ft(i,1)*ft(i,2)];
end
IJ=pinv(J);