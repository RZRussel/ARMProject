function draw(q, robot, legColor, jointColor)
% Draws simple serial robot visualization for given joint coordinates.
% It is assumed that rotation axis of joints is collinear with one ...
% of the frame axis.
% q - vector of joint coordinates
% robot - robot's description
    hold on;

    H = createTransform(0, 0, 0, 0, 0, 0);
    drawingRadius = 0;
    for i = 1:length(robot.Joints)
        prevOrigin = H(1:3,4);
        joint = robot.Joints(i);
        R = createTransform(q(i)*joint.axis(1), ...
            q(i)*joint.axis(2), q(i)*joint.axis(3), 0, 0, 0);
        H = H * R;
        drawSphere(prevOrigin(1), prevOrigin(2), prevOrigin(3), ...
            0.5, jointColor);
    
        if ~isempty(joint.child)
            link = joint.child(1);
            T = createTransform(0, 0, 0, ...
                link.length*link.axis(1), link.length*link.axis(2), ...
                link.length*link.axis(3));
            H = H * T;
            nextOrigin = H(1:3,4);
            plot3([prevOrigin(1) nextOrigin(1)], ...
                [prevOrigin(2) nextOrigin(2)], ...
                [prevOrigin(3) nextOrigin(3)], ...
                'Color', legColor);
            drawingRadius = drawingRadius + link.length;
        end
    end

    if drawingRadius > 0
        axis([-drawingRadius drawingRadius ...
            -drawingRadius drawingRadius ...
            -drawingRadius drawingRadius]);
        daspect([1 1 1]);
        view([1, 1, 1]);
    end

    hold off;
end

function drawSphere(cx, cy, cz, r, color)
    [x, y, z] = sphere;
    surf(x*r+cx,y*r+cy,z*r+cz, 'FaceColor', color, 'EdgeColor', color);
end