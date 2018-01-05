function[]=print_angleacc(A,A2,l)

t_final=(size(A2,1)+floor(size(A2,1)/100))/100;
t=0:1/99:t_final;
figure(7)
hold on
qx=A(:,l)';
graph1=plot(t,qx,'m');
set(graph1,'LineWidth',2);
title('Angular Acceleration over Time')
legend('x direction')
xlabel('Time (s)')
ylabel('Angular Acceleration (rad/s^2)')
drawnow
hold off
end