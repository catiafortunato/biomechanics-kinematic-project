function [] = print_velocity(totalq,A,l)
t_final=(size(A,1)+floor(size(A,1)/100))/100;
t=0:1/99:t_final;
figure(3)

hold on
qx=totalq(:,2*l-1)/1000';
qy=totalq(:,2*l)/1000';
graph1=plot(t,qx,'m',t,qy,'b');
set(graph1,'LineWidth',2);
title('Velocity over Time')
legend('x direction','y direction')
xlabel('Time (s)')
ylabel('Velocity (m/s)')
drawnow
hold off

end