function solution = ...
    func_h_imp_insertion_n_exchange(solution, huristic_type)

    n = size(solution,2);
    old_position = randi(n);
    new_position = randi(n);

    switch huristic_type
       case 1
            % Insercao
            solution = ...
                func_h_imp_insertion(solution,old_position,new_position);
       case 2
            % Troca
            solution = ...
                func_h_imp_exchange(solution,old_position,new_position);
       otherwise
            % Insercao
            solution = func_h_imp_insertion(solution);
    end

end