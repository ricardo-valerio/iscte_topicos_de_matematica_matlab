% reset às settings gráficas anteriormente definidas ----------------
clf;
% -------------------------------------------------------------------


% -------------------------------------------------------------------
% retém o gráfico atual e certas propriedades dos eixos
% de modo a que comandos gráficos subsequentes
% adicionem ao gráfico existente.
hold on;
% -------------------------------------------------------------------


% settings do plano cartesiano --------------------------------------
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% -------------------------------------------------------------------


% criar uma variável simbólica 'x' ----------------------------------
syms x;
% -------------------------------------------------------------------


% transfomamos o problema da pesquisa do ponto fixo, que resolvemos
% na alínea anterior, num problema de pesquisa de zeros.
%
% Como o ponto fixo é o ponto de interseção entre a função g
% e a bissetriz dos quadrantes ímpares, temos que:
%
% Ponto fixo <=>  g(x) = x  <=>  g(x) - x = 0
%
% fazendo h(x) = g(x) - x temos: ------------------------------------
h = @(x) 2 - (log(x)/2) - x;
% -------------------------------------------------------------------


% desenhar a função h -----------------------------------------------
fplot(h, 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar onde está a raíz -----------------------------------------
x_intercept = fzero(h, 2);
plot(x_intercept, zeros(size(x_intercept)), 'ro', 'MarkerSize', 10);
% -------------------------------------------------------------------


% econtrar o zero através do método da bissecção --------------------
% h é a função
% sqrt(2) é o limite inferior do intervalo
% 2 é o limite superior do intervalo
% 0.0001 é o valor dos erros
% 50 é o nº de iterações
MetBiss(h, sqrt(2), 2, 0.0001, 0.0001, 50)
% -------------------------------------------------------------------


% adicionar título e texto aos eixos o gráfico ----------------------
title('A função h(x) = g(x) - x e o seu zero ( ponto fixo de g(x) )');
xlabel('x');
ylabel('y');
% -------------------------------------------------------------------


% colocar grelha no gráfico -----------------------------------------
grid on;
% -------------------------------------------------------------------


% desativar o modo de retenção de gráfico ---------------------------
hold off;
% -------------------------------------------------------------------
