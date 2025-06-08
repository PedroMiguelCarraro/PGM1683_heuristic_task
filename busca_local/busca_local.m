clear all;
close all;
clc;

% Caso exemplo vetor de dois valores
%  ___ 
% |_|_|
% X1 X2

% ###### Variaveis de Controle ######

% Dimensao da instancia
dim = 2;

% Habilita grafico de melhora do fo
% Desligado = 0
% Ativo     = 1
ativa_graf = 0;

% Habilita grafico 3D da funcao
% Desligado = 0
% Ativo     = 1
ativa_func_graf = 0;

% Dominio de solucao
% Acley      = 1
% Rosenbrock = 2
% Default    = Acley
tipo_func = 1;

% Numero de iteracoes ate encontrar o melhor vizinho
max_iteracoes = 5000;

% Numero maximo de simulacoes executadas
max_ages = 5;


% ###### Programa e logicas ######

switch tipo_func
   case 1
        % Acley
        lb = -32.7680; % lowerbound
        ub = 32.7680;  % upperbound
   case 2
        % Rosenbrock
        lb = -2.048; % lowerbound
        ub = 2.048;  % upperbound
   otherwise
        % Acley
        lb = -32.7680; % lowerbound
        ub = 32.7680;  % upperbound
end

maxage = max_ages;

for k = 1:maxage

    % Gerar solucao inicial e a melhor
    sol = gerasol(dim, lb, ub);
    best = sol;
    
    % Teste de melhor local global
    % sol = [0 0]
    % fo_sol ==> 4.4409e-16
    % menor diferenca esp = 2.2204e-16
    
    % Avalair solucao da solucao e da melhor
    fo_sol = avalia(sol, tipo_func);
    fo_best = fo_sol;
    % historico das melhores fo
    iter = 0;
    fo_hist(1,:) = [0 fo_best];
    
    % Limite de iteracao
    % maxiter = 500;
    % maxiter = 2000;
    maxiter = max_iteracoes;
    
    cont = 0; % inicializa variavel de controle para contagem
    % tenta ate maxiter vezes ate achar melhor, reinicia caso achar
    while cont < maxiter
        % gerar um vizinho
        viz = geraviz(sol, lb, ub);
        % avalaia o vizinho
        fo_viz = avalia(viz, tipo_func);
    
        % compara as avalaicoes
        delta = fo_viz - fo_sol;
        % atualiza solcuao se vizionho for melhor
        if delta < 0
            sol = viz;
            fo_sol = fo_viz;
            cont = 0;
            % testar se a sol e a melhor, atualizar caso sim
            if fo_sol < fo_best
                best = sol;
                fo_best = fo_sol;
            end
        end
    
        cont  = cont + 1;
        iter = iter + 1;
        if ativa_graf == 1
            fo_hist(iter+1,:) = [iter fo_best];
        end
    end
    
    % fo_hist = 10*log10(fo_hist);
    if ativa_graf == 1
        plot(fo_hist(:,1),fo_hist(:,2), 'linewidth',2)
    end

    FO(k) = fo_best;
end

melhor = min(FO)
media = mean(FO)
desvio = std(FO)
