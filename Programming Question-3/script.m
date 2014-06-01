clear all;

Graph = ReadArray('kargerMinCut.txt');

n = length(Graph);

N = ceil(n^2 * log(n));
minCut = Inf;
for i = 1:N
    cut = kargerMinCut(Graph);
    if cut < minCut
        minCut = cut;
    end
    [minCut cut i N]
end
[minCut i N]