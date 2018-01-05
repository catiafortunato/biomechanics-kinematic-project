function [Mapping]= calculate_driver(frame,nh,Mapping, thetas_matrix, dthetas_matrix, d2thetas_matrix)
%Driver Constraint
%This
%Input
%t=time we're evaluating
%nh=constraint number
%Mapping=Mapping Matrix
% theta_matrix=Matrix with the value of the angles
% dtheta:matrix=Matrix with the angular velocity
% d2theta_matrix=Matrix with the accelarations
% index=index in the matrix of the constraint we're evaluating
%frame
%
%Output
%Mapping=Mapping Matrix

a = Mapping(nh,8);

if a~=0
    Mapping (nh,9)=thetas_matrix(frame,a);
    Mapping (nh,10)=dthetas_matrix(frame,a);
    Mapping (nh,11)=d2thetas_matrix(frame,a);
    
else
    disp('Unknown kinematic driver type');
end
end

