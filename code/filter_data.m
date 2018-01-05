function [data_fil] = filter_data (data)
%Filtra cada parte do modelo utilizando a fun??o butterfilter, para gait
%jump ou static

data_fil=data;

fc=[3 3.5 4];

data_fil(:,[1,2]) = butterfilter(2,fc(1),data(:,[1,2]),100); %Head
data_fil(:,[3,4,5,6,13,14,21,22]) = butterfilter(2,fc(1),data(:,[3,4,5,6,13,14,21,22]),100); %Shoulders
data_fil(:,[7,8,9,10,15,16,17,18]) = butterfilter(2,fc(2),data(:,[7,8,9,10,15,16,17,18]),100); %Elbows
data_fil(:,[11,12,19,20]) = butterfilter(2,fc(3),data(:,[11,12,19,20]),100); %Wrists
data_fil(:,[23,24,25,26,43,44]) = butterfilter(2,fc(1),data(:,[23,24,25,26,43,44]),100); %Hip
data_fil(:,[27,28,29,30,45,46,47,48]) = butterfilter(2,fc(2),data(:,[27,28,29,30,45,46,47,48]),100); %Knees
data_fil(:,[31,32,33,34,35,36,37,38,39,40,41,42,49,50,51,52,53,54,55,56,57,58,59,60]) = butterfilter(2,fc(3),data(:,[31,32,33,34,35,36,37,38,39,40,41,42,49,50,51,52,53,54,55,56,57,58,59,60]),100); %Feet





end 