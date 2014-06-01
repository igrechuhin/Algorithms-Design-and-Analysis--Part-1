function [array, count] = QuickSort( array, pivot_type )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[array, count] = doQuickSort( array, 1, length(array), pivot_type );

end

function [array, count] = doQuickSort( array, l, r, pivot_type )

count = 0;

if l >= r
    return
end

if strcmp(pivot_type, 'PIVOT_FIRST')
    p = array(l);
elseif strcmp(pivot_type, 'PIVOT_FINAL')
    p = array(r);
    [array(r), array(l)] = deal(array(l), array(r));
elseif strcmp(pivot_type, 'PIVOT_MEDIAN')
    m = l + floor((r-l) / 2);
    if is_median(array, l, m, r);
        p = array(l);
    elseif is_median(array, m, l, r);
        p = array(m);
        [array(m), array(l)] = deal(array(l), array(m));
    else
        p = array(r);
        [array(r), array(l)] = deal(array(l), array(r));
    end
end

count = count + r - l;

i = l+1;
for j = l+1:r
    if array(j) < p
        [array(i), array(j)] = deal(array(j), array(i));
        i = i + 1;
    end
end

[array(i-1), array(l)] = deal(array(l), array(i-1));

[array, countL] = doQuickSort(array, l, i-2, pivot_type);
[array, countR] = doQuickSort(array, i, r, pivot_type);

count = count + countL + countR;

end

function boolValue = is_median( array, i, j, k )
    boolValue = ((array(i) < array(j)) & (array(i) > array(k))) | ...
                ((array(i) > array(j)) & (array(i) < array(k)));
end