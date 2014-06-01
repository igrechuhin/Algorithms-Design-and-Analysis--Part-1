function [ array, count ] = SortAndCount( array )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    len = length(array);
    if len <= 1
        count = 0;        
        return
    end
    mid = floor(len/2);
    [left, count_left] = SortAndCount(array(1:mid));
    [right, count_right] = SortAndCount(array(mid+1:end));
    [array, count_split] = MergeAndCountSplit(left, right);
    
    count = count_left+count_right+count_split;
end

