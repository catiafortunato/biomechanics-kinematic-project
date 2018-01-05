function [phi,dphi,niu,gama] = dotproduct (nc,nh,Mapping,q,v,phi,dphi,niu,gama)
%
%Evaluates a dot product constraint
%
%Input:
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
%
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

if nh~=50
    
    %Positions
    Ri=[q(2*ri-1),q(2*ri)];
    Rj=[q(2*rj-1),q(2*rj)];
    Rk=[q(2*rk-1),q(2*rk)];
    Rl=[q(2*rl-1),q(2*rl)];
    
    %Velocities
    Vi=[v(2*ri-1),v(2*ri)];
    Vj=[v(2*rj-1),v(2*rj)];
    Vk=[v(2*rk-1),v(2*rk)];
    Vl=[v(2*rl-1),v(2*rl)];
    
    %Orthogonal Vectors
    %fixed point has index zero
    rij = [Rj(1)-Ri(1);Rj(2)-Ri(2)];
    rkl=[Rl(1)-Rk(1);Rl(2)-Rk(2)];
    vij=[Vj(1)-Vi(1);Vj(2)-Vi(2)];
    vkl=[Vl(1)-Vk(1);Vl(2)-Vk(2)];
    
    %update phi in the nh.th constraint
    phi(nh)= rij'*rkl-Lij*Lkl*cos(theta);
    
    %update the Jacobian Matrix
    dphi(nh,:)=0.0;
    
    
    dphi(nh,[2*ri-1,2*ri])= -rkl' + dphi(nh,[2*ri-1,2*ri]);
    dphi(nh,[2*rj-1,2*rj])= rkl' + dphi(nh,[2*rj-1,2*rj]);
    dphi(nh,[2*rk-1,2*rk])= -rij' + dphi(nh,[2*rk-1,2*rk]);
    dphi(nh,[2*rl-1,2*rl])= rij' + dphi(nh,[2*rl-1,2*rl]);
    
    %update niu and gama
    
    if Mapping(nh,8)~=0
        niu(nh,1)=-Lij*Lkl*sin(theta)*dtheta;
        gama(nh,1)= -Lij*Lkl*(cos(theta)*(dtheta^2)+ sin(theta)*d2theta)-2*vij'*vkl;
    else
        niu(nh,1)= 0;
        gama(nh,1)= -2*vij'*vkl;
    end
    
else
    Ri=[q(2*ri-1),q(2*ri)];
    Rj=[q(2*rj-1),q(2*rj)];
    Vi=[v(2*ri-1),v(2*ri)];
    Vj=[v(2*rj-1),v(2*rj)];
    rij = [Rj(1)-Ri(1);Rj(2)-Ri(2)];
    vij=[Vj(1)-Vi(1);Vj(2)-Vi(2)];
    rkl=[1;0];
    vkl=[0;0];
    
    %update phi in the nh.th constraint
    phi(nh)= rij'*rkl-Lij*Lkl*cos(theta);
    
    %update the Jacobian Matrix
    dphi(nh,:)=0.0;
    
    
    dphi(nh,[2*ri-1,2*ri])= -rkl' + dphi(nh,[2*ri-1,2*ri]);
    dphi(nh,[2*rj-1,2*rj])= rkl' + dphi(nh,[2*rj-1,2*rj]);
    
    %update niu and gama
    
    if Mapping(nh,8)~=0
        niu(nh,1)=-Lij*Lkl*sin(theta)*dtheta;
        gama(nh,1)= -Lij*Lkl*(cos(theta)*(dtheta^2)+ sin(theta)*d2theta)-2*vij'*vkl;
    else
        niuh(nh,1)= 0;
        gama(nh,1)= -2*vij'*vkl;
    end
    
    
end
end











