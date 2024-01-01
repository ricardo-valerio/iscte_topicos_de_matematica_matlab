% limpar a janela de comandos ---------------------------------------------
clc;
% -------------------------------------------------------------------------


% criar uma variável simbólica 't' ----------------------------------------
syms t;
% -------------------------------------------------------------------------


% função ------------------------------------------------------------------
f = @(t) sin(t.^2);
% -------------------------------------------------------------------------


% 2ª derivada -------------------------------------------------------------
f2 = matlabFunction(diff(f, t, 2));
% -------------------------------------------------------------------------


% simétrico do módulo da função f2 ----------------------------------------
negative_abs_f2 = matlabFunction(-abs(diff(f, t, 2)));
% -------------------------------------------------------------------------


% vetor com a Partição P --------------------------------------------------
P = [
    0;
    pi/5;
    2*pi/5;
    3*pi/5;
    4*pi/5;
    5*pi/5;
    6*pi/5;
    7*pi/5;
    8*pi/5;
    9*pi/5;
    2*pi;
];
% -------------------------------------------------------------------------




% encontrar os valores máximos em módulo de P em f2 por meio de uma função criada -------
valores_max_em_modulo_de_f2 = Rotina_encontrar_valores_max_em_modulo_de_P_em_f2( ...
                                negative_abs_f2, ...
                                P, ...
                                3 ... % nº de subintervalos de procura
                              );
% mostrar resultados obtidos:
disp("Resultados de |f''(x)| <= α entre [0, x] com x ∈ P:");
disp(valores_max_em_modulo_de_f2);
% ---------------------------------------------------------------------------------------



% encontrar os valores das imagens dos pontos em P por meio de uma função criada -------
imagens_de_P_pelo_MPM = Rotina_calcular_imagens_de_P_pelo_MPM( ...
                           P, ...
                           valores_max_em_modulo_de_f2, ...
                           f, ...
                           true ... % para fazer print aos n's (intervalos necessários)
                        );
% mostrar resultados obtidos:
disp("Resultados de g(x) para cada x ∈ P usando o método dos pontos médios:");
disp(imagens_de_P_pelo_MPM);
% ---------------------------------------------------------------------------------------
