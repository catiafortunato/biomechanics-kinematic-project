function[phi, dphi, niu, gama]= trajectory_driver(nh,Mapping,q,phi,dphi,niu,gama)
%Evaluation of the trajectory driver
% 
% Input
% nh=constraint number
% Mapping=Mapping matrix
% q=generalized coordinates
% phi=constraint matrix
% dphi=jacobian matrix
% niu=generalized velocities
% gama=generalized accelarations
% 
% Output
% phi=constraint matrix updated
% dphi=jacobian matrix updated
% niu=generalized velocities updated
% gama=generalized accelarations updated

%index of the point 
ri=Mapping(nh,2);

indice=Mapping(nh,8);

%Position

if indice==15
    Ri=q(2*ri-1);
else
    Ri=q(2*ri);
end
    
%Expected values
ri_star=Mapping(nh,9);
dri_star=Mapping(nh,10);
d2ri_star=Mapping(nh,11);

%update phi

phi(nh)= Ri-ri_star;

%update de jacobian matrix

if indice==15
    dphi(nh,:)=0.0;
    dphi(nh,[(2*ri-1);(2*ri)])=[1,0];
else
    dphi(nh,:)=0.0;
    dphi(nh,[(2*ri-1);(2*ri)])=[0,1];
end

%update niu

niu(nh,1)=dri_star;

%update gama

gama(nh,1)=d2ri_star;


