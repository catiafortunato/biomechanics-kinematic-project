function[]=print_angles(P,A,l)

t_final=(size(A,1)+floor(size(A,1)/100))/100;
t=0:1/99:t_final;
figure(5)
hold on
qx=P(:,l)';
graph1=plot(t,qx,'m');
set(graph1,'LineWidth',2);
title('Angles over Time')
legend('x direction')
xlabel('Time (s)')
ylabel('Angle (rad)')
drawnow
hold off

end