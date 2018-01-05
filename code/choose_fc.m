function R=choose_fc(q)

%function that given a vector of generalized coordinates calculates the
%residue of the data filtered with cut off frequencies between 0.25 Hz and
%10 Hz
%input:
% q:vector of generalized coordinates
%
%output:
%R: residue 

fc=0.25:0.25:10;

R=zeros(length(fc),1);

for j=1:length(fc)
    
q_fil=butterfilter(2,fc(1,j),q,100);

sum_total=0;
for i=1:length(q)
    sum=(q(i,1)/1000-q_fil(i,1)/1000)^2;
    sum_total=sum_total+sum;
end
R(j)= sqrt(sum/length(q));

end



end





