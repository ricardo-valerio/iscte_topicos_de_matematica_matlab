function valores_max_em_modulo_de_f2 = Rotina_encontrar_valores_max_em_modulo_de_P_em_f2( ...
    negative_abs_f2, ... % função simétrica do módulo de f2 a fim de se poder usar a função <fminbnd> para encontrar os minimo nos subintervalos
    P, ... % Vetor que contém os pontos da partição P do enunciado
    NUMERO_DE_SUB_INTERVALOS_DE_PROCURA ... % nº de subintervalos para dividir cada um dos intervalos da partição a fim de procurar os minimos todos
)                                           % a ideia disto serve para compensar a limitação da função <fminbnd> em retornar apenas um minimo local
                                            % e não o mínimo absoluto do intervalo.
                                            % ler info na documentação em: https://www.mathworks.com/help/matlab/ref/fminbnd.html


    valores_max_em_modulo_de_f2 = zeros(size(P));

    for i = 1:length(P)

        switch i
            case 1
                % ignorar os valores de 'x' retornados com '~': https://www.mathworks.com/help/matlab/matlab_prog/ignore-function-outputs.html
                [~, y_min_local] = fminbnd( ...
                                        negative_abs_f2, ...
                                        P(i), ...
                                        P(i) ...
                                   );

                valores_max_em_modulo_de_f2(i) = abs(y_min_local);

            case 11
                break
        end


        for j = 1:NUMERO_DE_SUB_INTERVALOS_DE_PROCURA

            lower_bound = P(i) + ((P(i + 1) - P(i)) / NUMERO_DE_SUB_INTERVALOS_DE_PROCURA) * (j - 1);
            upper_bound = P(i) + ((P(i + 1) - P(i)) / NUMERO_DE_SUB_INTERVALOS_DE_PROCURA) * j;

            [~, y_min_sub_local] = fminbnd( ...
                                        negative_abs_f2, ...
                                        lower_bound, ...
                                        upper_bound ...
                                   );

            % para atender à limitação de a função fminbnd não considerar --------------------------
            % os limites do intervalo: https://www.mathworks.com/help/matlab/ref/fminbnd.html
            if negative_abs_f2(upper_bound) < y_min_sub_local
                y_min_sub_local = negative_abs_f2(upper_bound);
            end
            % --------------------------------------------------------------------------------------

            if y_min_sub_local < y_min_local
                y_min_local = y_min_sub_local;
            end

        end

        valores_max_em_modulo_de_f2(i + 1) = abs(y_min_local);

    end

end
