% criar uma variável simbólica 'x' ----------------------
syms x;
% -------------------------------------------------------


% definir a função --------------------------------------
f = @(x) x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
% -------------------------------------------------------


% calcular a 2ª derivada --------------------------------
df = diff(f, x, 2);
% -------------------------------------------------------


% converter a 2ª derivada para uma função MATLAB --------
df_func = matlabFunction(df);
% -------------------------------------------------------


% encontrar a raiz usando a função fzero ----------------
disp('A raiz da função segunda derivada de f é:');
disp(fzero(df_func, 0));
% -------------------------------------------------------


% encontrar a imagem do possível ponto de inflexão ------
disp('A imagem do possível ponto de inflexão:')
f = x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
disp(eval(subs(f, x, fzero(df_func, 0))))
% -------------------------------------------------------
