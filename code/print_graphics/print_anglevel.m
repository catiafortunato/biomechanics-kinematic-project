function[]=print_anglevel(V,A,l)

t_final=(size(A,1)+floor(size(A,1)/100))/100;
t=0:1/99:t_final;
figure(6)
hold on
qx=V(:,l)'; 
graph1=plot(t,qx,'m');
set(graph1,'LineWidth',2);
title('Angular Velocity')
legend('x direction')
xlabel('Time (s)')
ylabel('Angular Velocity (rad/s)')
drawnow
hold off
end