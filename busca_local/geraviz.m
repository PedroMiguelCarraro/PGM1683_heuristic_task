function viz = geraviz(sol, lb, ub)
% Funcao para gerar um vizionho aleatorio baseado na solucao presente
    
    viz = sol; % vizinho inicaido como solucao

    n = length(sol); % define comprimento da solucao
    pos = randi(n);  % posicao aleatoria baseado no n
    range = ub-lb;   % define faixa base de valores

    % atualiza valor em uma posicao aleatoria
    viz(pos) = lb + rand*range; 

end