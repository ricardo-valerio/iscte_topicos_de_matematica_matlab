% limpar a janela de comandos ---------------------------------------
clc;
% -------------------------------------------------------------------


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


% função f ----------------------------------------------------------
f = @(x) exp(exp(x));
% -------------------------------------------------------------------


% 2ª derivada -------------------------------------------------------
f2 = matlabFunction(diff(f, x, 2));
% -------------------------------------------------------------------


% desenhar a função no intervalo [0, 1] -----------------------------
fplot(f, [0, 1], 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar a função no intervalo [0, 1] -----------------------------
fplot(f2, [0, 1], 'LineWidth', 2);
% -------------------------------------------------------------------


% desenhar f2(1) ----------------------------------------------------
plot(1, f2(1), 'go', 'MarkerSize', 10);
% -------------------------------------------------------------------


% adicionar título e texto aos eixos o gráfico ----------------------
title('A função f(x) no intervalo [0, 1] e a 2ª derivada');
xlabel('x');
ylabel('y');
% -------------------------------------------------------------------


% colocar grelha no gráfico -----------------------------------------
grid on;
% -------------------------------------------------------------------


% desativar o modo de retenção de gráfico ---------------------------
hold off;
% -------------------------------------------------------------------



disp("2ª derivada:");
disp(f2);


disp("2ª derivada no ponto x=1:");
disp(f2(1));


disp("Nº de subintervalos necessários para cometer" + ...
    "um erro inferior a 0.001:");
disp( ...
    ceil( ...
        sqrt( ...
            (f2(1)*1000)/12 ...
        ) ...
    ) ...
);



% integração numérica pelo método dos trapézios ---------------------
disp("cálculo de integração numérica pelo método dos trapézios:");
IntTrap( ...
    f, ...  % função
    0, ...  % limite inferior de integração
    1, ...  % limite superior de integração
    113 ... % nº de subintervalos necessários
)
% -------------------------------------------------------------------
