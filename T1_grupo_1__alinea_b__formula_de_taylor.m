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
% set(gca,'xtick',-0.5:0.1:0.5);
% set(gca,'ytick',-0.5:0.1:0.5);
% xlim ([-0.5, 0.5]);
% ylim ([-4, 4]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% -------------------------------------------------------------------


% criar uma variável simbólica 'x' ----------------------------------
syms x;
% -------------------------------------------------------------------


% função f ----------------------------------------------------------
f = @(x) x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
% -------------------------------------------------------------------


% 1ª derivada -------------------------------------------------------
f1 = matlabFunction(diff(f, x));
% -------------------------------------------------------------------


% 2ª derivada -------------------------------------------------------
f2 = matlabFunction(diff(f, x, 2));
% -------------------------------------------------------------------


% fórmula de Taylor de 2ª ordem com argumento 'a' -------------------
Taylor = @(x,a) f(a) + f1(a)*(x-a) + f2(a)*((x-a).^2)/2;
% -------------------------------------------------------------------


% 3ª derivada para calcular o erro ----------------------------------
df3 = diff(f, x, 3);
f3 = matlabFunction(df3);
% -------------------------------------------------------------------


% 4ª derivada para ajudar a encontrar o maior valor em módulo  ------
df4 = diff(f, x, 4);
f4 = matlabFunction(df4);
% -------------------------------------------------------------------


% desenhar a função no intervalo [-0.5, 0.5] ------------------------
fplot(f, [-0.5, 0.5], 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar a função 3ª derivada no intervalo [-0.5, 0.5] ------------
fplot(f3, [-0.5, 0.5], 'g', 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar o polinómio de Taylor no intervalo [-5, 5] no ponto a = 0
fplot(Taylor(x, 0), [-0.5, 0.5], 'r--', 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar o zero de f4 no intervalo --------------------------------
minimizante_de_f3 = fzero(f4, 0);
plot(minimizante_de_f3, f3(minimizante_de_f3), 'ro', 'MarkerSize', 10);
% -------------------------------------------------------------------

% adicionar título e texto aos eixos o gráfico ----------------------
title({'A função f(x) no intervalo [-0.5, 0.5] e a sua aproximação', ...
    'de segunda ordem através da fórmula de Taylor.'});
xlabel('x');
ylabel('y');
% -------------------------------------------------------------------


% colocar grelha no gráfico -----------------------------------------
grid on;
% -------------------------------------------------------------------


% desativar o modo de retenção de gráfico ---------------------------
hold off;
% -------------------------------------------------------------------



% mostrar cálculos na janelas de comandos ---------------------------
disp("1ª derivada de f:");
disp(f1(0));
disp("2ª derivada de f:");
disp(f2(0));
disp("Polinómio de Taylor de 2ª ordem:");
disp(Taylor(x,0));
% -------------------------------------------------------------------


% Maior valor em módulo de df3 entre [-0.5, 0.5] --------------------
maior_valor_em_modulo_de_f3_no_intervalo = abs(f3(fzero(f4, 0)));
disp("Maior valor em módulo de df3 entre [0, x]:")
disp(maior_valor_em_modulo_de_f3_no_intervalo);
% -------------------------------------------------------------------


% Maior valor em módulo de (x.^3)/factorial(3) entre [-0.5, 0.5] ----
maior_valor_em_modulo_x3_over_3_factorial = abs(((0.5).^3)/factorial(3));
disp("Maior valor em módulo de df3 entre [0, 0.5]:")
disp(maior_valor_em_modulo_x3_over_3_factorial);
% -------------------------------------------------------------------


% calcular o erro cometido usando os valores superiores -------------
erro_cometido = maior_valor_em_modulo_de_f3_no_intervalo*maior_valor_em_modulo_x3_over_3_factorial;
% -------------------------------------------------------------------

% mostrar o majorante do erro cometido ------------------------------
disp("Majorante do erro cometido usando os valores superiores dos cálculos:");
disp(erro_cometido);
% -------------------------------------------------------------------
