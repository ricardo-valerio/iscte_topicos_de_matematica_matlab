function imagens_de_P_pelo_MPM = Rotina_calcular_imagens_de_P_pelo_MPM( ...
    P, ...
    valores_max_em_modulo_de_f2, ...
    f, ...
    print_intervalos ... % será do tipo boolean (true or false) e permitirá fazer print ou não dos intervalos
)

    imagens_de_P_pelo_MPM = zeros(size(P));

    if print_intervalos
        % apenas para debug: -----------------------------------------------------------------------
        disp("---------------------------------------------------------");
        % ------------------------------------------------------------------------------------------
    end

    for i = 1:length(P)

        % =========== encontrar o nº mínimo (inteiro positivo) de subintervalos ================
        n = ceil( ...
                sqrt( ...
                    (abs(valores_max_em_modulo_de_f2(i))*(P(i).^3)*100)/24 ...
                ) ...
            );

        % não permitir que o n seja zero para P(1), pois a rotina IntMPM não vai gostar ---
        if n == 0
            n = 1;
        end
        % ---------------------------------------------------------------------------------

        if print_intervalos
            % apenas para debug:
            disp("nº mínimo de subintervalos entre [0; " + num2str(i-1) + "pi/5]: " + num2str(n));
            % ======================================================================================
        end


        % =========== calcular a integral com o método dos pontos médios ================
        integral_aproximada = IntMPM(f, P(1), P(i), n);

        % apenas para debug:
        % disp("integral aproximada de [0;" + num2str(P(i)) + "]: ");
        % disp(integral_aproximada);
        % disp("-------------------------------------" + newline);
        % ======================================================================================


        % armazenar o resultado --------------------------------------------
        imagens_de_P_pelo_MPM(i) = integral_aproximada;
        % ------------------------------------------------------------------
    end

    if print_intervalos
        % apenas para debug: -----------------------------------------------------------------------
        disp("---------------------------------------------------------" + newline);
        % ------------------------------------------------------------------------------------------
    end
end
