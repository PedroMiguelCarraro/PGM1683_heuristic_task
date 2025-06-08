function solution = ...
    func_h_imp_insertion(solution,old_position,new_position)
% Heuristica de melhoramento de insercao
%
% Parametros: 
% solution - Vetor com a ordem de visita das cidades
% old_position - Posicao original do valor a ser trocado
% new_position - Posicao destino do valor a ser trocado
% Retorno: 
% solution - Vetor com a ordem de visita com heuristica aplicada

    % Caso seja a mesma posicao, sem mudancas necessarias
    if old_position == new_position
        return;
    end

    % Pega o elemento a ser movido
    moved_value = solution(old_position);
    
    % Remove o elemento da sua posição original
    solution(old_position) = [];

    % Insere o elemento na nova posição
    if new_position == 1
        solution_tmp = [moved_value, solution];
    else
        % Constrói a nova rota inserindo o elemento
        % Note que o vetor 'rota' agora tem n-1 elementos
        solution_tmp = [solution(1:new_position-1), ...
                        moved_value, ...
                        solution(new_position:end)];
    end

    solution = solution_tmp;

end