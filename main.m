clear;
clc;

robot_description;

draw([0 -pi/2 pi/2 0 0 0], robot, 10, 'k', 'r');

T = FK([0 -pi/2 pi/2 0 0 pi], robot);
q = IK(T, robot);
T1 = FK(q(1:6,1), robot);
T2 = FK(q(1:6,2), robot);
display(T);
display(T1);
display(T2);