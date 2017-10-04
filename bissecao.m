function bissecao(pontoA, pontoB, funcParam)    
    syms a;
    syms b;
    syms x;
    a = pontoA;
    b = pontoB;
    aInicial = a;
    bInicial = b;
    iteracoes = 0;
    func = funcParam;
    matFunc = matlabFunction(func);    
    fa = matFunc(a);
    fb = matFunc(b);
    amplitude = b - a;    
    fprintf('i\t\ta\t\t\t\tb\t\t\t\tx\t\t\t\tf(xi)\t\t\tc\n');
    if fa * fb < 0
        while amplitude >= 10^(-6)
            iteracoes = iteracoes + 1;
            if iteracoes > 100
                fprintf('Número de iterações ultrapassadas\n');
                break;
            end
            x0 = (a + b)/2;
            fx0 = matFunc(x0);        
            if(fa * fx0 < 0 )
                b = x0;
                fb = matFunc(b);
            elseif fa * fx0 > 0
                a = x0;
                fa = matFunc(a);
            else
                fprinf('Deu ruim');
            end
            amplitude = b - a;            
            fprintf('%d\t%.8f\t\t%.8f\t\t%.8f\t\t%.8f\t\t%.8f\n',iteracoes, a, b, x0, fx0, amplitude);                
        end
    else
        fprintf('Intervalo inválido\n');
    end
end