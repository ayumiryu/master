function  tuplex = toggle( to, x, y)
temp = y +(x-1)*4;
temp1 = to;
if (temp1(temp) == -1)
    temp1(temp) = 1;
else temp1(temp) = -1;
end
tuplex=temp1;

end  