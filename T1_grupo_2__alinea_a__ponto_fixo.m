% reset às settings gráficas anteriormente definidas ----------------
clf;
% -------------------------------------------------------------------


% -------------------------------------------------------------------
% retém o gráfico atual e certas propriedades dos eixos
% de modo a que comandos gráficos subsequentes
% adicionem ao gráfico existente.
hold on;
% -------------------------------------------------------------------


%  criar uma variável simbólica 'x' ---------------------------------
syms x;
% -------------------------------------------------------------------


% função do enunciado -----------------------------------------------
g=@(x) 2-(log(x)/2);
% -------------------------------------------------------------------


% função y = x ------------------------------------------------------
bissetriz_dos_quadrantes_impares=@(x) x;
% -------------------------------------------------------------------


% desenhar as funções no intervalo [sqrt(2), 2] ---------------------
fplot(bissetriz_dos_quadrantes_impares, [sqrt(2), 2]);
fplot(g, [sqrt(2), 2], 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar o ponto fixo ---------------------------------------------
pf_zero = matlabFunction(2-(log(x)/2)-x);
pf_intercept = fzero(pf_zero, 2);
plot(pf_intercept, pf_intercept, 'go', 'MarkerSize', 10);
% -------------------------------------------------------------------


% chamar a rotina que calcula o ponto fixo --------------------------
% g é a função
% 1 foi o valor inicial escolhido
% 0.0001 erro do passo (distância entre dois 'x's consecutivos)
% 50 é o nº de iterações a realizar
PontoFixo(g, 1, 0.0001, 50)
% -------------------------------------------------------------------


% demonstrar que o ponto fixo é único no intervalo [sqrt(2), 2] -----
% 1ª derivada de g
dg = matlabFunction(diff(g, x));
% desenhar a 1ª derivada no gráfico ---------------------------------
fplot(dg, [sqrt(2), 2], 'Color', '#EDB120', 'LineWidth', 2);
% -------------------------------------------------------------------


% mostrar valor de f'(x) nos extremos do intervalo [sqrt(2), 2] -----
disp("valor de f'(sqrt(2)):")
disp(dg(sqrt(2)));
disp("valor de f'(2)):")
disp(dg(2));
% -------------------------------------------------------------------


% adicionar título e texto aos eixos o gráfico ----------------------
title({"A função g(x), a bissetriz dos quadrantes " + newline + ...
    "ímpares e g'(x) no intervalo [sqrt(2), 2]"});
xlabel('x');
ylabel('y');
% -------------------------------------------------------------------


% colocar grelha no gráfico -----------------------------------------
grid on;
% -------------------------------------------------------------------


% desativar o modo de retenção de gráfico ---------------------------
hold off;
% -------------------------------------------------------------------

