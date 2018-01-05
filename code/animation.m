function [] = animation(q)

for i=1:2:size(q,1)
    qm=q(i,:)/1000;
    %convert data from mm to meters
    
    
    %create plot and define axis dimensions
    newplot;
    axis([-1 2 -0.5 2]);
    
    
    hold on;
    
    %head/neck
    line([qm(1) qm(3)],[qm(2) qm(4)]);
    
    %right upper arm
    line([qm(5) qm(7)],[qm(6) qm(8)],'color','r');
    
    %right lower arm
    line([qm(9) qm(11)],[qm(10) qm(12)],'color','r');
    
    %left upper arm
    line([qm(13) qm(15)],[qm(14) qm(16)]);
    
    %left lower arm
    line([qm(17) qm(19)],[qm(18) qm(20)]);
    
    %trunc
    line([qm(21) qm(23)],[qm(22) qm(24)]);
    
    %right upper leg
    line([qm(25) qm(27)],[qm(26) qm(28)],'color','r');
    
    %right lower leg
    line([qm(29) qm(31)],[qm(30) qm(32)],'color','r');
    
    %right foot
    line([qm(33) qm(35)],[qm(34) qm(36)],'color','r');
    line([qm(35) qm(37)],[qm(36) qm(38)],'color','r');
    line([qm(33) qm(37)],[qm(34) qm(38)],'color','r');
    
    %right fingers
    line([qm(39) qm(41)],[qm(40) qm(42)],'color','r');
    
    %left upper leg
    line([qm(43) qm(45)],[qm(44) qm(46)]);
    
    %left lower leg
    line([qm(47) qm(49)],[qm(48) qm(50)]);
    
    %left foot
    line([qm(51) qm(53)],[qm(52) qm(54)]);
    line([qm(53) qm(55)],[qm(54) qm(56)]);
    line([qm(51) qm(55)],[qm(52) qm(56)]);
    
    %left fingers
    line([qm(57) qm(59)],[qm(58) qm(60)]);
    hold all
    for i=1:30
        plot(qm(2*i-1),qm(2*i),'o', 'MarkerFaceColor', 'm')
    end
    
    
    drawnow
    
    hold off;
end

end