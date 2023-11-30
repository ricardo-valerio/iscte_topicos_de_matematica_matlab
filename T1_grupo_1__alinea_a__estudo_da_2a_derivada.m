%  criar uma variável simbólica 'x' ---------------------
syms x;
% -------------------------------------------------------


% Definir a função---------------------------------------
f = @(x) x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
% -------------------------------------------------------


% Calcular a 2ª derivada --------------------------------
df = diff(f, x, 2);
% -------------------------------------------------------


% Converter a 2ª derivada para uma função MATLAB --------
df_func = matlabFunction(df);
% -------------------------------------------------------


% Encontrar a raizes usando a função fzero --------------
disp('A raiz da função segunda derivada de f é:');
disp(fzero(df_func, 0));
% -------------------------------------------------------


% Encontrar as imagens dos possíveis pontos de inflexão
disp('As imagens dos possíveis pontos de inflexão:')
f = x./(sqrt(x.^2+1)) + 1./(3*(x+2).^2);
disp(eval(subs(f, x, fzero(df_func, 0))))
% -------------------------------------------------------
