function J = Jacobian(q,robot)
%   Computes Jacobian using skew theory
%   q - joints coordinates
%   robot - description of the robot
    T = FK(q, robot);
    J = zeros(6, length(robot.Joints));
    for i = 1:length(robot.Joints)
        subrobot.Links = robot.Links(1:i-1);
        subrobot.Joints = robot.Joints(1:i-1);
        Ts = FK(q(1:i), subrobot);
        dO = T(1:3, 4) - Ts(1:3,4);
        zi = Ts(1:3, 1:3) * robot.Joints(i).axis';
        
        J(1:6, i) = [(zi(2)*dO(3) - zi(3)*dO(2)); ...
            (zi(3)*dO(1) - zi(1)*dO(3)); ...
            (zi(1)*dO(2) - zi(2)*dO(1));
            zi];
    end

end

