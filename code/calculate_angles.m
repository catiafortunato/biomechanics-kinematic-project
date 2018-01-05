function[thetas]=calculate_angles(data,Mapping)

%Input:
%data: matrix with coordinates for all points and time frames
%
%Output
%thetas: matrix with the angles between rigid body based on the coordinates
%for all points and time frames

n_frames=size(data,1);

%generate thetas matrix
thetas=zeros(n_frames, 16); 

for i=1:n_frames
    for j=1:16
        pi=Mapping(j+44,2);
        pj=Mapping(j+44,3);
        pk=Mapping(j+44,4);
        pl=Mapping(j+44,5);
        
        if Mapping(j+44,1)==4 %If the constraint is a trajectory driver
            if j+44==59 %% XX axis
                thetas(i,j)=data(i,pi*2-1);
            end
            if j+44==60 %% ZZ axis
                thetas(i,j)=data(i,pi*2);
            end
        else % If the constraint is a angular driver we calculate the angles 
            
            Rij=[(data(i,2*pj-1)-data(i,2*pi-1));(data(i,2*pj)-data(i,2*pi))];
            Rij_proj=[-(data(i,2*pj)-data(i,2*pi));(data(i,2*pj-1)-data(i,2*pi-1))];
            
            if pk==0 && pl==0 %%angle between a vector and the XX axis
                Rkl=[1;0];
            else
                Rkl=[(data(i,2*pl-1)-data(i,2*pk-1));(data(i,2*pl)-data(i,2*pk))];
            end

            thetas(i,j)=atan2(Rij_proj'*Rkl, Rij'*Rkl);
          
        end
    end
end





end

        
            
            
       
             
        
        
     
        



