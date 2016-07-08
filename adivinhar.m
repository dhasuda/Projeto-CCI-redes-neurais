function [previsao, probabilidade] = adivinhar(theta1, theta2, imagem)
% Adivinha qual o n�mero representado pela imagem
m = size(imagem, 1); % n�mero de imagens
tamanhoOutput = size(theta2, 1);

previsao = zeros(m, 1);

h1 = sigmoid([ones(m, 1) imagens] * theta1');
h2 = sigmoid([ones(m, 1) h1] * theta2');

[probabilidade, previsao] = max(h2, [], 2);
end