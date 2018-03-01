function  p3_4_create_subplot( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure
for i = 1:length(input(:,1))
    %create the title vector
    perc = int2str(i*10);
    plot_title = [perc, '% noise'];
    
    subplot(2,5,i)
    p_3_4_create_pic(input(i,:))
    title(plot_title)
end

end

