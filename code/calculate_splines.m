function [p_matrix, v_matrix,a_matrix] = calculate_splines (thetas)

%calculates piecewise polynomials and its derivates
%inputs:
%thetas: matrix built in calculate_angles
%outputs:
%p_matrix: position matrix, all the positions for all frames, this matrix is the same as thetas
%v_matrix: velocities matrix, all the velocities for all frames
%a_matrix: aceleration matrix, all values of acelerations for all frames



p_matrix=thetas;
v_matrix=zeros(size(thetas,1),size(thetas,2)); %velocity table to each point and time 
a_matrix=zeros(size(thetas,1),size(thetas,2)); %acceleration table to each point and time 



for k=1:16
    for j=1:length(t)
        v_matrix(j,k)=ppval(fnder(csape(t,thetas(:,k),'periodic'),1),t(j));
        a_matrix(j,k)=ppval(fnder(csape(t,thetas(:,k),'periodic'),2),t(j));
    end
end 



end 
        
    
    



