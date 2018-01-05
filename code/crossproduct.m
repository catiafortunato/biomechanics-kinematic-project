function [phi,dphi,niu,gama] = crossproduct (nc,nh,Mapping,q,v,phi,dphi,niu,gama)
%
%Evaluates a cross product constraint 
%
% Input: 
% nc = number of coordinates
% nh = number of constraints
% Mapping = Mapping matrix
% q = vector of generalized coordinates 
% v = velocity vector
% phi = vector of kinetic constraints
% dphi = Jacobian matrix of constraints 
% niu = Generalized velocities
% gama = Generalized accelerations
%
% Output:
% phi = vector of kinetic constraints
% dphi = Jacobian matrix of constraints
% niu = Generalized velocities
% gama = Generalized accelerations

%Index of each point
ri=Mapping(nh,2);
rj=Mapping(nh,3);
rk=Mapping(nh,4);
rl=Mapping(nh,5);


%Length between the points
Lij=Mapping(nh,6);
Lkl=Mapping(nh,7);

%Angles
theta=Mapping(nh,9);
dtheta=Mapping(nh,10);
d2theta=Mapping(nh,11);

if ri~=0 && rj~=0 && rk~=0 && rl~=0
    %Positions
    Ri=[q(2*ri-1), q(2*(ri))];
    Rj=[q(2*rj-1), q(2*(rj))];
    Rk=[q(2*rk-1), q(2*(rk))];
    Rl=[q(2*rl-1), q(2*(rl))];
    
    %Velocities
    Vi=[v(2*ri-1), v(2*(ri))];
    Vj=[v(2*rj-1), v(2*(rj))];
    Vk=[v(2*rk-1), v(2*(rk))];
    Vl=[v(2*rl-1), v(2*(rl))];
    
    %Orthogonal Vector
    rij_proj=[(-(Rj(2)-Ri(2))),(Rj(1)-Ri(1))];
    rkl_proj=[(-(Rl(2)-Rk(2))),(Rl(1)-Rk(1))];
    vij_proj=[(-(Vj(2)-Vi(2))),(Vj(1)-Vi(1))];
    vkl_proj=[(-(Vl(2)-Vk(2))),(Vl(1)-Vk(1))];
    
    %update phi in the nh.th constraint
    phi(nh)=rij_proj*(Rl-Rk)'-Lij*Lkl*sin(theta);
    
    %update the Jacobian Matrix
    
    dphi(nh,:)=0.0;
    
    dphi(nh,[2*ri-1,2*(ri)])= rkl_proj+ dphi(nh,[2*ri-1,2*(ri)]);
    dphi(nh,[2*rj-1,2*(rj)])= -rkl_proj+ dphi(nh,[2*rj-1,2*(rj)]);
    dphi(nh,[2*rk-1,2*(rk)])= -rij_proj+ dphi(nh,[2*rk-1,2*(rk)]);
    dphi(nh,[2*rl-1,2*(rl)])= rij_proj+ dphi(nh,[2*rl-1,2*(rl)]);
    
    %update niu
    
    niu(nh,1)= Lij*Lkl*cos(theta)*dtheta;
    
    %update gama
    
    gama(nh,1)=-Lij*Lkl*(sin(theta)*(dtheta^2)-cos(theta)*d2theta)-2*vij_proj*(Vl-Vk)';
end
end






