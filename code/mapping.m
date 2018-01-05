%data constraints 
%
%[type,i,j,k,l,Lij,Lkl,degree of freedom,theta,dtheta,d2theta]
%t1=dot product;t2=general revolute joint;
%t3=cross product;t4=trajectory
Mapping=zeros(60,11);
%constant length
Mapping(1,:)=[1,1,2,1,2,L12,L12,0,0,0,0];%head
Mapping(2,:)=[1,3,4,3,4,L34,L34,0,0,0,0];%right upper arm
Mapping(3,:)=[1,5,6,5,6,L56,L56,0,0,0,0];%right lower arm
Mapping(4,:)=[1,7,8,7,8,L78,L78,0,0,0,0];%left upper arm
Mapping(5,:)=[1,9,10,9,10,L910,L910,0,0,0,0];%left lower arm
Mapping(6,:)=[1,11,12,11,12,L1112,L1112,0,0,0,0];%trunc
Mapping(7,:)=[1,13,14,13,14,L1314,L1314,0,0,0,0];%right upper leg
Mapping(8,:)=[1,15,16,15,16,L1516,L1516,0,0,0,0];%right lower leg
Mapping(9,:)=[1,17,18,17,18,L1718,L1718,0,0,0,0];%right foot
Mapping(10,:)=[1,18,19,18,19,L1819,L1819,0,0,0,0];%right foot
Mapping(11,:)=[1,17,19,17,19,L1719,L1719,0,0,0,0];%right foot
Mapping(12,:)=[1,20,21,20,21,L2021,L2021,0,0,0,0];%right toes
Mapping(13,:)=[1,22,23,22,23,L2223,L2223,0,0,0,0];%left upper leg
Mapping(14,:)=[1,24,25,24,25,L2425,L2425,0,0,0,0];%left lower leg
Mapping(15,:)=[1,26,27,26,27,L2627,L2627,0,0,0,0];%left foot
Mapping(16,:)=[1,27,28,27,28,L2728,L2728,0,0,0,0];%left foot
Mapping(17,:)=[1,26,28,26,28,L2628,L2628,0,0,0,0];%left foot
Mapping(18,:)=[1,29,30,29,30,L2930,L2930,0,0,0,0];%left toes
%revolute joints
Mapping(19,:)=[2,2,11,2,11,0,0,0,0,0,0];%neck-trunc
Mapping(20,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(21,:)=[2,3,11,3,11,0,0,0,0,0,0];%rightarm-trunc
Mapping(22,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(23,:)=[2,7,11,7,11,0,0,0,0,0,0];%leftarm-trunc
Mapping(24,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(25,:)=[2,4,5,4,5,0,0,0,0,0,0];%rightupperarm-lowerarm
Mapping(26,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(27,:)=[2,8,9,8,9,0,0,0,0,0,0];%leftupperarm-lowerarm
Mapping(28,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(29,:)=[2,12,13,12,13,0,0,0,0,0,0];%trunc-rightleg
Mapping(30,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(31,:)=[2,12,22,12,22,0,0,0,0,0,0];%trunc-leftleg
Mapping(32,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(33,:)=[2,14,15,14,15,0,0,0,0,0,0];%rightupperleg-lowerleg
Mapping(34,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(35,:)=[2,23,24,23,24,0,0,0,0,0,0];%leftupperleg-lowerleg
Mapping(36,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(37,:)=[2,16,17,16,17,0,0,0,0,0,0];%rightlowerleg-foot
Mapping(38,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(39,:)=[2,19,20,19,20,0,0,0,0,0,0];%rightfoot-toes
Mapping(40,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(41,:)=[2,25,26,25,26,0,0,0,0,0,0];%leftlowerleg-foot
Mapping(42,:)=[0,0,0,0,0,0,0,0,0,0,0];
Mapping(43,:)=[2,28,29,28,29,0,0,0,0,0,0];%leftfoot-toes
Mapping(44,:)=[0,0,0,0,0,0,0,0,0,0,0];
%angular drivers
Mapping(45,:)=[3,2,1,11,12,L21,L1112,1,0,0,0];%head-trunc
Mapping(46,:)=[3,3,4,11,12,L34,L1112,2,0,0,0];%rightarm-trunc
Mapping(47,:)=[3,4,3,5,6,L43,L56,3,0,0,0];%rightupperarm-lowerarm
Mapping(48,:)=[3,7,8,11,12,L1112,L78,4,0,0,0];%leftarm-trunc
Mapping(49,:)=[3,8,7,9,10,L87,L910,5,0,0,0];%leftupperarm-lowerarm
Mapping(50,:)=[1,12,11,0,0,L1211,1,6,0,0,0];%trunc-horizontal
Mapping(51,:)=[3,13,14,12,11,L1314,L1211,7,0,0,0];%rightleg-trunc
Mapping(52,:)=[3,14,13,15,16,L1413,L1516,8,0,0,0];%rightupperleg-lowerleg
Mapping(53,:)=[1,16,15,17,19,L1615,L1719,9,0,0,0];%rightleg-foot
Mapping(54,:)=[1,19,17,20,21,L1917,L2021,10,0,0,0];%rightfoot-toes
Mapping(55,:)=[3,22,23,12,11,L2223,L1112,11,0,0,0];%leftleg-trunc
Mapping(56,:)=[3,23,22,24,25,L2322,L2425,12,0,0,0];%leftupperleg-lowerleg
Mapping(57,:)=[1,25,24,26,28,L2524,L2628,13,0,0,0];%leftleg-foot
Mapping(58,:)=[1,28,26,29,30,L2826,L2930,14,0,0,0];%leftfoot-toes
%trajectory drivers
Mapping(59,:)=[4,12,0,0,0,0,0,15,0,0,0];%xx trajectory
Mapping(60,:)=[4,12,0,0,0,0,0,16,0,0,0];%yy trajectory