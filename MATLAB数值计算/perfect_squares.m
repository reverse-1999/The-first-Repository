perfect_square=zeros(1,6);
k = 1;
i = 1;
while i^2 < 100
    if i^2>=10
        perfect_square(k) = i^2; 
        k = k+1;
    end
    i = i + 1;
end

perfect_square=sort(perfect_square,'descend');
disp(perfect_square);

j=1;
while j <= length(perfect_square)
    if mod(perfect_square(j),3) == 0
        perfect_square(j) = [];
        j = j-  1; %删除之后需要回退索引
    end
    j = j + 1;
end
disp(perfect_square);
str2 = num2str(perfect_square);
str1 = "square=";
perfect_square_str = str1 + str2;
disp(str2);
disp(perfect_square_str);

