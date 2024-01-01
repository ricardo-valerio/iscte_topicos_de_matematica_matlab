% limpar a janela de comandos ---------------------------------------------
clc;
% -------------------------------------------------------------------------


% criar uma variável simbólica 't' ----------------------------------------
syms t;
% -------------------------------------------------------------------------


% função dentro da integral -----------------------------------------------
f = @(t) sin(t.^2);  % NOTA: corresponde à 1ª derivada de g(x)
% -------------------------------------------------------------------------


% 1ª derivada de f (2ª derivada de g) -------------------------------------
f1 = matlabFunction(diff(f, t));
% -------------------------------------------------------------------------


% função g do enunciado ---------------------------------------------------
g = @(t, b) integral(f, 0, b);
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



% loop para mostrar os valores "exatos" de g ------------------------------
disp("Mostrar os valores ""exatos"" de g(x) para x ∈ P:");
for i = 1:length(P)
    fprintf("g(%d*pi/5) = %.4f\n", i - 1, g(f, P(i)));
end
% -------------------------------------------------------------------------


% separador visual para o output
disp(newline);


% loop para mostrar os valores "exatos" da 1ª derivada de g ---------------
disp("Mostrar os valores ""exatos"" de g'(x) para x ∈ P:");
for i = 1:length(P)
    fprintf("g'(%d*pi/5) = %.4f\n", i - 1, f(P(i)));
end
% -------------------------------------------------------------------------


% separador visual para o output
disp(newline);


% loop para mostrar os valores "exatos" da 2ª derivada de g ---------------
disp("Mostrar os valores ""exatos"" de g''(x) para x ∈ P:");
for i = 1:length(P)
    fprintf("g''(%d*pi/5) = %.4f\n", i - 1, f1(P(i)));
end
% -------------------------------------------------------------------------
