function T = FK(q,robot)
%   Computes homogeous transformation for the end effector.
%   It is assumed that robot is serial and rotation axis coincide with one
%   of the frame axis.
%   q - joint coordinates.
%   robot - robot's description.

    T = createTransform(0, 0 , 0, 0, 0, 0);
    for i = 1:length(robot.Joints)
        joint = robot.Joints(i);
        H = createTransform(q(i)*joint.axis(1), ...
            q(i)*joint.axis(2), q(i)*joint.axis(3), 0, 0, 0);
        T = T * H;
        
        if ~isempty(joint.child)
            link = joint.child(1);
            H = createTransform(0, 0, 0, ...
                link.length*link.axis(1), link.length*link.axis(2), ...
                link.length*link.axis(3));
            T = T * H;
        end
    end
    
end

