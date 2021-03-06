%% Robot model description
%%% Link description
% link.type
% link.length
% link.axis %
% link.mass
% link.inertia  - inertia matrix
% link.stiffness- stiffness matrix
% -other parameters that you need
link1.type = "L";
link1.length = 200;
link1.axis = [0 0 1];

link2.type = "L";
link2.length = 455;
link2.axis = [1 0 0];

link3.type = "L";
link3.length = 96.56603957913983;
link3.axis = [1 0 0];

link4.type = "L";
link4.length = 330;
link4.axis = [1 0 0];

link5.type = "L";
link5.length = 80;
link5.axis = [1 0 0];

link6.type = "L";
link6.length = 100;
link6.axis = [1 0 0];

%%% Joint description
% joint.type
% joint.axis
% joint.limit
% joint.child
% joint.parent
% -other parameters that you need

joint1.type = "R";
joint1.axis = [0 0 1];
joint1.limit = [-170*pi/180 170*pi/180];
joint1.child = [link1];
joint1.parent = [];

joint2.type = "R";
joint2.axis = [0 1 0];
joint2.limit = [-190*pi/180 pi/4];
joint2.child = [link2];
joint2.parent = [link1];

joint3.type = "R";
joint3.axis = [0 1 0];
joint3.limit = [-120*pi/180 156*pi/180];
joint3.child = [link3];
joint3.parent = [link2];

joint4.type = "R";
joint4.axis = [1 0 0];
joint4.limit = [-pi pi];
joint4.child = [link4];
joint4.parent = [link3];

joint5.type = "R";
joint5.axis = [0 1 0];
joint5.limit = [-120*pi/180 120*pi/180];
joint5.child = [link5];
joint5.parent = [link4];

joint6.type = "R";
joint6.axis = [1 0 0];
joint6.limit = [-pi pi];
joint6.child = [link6];
joint6.parent = [link5];

%%% Robot assembly
% robot.Name - take a guess
% robot.Links - array with links
% robot.Joints - array with joints
robot.name = "KUKA AGILUS";
robot.Links = [link1 link2 link3 link4 link5 link6];
robot.Joints = [joint1 joint2 joint3 joint4 joint5 joint6];