
% calculates the mean value of coordinates for all time to each point and
% based on that, calculates de length of the rigid bodies.

mean_coord=mean(data_static_fil,1);

L12=sqrt((mean_coord(1)-mean_coord(3))^2+(mean_coord(2)-mean_coord(4))^2); %head
L34=sqrt((mean_coord(5)-mean_coord(7))^2+(mean_coord(6)-mean_coord(8))^2); %right upper arm
L56=sqrt((mean_coord(9)-mean_coord(11))^2+(mean_coord(10)-mean_coord(12))^2); %right lower arm
L78=sqrt((mean_coord(13)-mean_coord(15))^2+(mean_coord(14)-mean_coord(16))^2); %left upper arm
L910=sqrt((mean_coord(17)-mean_coord(19))^2+(mean_coord(18)-mean_coord(20))^2); %left lower arm
L1112=sqrt((mean_coord(21)-mean_coord(23))^2+(mean_coord(22)-mean_coord(24))^2); %trunc
L1314=sqrt((mean_coord(25)-mean_coord(27))^2+(mean_coord(26)-mean_coord(28))^2); %right upper leg
L1516=sqrt((mean_coord(29)-mean_coord(31))^2+(mean_coord(30)-mean_coord(32))^2); %right lower leg
L1718=sqrt((mean_coord(33)-mean_coord(35))^2+(mean_coord(34)-mean_coord(36))^2); %right foot
L1819=sqrt((mean_coord(35)-mean_coord(37))^2+(mean_coord(36)-mean_coord(38))^2); %right foot
L1719=sqrt((mean_coord(33)-mean_coord(37))^2+(mean_coord(34)-mean_coord(38))^2); %right foot
L2021=sqrt((mean_coord(39)-mean_coord(41))^2+(mean_coord(40)-mean_coord(42))^2); %right toes
L2223=sqrt((mean_coord(43)-mean_coord(45))^2+(mean_coord(44)-mean_coord(46))^2); %left upper leg
L2425=sqrt((mean_coord(47)-mean_coord(49))^2+(mean_coord(48)-mean_coord(50))^2); %left lower leg
L2627=sqrt((mean_coord(51)-mean_coord(53))^2+(mean_coord(52)-mean_coord(54))^2); %left foot
L2728=sqrt((mean_coord(53)-mean_coord(55))^2+(mean_coord(54)-mean_coord(56))^2); %left foot
L2628=sqrt((mean_coord(51)-mean_coord(55))^2+(mean_coord(52)-mean_coord(56))^2); %left foot
L2930=sqrt((mean_coord(57)-mean_coord(59))^2+(mean_coord(58)-mean_coord(60))^2); %left toes

L21=L12;
L43=L34;
L65=L56;
L87=L78;
L109=L910;
L1211=L1112;
L1413=L1314;
L1615=L1516;
L1817=L1718;
L1918=L1819;
L1917=L1719;
L2120=L2021;
L2322=L2223;
L2524=L2425;
L2726=L2627;
L2827=L2728;
L2826=L2628;
L3029=L2930;

















