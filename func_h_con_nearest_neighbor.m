function [solution, distance_total] = ...
    func_h_con_nearest_neighbor(distance_matrix)
% Heuristica de melhoramento do Vizinho mais Proximo para problemas do tipo
% Carteiro Viajante
%
% Parametros: 
% distance_matrix - Matriz de distancias entres as cidades
% Retorno: 
% solution - Vetor com a ordem de visita das cidades
% distance_total - Valor da soma de todas as distancias percorridas

% Inicializacao das variaveis
n = size(distance_matrix, 1); % Numero de cidades
solution = zeros(1, n);       % Vetor de retorno com a ordem de visita
visited = false(1, n);        % Vetor de controle para cidades ja visitadas
distance_total = 0;           % Inicializar distancia total percorrida

% Visita da primeira cidades
current_city = randi(n);      % Define cidade inicial
visited(current_city) = true; % Marca a cidade inicial como visitada
solution(1) = current_city;   % Adiciona a cidade inicial na solucao

% Laco para realizar a visita em todas as cidades
for i = 2:n
    min_dist = inf;
    nearest_city = -1;
    
    for j = 1:n
        if ~visited(j) && distance_matrix(current_city, j) < min_dist
            min_dist = distance_matrix(current_city, j);
            nearest_city = j;
        end
    end
    
    solution(i) = nearest_city
    visited(nearest_city) = true;
    distance_total = distance_total + ...
        distance_matrix(solution(i-1), nearest_city);
    current_city = nearest_city;
end

% solution(n + 1) = start_city;

end