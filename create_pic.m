function create_pic(data)

%transfor 1x1024 vector into 32x32
for n = 1:32
    picture(n,:) = data(n*32 - 31:n*32);
end

%plot the picture
figure
for i = 1:32
    for j = 1:32
        if picture(i,j) == 1
            plot(i,j,'ko')
            hold on
        else
            plot(i,j,'wo')
            hold on
        end
    end
end
hold off
end