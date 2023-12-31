% criar uma variável simbólica 'x' -------------------
syms x;
% ----------------------------------------------------


% definir a função -----------------------------------
f = @(x) x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
% ----------------------------------------------------


% calcular a derivada --------------------------------
df = diff(f, x);
% ----------------------------------------------------


% converter a derivada para uma função MATLAB --------
df_func = matlabFunction(df);
% ----------------------------------------------------


% encontrar a raiz usando a função fzero -------------
disp('A raiz da função derivada de f é:');
disp(fzero(df_func, -1));
% ----------------------------------------------------


% encontrar a imagen do ponto crítico ----------------
disp('As imagens dos pontos críticos são:')
f = x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
disp(eval(subs(f, x, fzero(df_func, -1))))
% ----------------------------------------------------
