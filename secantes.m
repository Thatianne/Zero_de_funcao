function secantes(pontoA, pontoB, funcParam)
    syms a;
    syms b;
    syms x;
    a = pontoA;
    b = pontoB;    
    iteracoes = 0;
    func = funcParam;
    matFunc = matlabFunction(func);    
        
    xAnterior = a;
    xAtual = b;
    fAnterior = matFunc(xAnterior);
    fAtual = matFunc(xAtual);
    fa = fAnterior;
    fb = fAtual;
    if fa * fb < 0       
        fprintf('i\t\tx\t\t\t\t\t\tf(xi)\t\t\t\terro\n');
        erro = realmax;
        while erro > 10^(-6) 
            fAnterior = matFunc(xAnterior);
            fAtual = matFunc(xAtual);
            
            xProximo = ((xAnterior * fAtual) - (xAtual * fAnterior))/(fAtual - fAnterior);
            erro = abs(xProximo - xAtual);                  
            fprintf('%d\t%.16f\t\t%.16f\t\t%.16f\n',iteracoes, xAtual, fAtual, erro);
            
            xAnterior = xAtual;
            xAtual = xProximo;                        
            iteracoes = iteracoes + 1;
            
            if iteracoes > 100
                fprintf('Número de iterações ultrapassadas\n');
                break;
            end
        end
    else
        fprintf('Intervalo inválido\n');
    end
end