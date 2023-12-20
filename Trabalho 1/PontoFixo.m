function [U] = PontoFixo(f, x0, epasso, niter)

    erro = epasso + 1;
    i = 1;
    U = [];
    x = f(x0);
    U(1,:) = [0, x0, x, NaN];
    while ( (erro >= epasso) && (i <= niter) )
        erro = abs(x-x0);
        x0 = x;
        x = f(x0);
        V = [i, x0, x, erro];
        U = vertcat(U, V);
        i = i + 1;
    end
    if (i > niter)
        fprintf(1, 'O algoritmo nao convergiu ao fim de %d iteracoes\n', niter); end
end
    

