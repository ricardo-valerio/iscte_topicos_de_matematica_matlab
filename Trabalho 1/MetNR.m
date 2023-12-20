function [U] = MetNR(f, fl, x0, epasso, eabs, niter)

    e1 = epasso + 1;
    e2 = eabs + 1;
    i = 1;
    U = [];
    a = f(x0); b = fl(x0);
    U(1,:) = [0, x0, a, b, NaN];
    while ( ( (e1 >= epasso) || (e2 >= eabs) ) && (i <= niter) )
        if (b == 0) 
            fprintf(1, 'erro: derivada nula\n');
            return;
        end
        x = x0 - a./b;
        e1 = abs(x-x0);
        x0 = x;
        a = f(x0); b = fl(x0);
        e2 = abs(a);        
        V = [i, x0, a, b, e1];
        U = vertcat(U, V);
        i = i+1;
    end
    if (i > niter) 
        fprintf(1, 'O algoritmo nao convergiu ao fim de %d iteracoes\n', niter); end
end
    

