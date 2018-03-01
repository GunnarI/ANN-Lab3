function p3_6_create_pic(data)

%transfor 1x1024 vector into 32x32
for n = 1:10
    picture(n,:) = data(n*10 - 9:n*10);
end

%plot the picture
for i = 1:10
    for j = 1:10
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