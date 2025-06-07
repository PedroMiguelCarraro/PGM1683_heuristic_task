function sol = gerasol(dim, lb, ub)
% Gerar solucao aleatoria

% Faixa de valores
%   |-----------| 
% -10           10  
%s
% Xi = LB +rand*range
    sol = zeros(1,dim);

    range = ub - lb;
    for i=1:dim
        sol(i) = lb + rand*range;
    end

end