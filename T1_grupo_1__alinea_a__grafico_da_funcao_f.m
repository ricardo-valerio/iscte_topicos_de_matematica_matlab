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


% desenhar a função no intervalo [-5, 5] ----------------------------
fplot(f, [-5, 5], 'LineWidth', 2);
% -------------------------------------------------------------------


% encontrar as raízes -----------------------------------------------
x_intercept = fzero(f, -2.5);
plot(x_intercept, zeros(size(x_intercept)), 'ro', 'MarkerSize', 10);

x_intercept = fzero(f, -1.3);
plot(x_intercept, zeros(size(x_intercept)), 'ro', 'MarkerSize', 10);

x_intercept = fzero(f, -0.09);
plot(x_intercept, zeros(size(x_intercept)), 'ro', 'MarkerSize', 10);
% -------------------------------------------------------------------


% encontrar a ordenada na origem ------------------------------------
y_intercept = f(0);
plot(zeros(size(y_intercept)), y_intercept, 'go', 'MarkerSize', 10);
% -------------------------------------------------------------------


% assíntonta vertical -----------------------------------------------
xline(-2, 'r--', 'LineWidth', 1);
% -------------------------------------------------------------------


% assíntontas horizontais -------------------------------------------
yline(-1, 'm--', 'LineWidth', 1);
yline(1, 'g--', 'LineWidth', 1);
% -------------------------------------------------------------------


% adicionar título e texto aos eixos o gráfico ----------------------
title('Gráfico da Função f(x)');
xlabel('x');
ylabel('y');
% -------------------------------------------------------------------


% colocar grelha no gráfico -----------------------------------------
grid on;
% -------------------------------------------------------------------


% desativar o modo de retenção de gráfico ---------------------------
hold off;
% -------------------------------------------------------------------


% exibir os zeros da função na janela de comandos -------------------
disp('Zeros de f(x):');
disp(fzero(f, -2.3));
disp(fzero(f, -1.5));
disp(fzero(f, 0));
disp('Ordenada na origem:');
disp(f(0));
% -------------------------------------------------------------------
