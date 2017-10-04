function nr(pontoA, pontoB, funcParam)
    syms a;
    syms b;
    syms x;
    a = pontoA;
    b = pontoB;    
    iteracoes = 0;
    func = funcParam;
    matFunc = matlabFunction(func);    
    fa = matFunc(a);
    fb = matFunc(b);     
    
    if fa * fb < 0
        primDerivada = diff(func, 1);
        primDer = matlabFunction(primDerivada);    

        segDerivada = diff(func, 2);
        segDer = matlabFunction(segDerivada);
        segDerA = segDer(a);
        segDerB = segDer(b);    

        if segDerA * fa > 0 && segDerB * fb > 0            
            if abs(fa) < abs(fb)
                x0 = a;
            else
                x0 = b;
            end
        elseif segDerA * fa > 0           
            x0 = a;
        else
            x0 = b;
        end        
        anterior = 0;
        erro = realmax;
               
        fprintf('i\t\tx\t\t\t\t\t\tf(xi)\t\t\t\terro\n');
        while erro > 10^(-6) 
            fx = matFunc(x0);
            primDerX0 = primDer(x0);            
            prox = x0 - (fx/primDerX0);           
            erro = abs(x0 - anterior);
            fprintf('%d\t%.16f\t\t%.16f\t\t%.16f\n',iteracoes, x0, fx, erro);            
            anterior = x0;
            x0 = prox;
            iteracoes = iteracoes + 1;
            if iteracoes > 100
                fprintf('Número de iterações ultrapassadas\n');
                break;
            end
        end
    else
        fprintf('Intervalo inválido\n');
    end
    
    % melhor extremo
    
end