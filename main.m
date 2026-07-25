%% main関数

% ヨーロッパのemailのネットワーク
addpath('datasets/email');
A = getAdjacencyMatrix('email-Eu-core-temporal-Dept1.txt');
x = generateGraphSignal(A);

% % 鎌田さんのランダムプロット
% addpath('datasets/kamata') 
% [A,f,x] = randomPlot();

% グラフ作用素
[H, D, L, L_tilde, U, lambda] = getGraphOperator(A);

% 村松先生のグラフ作用素
[H_m, D_m, L_m, L_tilde_m, U_m, lambda_m] = getGraphOperatorOfMuramatsu(A);

% Magneticラプラシアンに関するグラフ作用素
[H_mg, D_mg, L_mg, L_tilde_mg, U_mg, lambda_mg] = getGraphOperatorOfMagnetic(A);

% GFT
x_hat = GFT(U, x);

% フィルタリング
y_hat = filterHeatKernel(x_hat, lambda, 5);
% y_hat = filterIdealLowpass(x_hat, lambda, 1);
% y_hat = filterIdealLowpass(x_hat, lambda, 2);

% IGFT
y = IGFT(U, y_hat);
% disp(y(1:10));

% % 信号を描画
% plotGraphSignal(x_hat, y_hat);
% plotGraphSignal2(x_hat, y_hat);

% TV
TV_x = calculateTotalVariation(L, x);
TV_y = calculateTotalVariation(L, y);

disp(TV_x);
disp(TV_y);



