% limpar a janela de comandos -----------------------------------------------
clc;
% ---------------------------------------------------------------------------


% criar uma variável simbólica 'x' ------------------------------------------
syms x;
% ---------------------------------------------------------------------------


% função f ------------------------------------------------------------------
f = @(x) exp(exp(x));
% ---------------------------------------------------------------------------


% 1ª, 2ª e 3ª derivadas de f ------------------------------------------------
f1 = matlabFunction(diff(f, x));
f2 = matlabFunction(diff(f, x, 2));
f3 = matlabFunction(diff(f, x, 3));
% ---------------------------------------------------------------------------


% fórmula de Taylor de 3ª ordem com argumento 'a' ---------------------------
Taylor = @(x,a) f(a) + f1(a)*(x-a) + f2(a)*((x-a).^2)/2 + f3(a)*((x-a).^3)/6;
% ---------------------------------------------------------------------------


% fórmula de MacLaurin de 3ª ordem ------------------------------------------
MacLaurin = Taylor(x, 0);
% ---------------------------------------------------------------------------


disp("Fórmula de MacLaurin de 3ª ordem:");
disp(matlabFunction(MacLaurin));

disp("Resultado da integração numérica do polinómio de MacLaurin" + ...
    "no intervalo [0;1]");
disp( ...
    eval( ...
        int(MacLaurin, 0, 1) ... % integra o polinómio de MacLaurin entre 0 e 1
    ) ...
);
