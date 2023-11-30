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
set(gca,'xtick',-5:1:5);
set(gca,'ytick',-5:1:5);
xlim ([-5, 5]);
ylim ([-5, 5]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% -------------------------------------------------------------------


%  criar uma variável simbólica 'x' --------------------------------- 
syms x;
% -------------------------------------------------------------------


% definir a função --------------------------------------------------
f = @(x) x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
% -------------------------------------------------------------------


% Calcular a derivada --------------------------------
df = diff(f, x);
% ----------------------------------------------------


% Converter a derivada para uma função MATLAB --------
df_func = matlabFunction(df);
% ----------------------------------------------------


% desenhar a função no intervalo [-5, 5] ----------------------------
fplot(df_func, [-5, 5], 'LineWidth', 2);
% -------------------------------------------------------------------


% encontrar as raízes -----------------------------------------------
x_intercept = fzero(df_func, -1);
plot(x_intercept, zeros(size(x_intercept)), 'ro', 'MarkerSize', 10);
% -------------------------------------------------------------------


% encontrar a ordenada na origem ------------------------------------
y_intercept = df_func(0);
plot(zeros(size(y_intercept)), y_intercept, 'go', 'MarkerSize', 10);
% -------------------------------------------------------------------


% assíntonta vertical -----------------------------------------------
xline(-2, 'k--', 'LineWidth', 1);
% -------------------------------------------------------------------


% assíntonta horizontal ---------------------------------------------
yline(0, 'm--', 'LineWidth', 1);
% -------------------------------------------------------------------


% adicionar título e texto aos eixos o gráfico ----------------------
title("Gráfico da Função f'(x)");
xlabel('x');
ylabel('y');
% -------------------------------------------------------------------


% colocar grelha no gráfico -----------------------------------------
grid on;
% -------------------------------------------------------------------

% desativar o modo de retenção de gráfico ---------------------------
hold off;
% -------------------------------------------------------------------
