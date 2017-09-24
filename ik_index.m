function [ qdot_v, qdot_v_normalized, orient_indices, orient_index ] = ik_index( robot, q, v )
% Compute ik_index
% input:
%   robot: a robot
%   q: actual configuration
%   v: Cartesian Velocities
%
% The indices are computed in the following way:
%
%   J_pinv*v = [qdot_vx qdot_vy qdot_vz qdot_wz qdot_wy qdot_wz]
%
% where:
%
%   qdot_vi = [qdot1_vi qdot2_vi qdot3_vi ... qdotn_vi]', qdotj_vi = qdotj*vi
%
% so for each velocity direction we compute the normalized vector:
%
%   qdot_vi_normalized = abs(qdot_vi)/max(abs(qdot_vi));
%

q;
J = robot.jacob0(q);
J_rank = rank(J);
J_pinv = pinv(J);

qdot_v = zeros(size(J_pinv));
qdot_v_normalized = zeros(size(J_pinv));
for i = 1:1:size(J_pinv,2)
    qdot_v(:,i) = J_pinv(:,i)*v(i);
    qdot_v_max = max(abs(qdot_v(:,i)));
    if qdot_v_max ~= 0
        qdot_v_normalized(:,i) = abs(qdot_v(:,i))/qdot_v_max;
    end
end


orient_qdot_v_normalized = qdot_v_normalized(:,4:1:6);

% Here we compute the index considering the last three joints n = 3
n = 3; 
orient_indices = zeros(3,1);
for i = 1:1:3
    orient_indices(i) = sum(orient_qdot_v_normalized(length(q)-n+1:1:end,i))/sum(orient_qdot_v_normalized(1:1:length(q)-n,i));
end

orient_index = sum(orient_qdot_v_normalized(length(q)-n+1:1:end,1:1:3))/sum(orient_qdot_v_normalized(1:1:length(q)-n,1:1:3));

end

