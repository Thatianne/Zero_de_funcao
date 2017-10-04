function falsaPosicao(pontoA, pontoB, funcParam)  
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
    fprintf('i\t\tx\t\t\t\tf(xi)\t\terro\n');
    if fa * fb < 0               
        erro = realmax;
        while erro > 10^(-6) 
            x0 = (a*fb - b*fa)/(fb - fa);          
            fx = matFunc(x0);                                    
            if fa * fx > 0                
                nn = a;
                a = x0;                
                fa = matFunc(a);
            elseif(fa * fx < 0 )                
                nn = b;
                b = x0;                
                fb = matFunc(b);
            else
                fprintf('Deu ruim');
            end            
            erro = abs(x0 - nn);            
            iteracoes = iteracoes + 1;
            if iteracoes > 100
                fprintf('Número de iterações ultrapassadas\n');
                break;
            end                                                        
            fprintf('%d\t%.16f\t\t\t%.16f\t\t\t%.16f\n',iteracoes, x0, fx, erro);                
        end
    else
        fprintf('Intervalo inválido\n');
    end
    
    
end