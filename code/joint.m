function [phi, dphi, niu, gama] = joint (nh, Mapping, q, phi, dphi, niu, gama)
%Joint Constraint
%The explicit definition of the joint contraint add 2 adicional equations
%for each revolut joint.

% Input: 
% nh = number of constraints
% Mapping = Mapping matrix
% q = vector of generalized coordinates 
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

%Index of each point (PODE VIR A SER ALTERADO)
ri=Mapping(nh,2);
rj=Mapping(nh,3);

%Positions
Ri=[q(2*ri-1), q(2*(ri))];
Rj=[q(2*rj-1), q(2*(rj))];
Rij=Rj-Ri;

%update niu
niu(nh,1)=0.0;
niu(nh+1,1)=0.0;

%update gama
gama(nh,1)=0.0;
gama(nh+1,1)=0.0;

%update phi
phi(nh,1)=Rij(1);
phi(nh+1,1)=Rij(2);

%update the Jacobian Matrix
dphi(nh,:)=0.0;
dphi(nh+1,:)=0.0;

dphi(nh,[2*ri-1;2*ri])=[-1 0];
dphi(nh+1,[2*ri-1;2*ri])=[0 -1];

dphi(nh,[2*rj-1;2*rj])=[1 0];
dphi(nh+1,[2*rj-1;2*rj])=[0 1];





