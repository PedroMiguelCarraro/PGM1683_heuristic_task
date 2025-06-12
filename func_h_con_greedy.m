function [selectedItems, totalValue, totalWeight] = ...
    func_h_con_greedy(weights, values, capacity)

    % Ensure weights and values are column vectors and have the same number of elements
    if ~iscolumn(weights)
        weights = weights(:);
    end
    if ~iscolumn(values)
        values = values(:);
    end

    numItems = length(weights);

    % Calculate the value-to-weight ratio for each item
    % Handle cases where weight might be zero to avoid division by zero.
    % In such cases, the ratio could be considered infinitely high or handled
    % based on problem specifics (e.g., set to a very large number).
    % For simplicity, if weight is 0, we'll set ratio to Inf if value > 0, else 0.
    ratios = zeros(numItems, 1);
    for i = 1:numItems
        if weights(i) > 0
            ratios(i) = values(i) / weights(i);
        elseif values(i) > 0 % Weight is 0 but value is positive, very desirable
            ratios(i) = Inf;
        else % Both weight and value are 0
            ratios(i) = 0;
        end
    end

    % Sort items by their value-to-weight ratio in descending order
    % 'idx' stores the original indices of the sorted items
    [~, sortedIndices] = sort(ratios, 'descend');

    % Initialize variables for the greedy selection process
    selectedItems = zeros(1, numItems); % Binary vector to track selected items
    currentWeight = 0;
    totalValue = 0;

    % Iterate through the sorted items and add them to the knapsack if capacity allows
    for i = 1:numItems
        originalIndex = sortedIndices(i); % Get the original index of the current item

        % Check if adding the current item exceeds the knapsack capacity
        if (currentWeight + weights(originalIndex)) <= capacity
            % If it fits, add the item to the knapsack
            selectedItems(originalIndex) = 1; % Mark item as selected
            currentWeight = currentWeight + weights(originalIndex);
            totalValue = totalValue + values(originalIndex);
        end
    end

    totalWeight = currentWeight; % Set the final total weight

end
