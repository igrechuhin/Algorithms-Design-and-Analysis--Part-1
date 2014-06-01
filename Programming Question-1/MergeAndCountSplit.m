function [ array, count ] = MergeAndCountSplit( left, right )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    li = 1; ll = length(left);
    ri = 1; rl = length(right);
    
    array = zeros(ll + rl, 1);
    ai = 1;
    count = 0;

    while li <= ll && ri <= rl
        if left(li) <= right(ri)
            array(ai) = left(li);
            li = li + 1;
        else
            array(ai) = right(ri);
            ri = ri + 1;
            count = count + ll - li + 1;
        end
        ai = ai + 1;
    end
    
    if li <= ll
        array(ai:end) = left(li:end);
    else
        array(ai:end) = right(ri:end);
    end
end

