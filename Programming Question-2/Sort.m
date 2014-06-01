clear;

input_array = ReadArray('QuickSort.txt');

[ array, count_first ] = QuickSort( input_array, 'PIVOT_FIRST' );
[ array, count_final ] = QuickSort( input_array, 'PIVOT_FINAL' );
[ array, count_median ] = QuickSort( input_array, 'PIVOT_MEDIAN' );

[count_first, count_final, count_median]