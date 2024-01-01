function s = IntMPM (f, a, b, n)
    dx = (b-a)./n;
    dx2 = dx./2;
    x = a:dx:(b-dx);
    s = dx .* sum(f(x+dx2));
end