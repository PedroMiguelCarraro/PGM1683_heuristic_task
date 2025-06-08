function FO = avalia(sol,tipo_func)

% Funcao para availiar a solucao e gerar a FO

    switch tipo_func
    case 1
        % Ackley
        FO = ackley(sol);
    case 2
        % Rosenbrock
        FO = rosen(sol);
    otherwise
        % Ackley
        FO = ackley(sol);
    end

end