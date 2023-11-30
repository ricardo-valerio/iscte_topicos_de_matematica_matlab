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


% Mostrar cálculos na janelas de comandos ---------------------------
disp("1ª derivada de f:");
disp(f1(0));
disp("2ª derivada de f:");
disp(f2(0));
disp("Polinómio de Taylor de 2ª ordem:");
disp(Taylor(x,0));
% -------------------------------------------------------------------


% calcular o erro cometido usando os valores superiores
erro_cometido = 3.255*abs(((0.5).^3)/factorial(3));


% mostrar o erro máximo cometido
disp("Erro máximo cometido usando os valores superiores dos cálculos " + ...
    "anteriores: ");
disp(erro_cometido);
disp("3.255*abs(((0.5).^3)/factorial(3) = " + num2str(erro_cometido));


% desenhar a função no intervalo [-0.5, 0.5] ------------------------
fplot(f, [-0.5, 0.5], 'LineWidth', 2);
% -------------------------------------------------------------------

fplot(f3, [-0.5, 0.5], 'g', 'LineWidth', 2);


% desenhar o polinómio de Taylor no intervalo [-5, 5] no ponto a = 0
fplot(Taylor(x, 0), [-0.5, 0.5], 'r--', 'LineWidth', 2);
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
