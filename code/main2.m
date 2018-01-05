%% Main
function[totalq,totalq_ponto,totalq_2ponto,P,V,A]=main2(data)


%% Read data
[~,~,datastatic]=xlsread('data/data_static.xlsx');
%%
data_static_read=read_data(datastatic);
data_read = read_data(data);

%% Filtrar dados
data_static_fil=filter_data(data_static_read);

data_fil=filter_data(data_read); 
%% Calcular Average length
mean_length;

%% Construir Mapping
mapping;

%% Construir thetas
Thetas = calculate_angles(data_fil,Mapping);
%%
for i=1:16
    if  i==7 || i==11
        for j=1:size(data_fil,1)
            if Thetas(j,i)<0
                Thetas(j,i)=Thetas(j,i)+2*pi;
            end
        end
    end
end

%% Calcular splines
[P,V,A]=calculate_splines(Thetas);

%% Delete the first and last 10 samples 

data_fil=data_fil(11:end-10,:);
A=A(11:end-10,:);
V=V(11:end-10,:);
P=P(11:end-10,:);

%% Initialization
t_final=(size(A,1)+floor(size(A,1)/100))/100;
t=0:1/99:t_final; %time vector
nc=size(data_fil,2);
nh= size(Mapping,1);
q = data_fil(1,:)';
v = (data_fil(2,:)-data_fil(1,:))/(1/100);
phi = zeros(nh,1);
dphi = zeros (nh,nc);
niu = zeros(nh,1);
gama = zeros(nh,1);


%% Kinematic analysis 
 
% temos de ter o tempo inicial e final e o vetor q inicial
 
error = 10^(-6);
t_size=length(t);
totalq=zeros(t_size,60);
disp('Computing, master...')
for ti=1:t_size
    i=1;
    if mod(ti,50)==0
        disp('.')
    end
    norm_deltaq = 1;
    deltaq=zeros(length(q),1);
    while norm_deltaq > error
        q=q+deltaq;
        [phi,dphi,niu,gama]=switch_constraints(t,ti,nc,nh,Mapping,q,v,phi,dphi,niu,gama,P,V,A);
        deltaq = - inv(dphi)*(phi);
        norm_deltaq = norm(deltaq);
        i=i+1;
        
    end
    
    totalq(ti,:)=q;
    qponto=inv(dphi)*niu;
    q2pontos=inv(dphi)*gama;
    totalq_ponto(ti,:)=qponto;
    totalq_2ponto(ti,:)=q2pontos;
    
end
disp('Computing is complete...')
pause(0.01)
disp('Generating HD motion chart ')
pause(0.05)
disp('.')
pause(0.25)
disp('.')
pause(0.25)
disp('.')
pause(0.25)
disp('.') 

end



