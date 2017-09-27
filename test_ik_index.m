clear all;
close all;
clc;

mdl_jaco
%mdl_puma560

%robot = p560;
robot = jaco;

qlims = robot.qlim;

n = robot.n;
v = [1 1 1 1 1 1];
a = qlims(:,1);
b = qlims(:,2);

tot = 1000;

vec = [];
q_good = [];
for i = 1:1:tot
    q = a + (b-a).*rand(n,1);
    
    [ qdot_v, qdot_v_normalized, orient_indices, orient_index, r ] = ik_index( robot, q', v );
    vec(i) = orient_index;
    
    
    if(orient_index >= 12 && rank(robot.jacob0(q)))
       q_good = [q_good q]; 
       orient_index;
    end
end

y = 1:1:length(vec);
scatter(y, vec);


