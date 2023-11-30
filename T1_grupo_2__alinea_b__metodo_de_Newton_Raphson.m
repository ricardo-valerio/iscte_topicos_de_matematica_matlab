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


%  criar uma variável simbólica 'x' --------------------------------- 
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
h = @(x) 2-(log(x)/2) - x;
% -------------------------------------------------------------------


% 1ª derivada de h --------------------------------------------------
dh = matlabFunction(diff(h, x));
% -------------------------------------------------------------------


% desenhar a função h -----------------------------------------------
fplot(h, 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar onde está a raíz -----------------------------------------
x_intercept = fzero(h, 2);
plot(x_intercept, zeros(size(x_intercept)), 'ro', 'MarkerSize', 10);
% -------------------------------------------------------------------


% econtrar o zero através do método Newton-Raphson ------------------
% h é a função
% dh é a 1ª derivada de h
% 2 é o ponto inicial escolhido
% 0.0001 é o valor dos erros
% 50 é o nº de iterações
MetNR(h, dh, 2, 0.0001, 0.0001, 50)
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
