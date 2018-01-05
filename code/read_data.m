function [data]=read_data(data_aux)

%input
%data_aux : file with the data from the labortory

%output
%data: matrix with the data from data_aux file


   
data=zeros(size(data_aux,1),60);

      
      data(:,1)=str2double(data_aux(:,1)); % head xx
      data(:,2)=str2double(data_aux(:,2)); % head yy
      data(:,[3,5,13,21])=repmat((str2double(data_aux(:,3))+str2double(data_aux(:,9)))/2,1,4); % shoulder xx
      data(:,[4,6,14,22])=repmat((str2double(data_aux(:,4))+str2double(data_aux(:,10)))/2,1,4); % shoulder yy
      data(:,[7,9])=repmat(str2double(data_aux(:,11)),1,2); % R_elbow xx
      data(:,[8,10])=repmat(str2double(data_aux(:,12)),1,2); % R_elbow yy
      data(:,11)=str2double(data_aux(:,13)); % R_wrist xx
      data(:,12)=str2double(data_aux(:,14)); % R_wrist yy
      data(:,[15,17])=repmat(str2double(data_aux(:,5)),1,2); % L_elbow xx
      data(:,[16,18])=repmat(str2double(data_aux(:,6)),1,2); % L_elbow yy
      data(:,19)=str2double(data_aux(:,7)); % L_wrist xx
      data(:,20)=str2double(data_aux(:,8)); % L_wrist yy
      data(:,[23,25,43])=repmat((str2double(data_aux(:,15))+str2double(data_aux(:,27)))/2,1,3); % hip xx
      data(:,[24,26,44])=repmat((str2double(data_aux(:,16))+str2double(data_aux(:,28)))/2,1,3); % hip yy
      data(:,[27,29])=repmat(str2double(data_aux(:,29)),1,2); % R_knee xx
      data(:,[28,30])=repmat(str2double(data_aux(:,30)),1,2); % R_knee yy
      data(:,[31,33])=repmat(str2double(data_aux(:,31)),1,2); % R_ankle xx
      data(:,[32,34])=repmat(str2double(data_aux(:,32)),1,2); % R_anle yy
      data(:,35)=str2double(data_aux(:,33)); % R_heel xx
      data(:,36)=str2double(data_aux(:,34)); % R_heel yy
      data(:,[37,39])=repmat(str2double(data_aux(:,35)),1,2); % R_meta xx
      data(:,[38,40])=repmat(str2double(data_aux(:,36)),1,2); % R_meta yy
      data(:,41)=str2double(data_aux(:,37)); % R_toe xx
      data(:,42)=str2double(data_aux(:,38)); % R_toe yy
      data(:,[45,47])=repmat(str2double(data_aux(:,17)),1,2); % L_knee xx
      data(:,[46,48])=repmat(str2double(data_aux(:,18)),1,2); % L_knee yy
      data(:,[49,51])=repmat(str2double(data_aux(:,19)),1,2); % L_anle xx
      data(:,[50,52])=repmat(str2double(data_aux(:,20)),1,2); % L_ankle yy
      data(:,53)=str2double(data_aux(:,21)); % L-hell xx
      data(:,54)=str2double(data_aux(:,22)); % L_heel yy
      data(:,[55,57])=repmat(str2double(data_aux(:,23)),1,2); % L_meta xx
      data(:,[56,58])=repmat(str2double(data_aux(:,24)),1,2); % L_meta yy
      data(:,59)=str2double(data_aux(:,25)); % L_toe xx
      data(:,60)=str2double(data_aux(:,26)); % L_toe yy
      
      


end