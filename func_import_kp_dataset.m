function [numItems, capacity, weights, values, initialSolution] = ...
    func_import_kp_dataset(instance_file_name)
% Funcao para importar dataset do problema da mochila
%
% Parametros: 
% instance_file_name - Nome do arquivo para o preprocessamento
% Retorno: 
% numItems - Numero de itens na mochila
% capacity - Pesp maximo da mochila
% weights - Vetor de pesos dos itens
% values - Vetor de valores dos itens
% initialSolution - Vetor da solucao initial se disponivel na entrada

    % Open the file for reading
    fileID = fopen(instance_file_name, 'r');
    if fileID == -1
        error('Failed to open the file: %s', instance_file_name);
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