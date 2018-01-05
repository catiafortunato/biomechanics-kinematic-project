function [phi,dphi,niu,gama]=switch_constraints(t,frame,nc,nh,Mapping,q,v,phi,dphi,niu,gama,thetas,dthetas,d2thetas)

% Input:
% t:time vector
% frame: frame we're evaluating
% nc: number of coordinates
% nh: constraint we're evaluating
% q: generalized coordinates vector
% v:velocity vector
% phi: constraint matrix
% dphi:jacobian matrix
% niu: niu vector
% gama: gama vector
% theta: matrix with the angles for every frame
% dtheta: first derivative of thetas with respect to time
% d2theta: seconds derivative of theta with respect to time
% 
% Output:
% phi: constraint matrix
% dphi:jacobian matrix
% niu: niu vector
% gama: gama vector

for i=1:nh
    if Mapping(i,8)~=0 %if it is a driver, we will add the corresponding value of theta
        [Mapping]=calculate_driver(frame,i,Mapping,thetas,dthetas,d2thetas);
    end
    
    switch Mapping(i,1)
        case 1
            [phi,dphi,niu,gama]=dotproduct(nc,i,Mapping,q,v,phi,dphi,niu,gama);
        case 2
            [phi,dphi,niu,gama]=joint(i,Mapping,q,phi,dphi,niu,gama);
        case 3
            [phi,dphi,niu,gama]=crossproduct(nc,i,Mapping,q,v,phi,dphi,niu,gama);
        case 4
            [phi,dphi,niu,gama]=trajectory_driver(i,Mapping,q,phi,dphi,niu,gama);
    end
end
        
end

        