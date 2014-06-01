function MinEdges = kargerMinCut( Array )

Graph = cell(length(Array), 1);
for i = 1:length(Array)
    tmp = Array(i,:);
    tmp(isnan(tmp)) = [];
    Graph{i} = tmp;
end

while length(Graph) > 2
    v1Ind = randi(length(Graph), 1);

    v2Ind = Graph{v1Ind}(randi(length(Graph{v1Ind}), 1));
    
    merge = [Graph{v1Ind} Graph{v2Ind}];
    merge((merge == v1Ind) | (merge == v2Ind)) = [];
    
    maxVInd = max(v1Ind, v2Ind);
    minVInd = min(v1Ind, v2Ind);

    Graph{minVInd} = merge;
    Graph{maxVInd} = [];
    Graph = Graph(~cellfun('isempty',Graph));

    for i = 1:length(Graph)
        for j = 1:length(Graph{i})
            if Graph{i}(j) == maxVInd
                Graph{i}(j) = minVInd;
            elseif Graph{i}(j) > maxVInd
                Graph{i}(j) = Graph{i}(j) - 1;
            end
        end
    end
end

MinEdges = length(Graph{1});

end

