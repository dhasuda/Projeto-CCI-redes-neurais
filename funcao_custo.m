function [J gradiente] = funcao_custo(X, y, parametros, tamanhoInput, tamanhoEscondida, tamanhoOutput, lambda)
% A funcao de custo calcula o custo e o gradiente de uma rede neural com uma camada
% escondida

% X, y: valores das imagens; parametros: valores dos thetas que multiplicam
% os imputs em cada camada

theta1 = reshape(parametros(1:tamanhoEscondida * (tamanhoInput + 1)),...
    tamanhoEscondida, (tamanhoInput + 1));
theta2 = reshape(parametro(1 + tamanhoEscondida * (tamanhoInput + 1):end),...
    tamanhoOutput, (tamanhoEscondida + 1));

m = size(X, 1); % N�mero de imagens utilizadas
X = X';

X1 = [ones(1, m); X];
X2 = sigmoid(theta1 * X1);
X21 = [ones(1, size(X2, 2)); X2];
X3 = sigmoid(theta2 * X21); % Definidos os valores das fun��es

Y = zeros(size(X3));

coluna = zeros(size(X3, 1), 1);
for i=1:m
   coluna(y(i)) = 1; % Indica qual numero a imagem representa
   Y(:, i) = coluna;
   coluna(y(i)) = 0;
end % Contru�da a matriz com as respostas esperadas para cada imagem

erro3 = X3 - Y;
erro2 = (theta2' * erro3) .* X21 .* (1 - X21);
erro2 = erro2(2:end, :); % Retirada do bias, que n�o carrega erro

theta1_grad = (erro2*X1' + lambda*(theta1.*[zeros(size(theta1, 1), 1),...
    ones(size(theta1, 1), size(theta1, 2)-1)]))/m;


theta2_grad = (erro3*X21' + lambda*(theta2.*[zeros(size(theta2, 1), 1),...
    ones(size(theta2, 1), size(theta2, 2)-1)]))/m;

gradiente = [theta1_grad(:); theta2_grad(:)];

aux = -(Y .* log(X3) + (1-Y) .* log(1 - X3)); % Para simplificar na express�o final
theta1 = theta1 .^2;
theta2 = theta2 .^2;
a = size(aux, 1);
b = size(aux, 2);
J = (ones(1, a) * aux * ones(b, 1) + (lambda/2)*(ones(1, size(theta1, 1)) * theta1 * ones(size(theta1, 2), 1) + ones(1, size(theta2, 1)) *  theta2 * ones(size(theta2, 2), 1)))/m;

end