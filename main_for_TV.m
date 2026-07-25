%% TVのためのmain関数

% ヨーロッパのemailのネットワーク
addpath('datasets/email');
A = getAdjacencyMatrix('email-Eu-core-temporal-Dept1.txt');
x = generateGraphSignal(A);

% 鎌田さんのランダムプロット
% addpath('datasets/kamata');
% [A,f,x] = randomPlot();


%% ===== 鎌田さんのラプラシアンを用いた処理 =====

% グラフ作用素
[H, D, L, L_tilde, U, lambda] = getGraphOperator(A);

% GFT
x_hat = GFT(U, x);

% フィルタリング
y_hat = filterHeatKernel(x_hat, lambda, 5);

% IGFT
y = IGFT(U, y_hat);

%% ==============================================


%% ===== TVの値を描画 =====

TV_x = calculateTotalVariation(L, x);
TV_y = calculateTotalVariation(L, y);
disp("元の信号の総変動");
disp(TV_x);
disp("処理後の信号の総変動");
disp(TV_y);

%% ==============================================


