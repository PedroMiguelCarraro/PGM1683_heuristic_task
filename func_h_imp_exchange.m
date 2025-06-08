function solution = ...
    func_h_imp_exchange(solution,old_position,new_position)
% Heuristica de melhoramento de troca
%
% Parametros: 
% solution - Vetor com a ordem de visita das cidades
% old_position - Posicao original do valor a ser trocado
% new_position - Posicao destino do valor a ser trocado
% Retorno: 
% solution - Vetor com a ordem de visita com heuristica aplicada

% Realizar trocar por meio de uma variavel temporaria
temp_var = solution(old_position);
solution(old_position) = solution(new_position);
solution(new_position) = temp_var;

end