function [numItems, capacity, weights, values, initialSolution] = ...
    func_import_kp_dataset(filename)
%IMPORTKNAPSACKDATA Imports data for the knapsack problem from a text file.
%   [numItems, capacity, weights, values, initialSolution] = importKnapsackData(filename)
%   reads the knapsack problem data from the specified 'filename'.
%
%   Input:
%     filename: The name of the text file containing the knapsack data.
%               The file format is expected to be:
%               Line 1: <number_of_items> <capacity>
%               Subsequent lines (up to number_of_items): <weight> <value>
%               Last section: A binary string (0s and 1s) representing a solution.
%
%   Outputs:
%     numItems: The total number of items.
%     capacity: The maximum capacity of the knapsack.
%     weights: A column vector of weights for each item.
%     values: A column vector of values for each item.
%     initialSolution: A row vector representing the initial solution (binary string).

    % Open the file for reading
    fileID = fopen(filename, 'r');
    if fileID == -1
        error('Failed to open the file: %s', filename);
    end

    % Read the first line to get numItems and capacity
    header = fscanf(fileID, '%d %d', [1, 2]);
    numItems = header(1);
    capacity = header(2);

    % Read the weights and values for each item
    % We will read all remaining numeric data as a single matrix
    data = fscanf(fileID, '%d %d', [2, numItems]);

    % Extract weights and values
    weights = data(1,:)'; % Transpose to get a column vector
    values = data(2,:)';  % Transpose to get a column vector

    % Read the rest of the file content as a single string to capture the binary solution
    % We use fgetl to read line by line until EOF, and then concatenate.
    % This is more robust for potentially irregular last lines.
    remainingContent = '';
    while ~feof(fileID)
        line = fgetl(fileID);
        if ischar(line)
            remainingContent = [remainingContent, line]; %#ok<AGROW>
        end
    end

    % Close the file
    fclose(fileID);

    % Parse the initial solution. We assume it's a sequence of '0' and '1'
    % separated by spaces. We need to filter out any non-numeric characters
    % and then convert to numbers.
    % First, replace any non-digit characters with spaces, then use str2num.
    % This handles potential multiple spaces or other separators.
    numericChars = regexp(remainingContent, '[01]', 'match');
    initialSolutionStr = strjoin(numericChars, ''); % Join the digits back into a single string
    
    if ~isempty(initialSolutionStr)
        % Convert the binary string to a numeric array
        % Using arrayfun to convert each character to a number
        initialSolution = arrayfun(@(x) str2double(x), initialSolutionStr);
    else
        initialSolution = []; % No initial solution found
        %disp('Warning: No initial solution (binary string) found in the file.');
    end

end