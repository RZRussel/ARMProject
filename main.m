clear;

robot_description;

draw([0 -0.9386 1.6642 0 0.0598 0], robot, 10, 'k', 'r');

T = FK([0 -pi/2 pi/2 0 pi/4 0], robot);
display(T);

T1 = FK([0 0.6435 -1.5708 0 1.7127 0], robot);
display(T1);

q = IK(T1, robot);
display(q);

J1 = Jacobian([0 0.6435 -1.5708 0 1.7127 0], robot);
display(J1);
display(det(J1));

J2 = Jacobian([0 -pi/2 pi/2 0 pi/4 0], robot);
display(J2);
display(det(J2));