function distance_total = ...
    func_distance_total_calc(distance_matrix, solution)
% Funcao para calcular a distacia total percorrida de uma dada solucao
%
% Parametros: 
% distance_matrix - Matriz de distancias entres as cidades
% solution - Vetor com a ordem de visita das cidades
% Retorno: 
% distance_total - Valor da soma de todas as distancias percorridas


% Inicializacao das variaveis
n = size(solution, 2); % Tamanho da solucao
distance_total = 0;    % Inicializar distancia total percorrida

for i = 1:n-1
    distance_total = distance_total + ...
        distance_matrix(solution(i), solution(i+1));
end

end