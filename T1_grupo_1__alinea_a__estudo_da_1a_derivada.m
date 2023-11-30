%  criar uma variável simbólica 'x' --------------------------------- 
syms x;
% -------------------------------------------------------------------


% Definir a função------------------------------------
f = @(x) x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
% ----------------------------------------------------


% Calcular a derivada --------------------------------
df = diff(f, x);
% ----------------------------------------------------


% Converter a derivada para uma função MATLAB --------
df_func = matlabFunction(df);
% ----------------------------------------------------


% Encontrar a raizes usando a função fzero -----------
disp('A raiz da função derivada de f é:');
disp(fzero(df_func, -1));
% ----------------------------------------------------


% Encontrar as imagens dos pontos críticos -----------
disp('As imagens dos pontos críticos são:')
f = x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
disp(eval(subs(f, x, fzero(df_func, -1))))
% ----------------------------------------------------
