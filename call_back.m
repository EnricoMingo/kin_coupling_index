function [  ] = call_back(robot, q)

v = [1 1 1 1 1 1]';
[qdot_v,qdot_v_norm, orient_indices, orient_index] = ik_index(robot, q, v);

global h
if isempty(h)
    h = figure();
else
    figure(h);
end
plotter(qdot_v_norm, {'Vx', 'Vy', 'Vz', 'Wx', 'Wy', 'Wz'})

% global h1
% if isempty(h1)
%     h1 = figure();
% else
%     figure(h1);
% end
% plotter(qdot_v, {'Vx', 'Vy', 'Vz', 'Wx', 'Wy', 'Wz'})

global h2
if isempty(h2)
    h2 = figure();
else
    figure(h2);
end

bar(orient_indices);
title('Orientation indices');
xlabel('1:Wx    2:Wy    3:wZ');


orient_index

end

