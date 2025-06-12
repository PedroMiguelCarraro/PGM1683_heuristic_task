% Problema da Mochila (KP)
clear all;
close all;
clc;

% ###### Variaveis de Controle ######

% Escolha da Instancia
% Alpinista            = 1
% knapPI_1_1000_1000_1 = 2
% Default              = Alpinista
instance_type = 1;

% Tipo de heuristica de melhoramento
% Insercao = 1
% Troca    = 2
% Default  = Insercao
huristic_imp_type = 1;

% Habilita grafico de melhora do fo
% Desligado = 0
% Ativo     = 1
enable_graf = 0;

% Numero de iteracoes ate encontrar o melhor vizinho
% Caso 1 = 500;
% Caso 2 = 2000;
max_loops = 500;

% Numero maximo de simulacoes executadas
max_ages = 1;


% ###### Programa e logicas ######

switch instance_type
   case 1
        % Alpinista
        instance_file_name = 'instances\alpinista';
        [n_itens, w_max, w_vec, v_vec, initialSolution] = ...
            func_import_kp_dataset(instance_file_name);
   case 2
        % knapPI_1_1000_1000_1
        instance_file_name = 'instances\knapPI_1_1000_1000_1';
        [n_itens, w_max, w_vec, v_vec, initialSolution] = ...
            func_import_kp_dataset(instance_file_name);
   otherwise
        % Alpinista
        instance_file_name = 'instances\alpinista';
        [numItems, capacity, weights, values, initialSolution] = ...
            func_import_kp_dataset(instance_file_name);
end

return

for k = 1:max_ages

    % Gerar solucao inicial e a melhor e calcular distancia total
    [sol, fo_sol] = func_h_con_nearest_neighbor(dist_matrix);
    best = sol;
    fo_best = fo_sol;
   
    % Historico das melhores fo
    iter = 0;
    fo_hist(1,:) = [0 fo_best];
    
    cont = 0; % inicializa variavel de controle para contagem
    % Tenta ate maxiter vezes achar o melhor, reinicia contador caso achar
    while cont < max_loops

        % Aplicar heuristica de melhoramento
        sol_h_imp = func_h_imp_insertion_n_exchange(sol,huristic_imp_type);
    
        % Calcular distancia total da nova solucao
        fo_sol_h_imp = func_distance_total_calc(dist_matrix, sol_h_imp);
    
        % Comparar distancias totais
        delta = fo_sol_h_imp - fo_sol;
        % Atualiza melhor solucao se a nova for melhor
        if delta < 0
            sol = sol_h_imp;
            fo_sol = fo_sol_h_imp;
            cont = 0;
            % Testar se a sol e a melhor, caso sim atualizar
            if fo_sol < fo_best
                best = sol;
                fo_best = fo_sol;
            end
        end
    
        cont  = cont + 1;
        iter = iter + 1;
        if enable_graf == 1
            fo_hist(iter+1,:) = [iter fo_best];
        end
    end
    
    % fo_hist = 10*log10(fo_hist);
    if enable_graf == 1
        plot(fo_hist(:,1),fo_hist(:,2), 'linewidth',2)
    end

    FO(k) = fo_best;
    % if fo_best <= min(FO)
    %     best_the_best = best;
    % end
end

melhor = min(FO)
media = mean(FO)
desvio = std(FO)
