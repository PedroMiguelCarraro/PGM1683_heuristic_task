function distance_matrix = ...
    func_pre_process_distance_matrix(instance_file_name)
% Funcao para preprocessar todas as distancias e disponibilizar a matriz de
% distancias do problema
%
% Parametros: 
% instance_file_name - Nome do arquivo para o preprocessamento
% Retorno: 
% distance_matrix - Matriz de distancia do problema

% Abrir o arquivo da instancia
fid = fopen(instance_file_name, 'r');
if fid == -1
    error('Erro ao abrir o arquivo %s', instance_file_name);
end

% Inicializa variaveis de leitura
file_lines = {};
tline = fgetl(fid); % Read the first line
while ischar(tline)
    file_lines{end+1} = tline; %#ok<AGROW> % Append line to cell array
    tline = fgetl(fid); % Read the next line
end

% Close the file
fclose(fid);

% Find the start and end of the NODE_COORD_SECTION
start_idx = find(contains(file_lines, 'NODE_COORD_SECTION'), 1);
end_idx = find(contains(file_lines, 'EOF'), 1);

% Extract coordinate lines
if isempty(start_idx) || isempty(end_idx)
    error('Could not find NODE_COORD_SECTION or EOF markers in the file.');
end

% Adjust start_idx to skip the 'NODE_COORD_SECTION' line itself
coord_lines = file_lines(start_idx + 1 : end_idx - 1);

% Initialize a matrix to store coordinates
coordinates = [];

% Parse coordinates
for i = 1:length(coord_lines)
    line_data = sscanf(coord_lines{i}, '%d %f %f'); % Read city index, x, y
    if length(line_data) == 3
        % Store only x and y coordinates
        coordinates = [coordinates; line_data(2), line_data(3)]; %#ok<AGROW>
    else
        warning('Skipping malformed line: %s', coord_lines{i});
    end
end

% Get the number of cities
num_cities = size(coordinates, 1);

% Initialize the distance matrix with zeros
distance_matrix = zeros(num_cities, num_cities);

% Populate the distance matrix using Euclidean distance
for i = 1:num_cities
    for j = 1:num_cities
        % Euclidean distance formula: sqrt((x2-x1)^2 + (y2-y1)^2)
        distance = sqrt((coordinates(i, 1) - coordinates(j, 1))^2 + ...
                        (coordinates(i, 2) - coordinates(j, 2))^2);
        distance_matrix(i, j) = distance;
    end

end