function [U] = MetBiss(f, a, b, epasso, eabs, niter)

    e1 = epasso + 1;
    e2 = eabs + 1;
    i = 1;
    c = (a+b) / 2;
    U = [];
    fa = f(a); fb = f(b); fc = f(c);
    if (fa .* fb > 0)
        fprintf(1, 'erro: f(a) * f(b) > 0\n');
        return
    end
    U(1, :) = [0, a, b, fa, fb, c, fc, (b-a)/2];
    if (fa .* fb == 0)
        fprintf(1, 'Um dos extremos e´ solucao; ver o output\n');
        return; 
    end
    
    while ( ( (e1 >= epasso) || (e2 >= eabs) ) && (i <= niter) )
        if (fa .* fc < 0) b = c; else a = c; end
        c = (a+b) / 2;
        fa = f(a); fb = f(b); fc = f(c);
        e1 = (b-a)/2;
        e2 = abs(fc);        
        V = [i, a, b, fa, fb, c, fc, e1];
        U = vertcat(U, V);
        i = i+1;
    end
    if (i > niter) 
        fprintf(1, 'O algoritmo nao convergiu ao fim de %d iteracoes\n', niter); end
end
    

