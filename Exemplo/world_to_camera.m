function H=world_to_camera(s)
% s = [ x , y , theta]
% fw n x 4 vector of feature points
x=s(1);
y=s(2);
theta=s(3);
H=zeros(4,4);
H(1,1)=cos(theta);
H(1,2)=sin(theta);
H(2,1)=-sin(theta);
H(2,2)=cos(theta);
H(3,3)=1;
H(1,4)=-x*cos(theta)-y*sin(theta);
H(2,4)=-y*cos(theta)+x*sin(theta);
H(4,4)=1;
% fc=H*fw;