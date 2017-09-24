function [  ] = plotter( q_dot_v, capt)

for i = 1:1:size(q_dot_v,2)
    subplot(size(q_dot_v,2),1,i,'replace');
    bar(q_dot_v(:,i));
    title(capt(i))
    xlabel('q')
end


end

