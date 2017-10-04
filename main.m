% Encontrar a 4ª menor raiz
syms a;
syms b;
syms x;

qtdRaiz = 4;
func =  log(x.*2) + cos(x.*2) - 2;

raiz = 0;
iteracoes = 0;
b = 0;
matFunc = matlabFunction(func);

while raiz ~= qtdRaiz
    a = b;
    b = b + 0.5;
    fa = matFunc(a);
    fb = matFunc(b);
    if isinf(fa)                
        if fa < 0                      
            fa = realmax * (-1);
        else
            fa = realmax;
        end
    end    
    if isinf(fb)
        if fb < 0                      
            fb = realmax * (-1);
        else
            fb = realmax;
        end
    end
           
    if fa * fb < 0
        %fprintf('a = %f\t\tb = %f\n', a, b);
        %fprintf('fa = %f\t\tfb = %f\n', fa, fb);
        raiz = raiz + 1;        
    end
    
    if iteracoes > 100
        fprintf('Intervalo não encontrado');
        break;
    end    
    iteracoes = iteracoes + 1;        
end
fprintf('\t\t\t\t\t*****  Intervalo  *****\n\t\t\ta = %f\t\tb = %f\n\n', a, b);

fprintf('\t\t\t\t******  Método da Bisseção  ******\t\n');
bissecao(a, b, func);
fprintf('\n\n');
fprintf('\t\t\t\t******  Método das Cordas  ******\t\n');
falsaPosicao(a, b, func);
fprintf('\n\n');
fprintf('\t\t\t\t******  Método de Newton-Raphson  ******\t\n');
nr(a, b, func);
fprintf('\n\n');
fprintf('\t\t\t\t******  Método das Secantes  ******\t\n');
secantes(a, b, func);
fprintf('\n\n');
