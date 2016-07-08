%% Projeto de CCI-22: implementa��o de redes neurais

% O objetivo � criar um projeto que seja capaz de identificar e classificar
% algarismos. E outras palavras ser� um identificador de algarismos (0,
% ..., 9)


% Instru��es
% ----------------------

% Este � um arquivo que ajudar� na apresenta��o do projeto. Neste script
% ser�o utilizadas as seguintes fun��es:

%   (fun��es que ser�o utilizadas)

% N�o ser� necess�rio alterar ou implementar nada para que se possa ver a
% funcionalidade do c�digo
%

%% Inicializacao
close all
clear
clc

%% Vari�veis

tamanhoInput = 400;
tamanhoCamadaEscondida = 25;
tamanhoOutput = 10; % O 10 representa o n�mero 0

load('imagens.mat');
fprintf('Imagens carregadas!');
fprintf('Programa pausado. Pressione enter para continuar...');

% Cada imagem eh representada por um vetor 1x400, e todas estao juntas na
% matriz X(250x400). Ja o vetor y representa o valor de cada algarismo
% contido em X, na mesma ordem. Ambas matrizes sao parte de 'imagens.mat'

%% =========== Parte 1:  Inicializar par�metros=============
% Para implementarmos a rede neural de duas camadas para classificar
% d�gitos vamos aleatoriamente inicializar os valores dos pesos da rede
% neural

fprintf('\nInicializando os par�metros da rede neural\n');

Theta1_inicial = inicializacao_aleatoria(tamanhoInput, tamanhoCamadaEscondida);
Theta2_inicial = inicializacao_aleatoria(tamanhoCamadaEscondida, tamanhoOutput);

parametros_iniciais = [Theta1_inicial(:); Theta2_inicial(:)];

%% =========== Parte 2:  Treinar rede neural =============
lambda = 1;

parametros_treinados = treinar(X, y, parametros_iniciais, tamanhoInput, tamanhoCamadaEscondida, tamanhoOutput, lambda);

theta1 = reshape(parametros_treinados(1:tamanhoCamadaEscondida*(tamanhoInput+1)),...
    tamanhoCamadaEscondida, (tamanhoInput + 1));
theta1 = reshape(parametros_treinados(1 + (tamanhoCamadaEscondida*(tamanhoInput+1))):end,...
    tamandoCamadaEscondida, (tamanhoInput + 1));

fprintf('\nPar�metros treinados! Pressione enter para continuar\n');
pause;


%% =========== Parte 3:  Ler novas imagens e adivinhar! =============
imgem = X;
[pred, prob] = adivinhar(theta1, theta2, imagem);
display(pred);