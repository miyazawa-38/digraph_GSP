%% 手法を比較するためのmain関数

%% x_hatを図に起こした結果、低周波と高周波のスペクトルが大きくなった
%% これがなぜなのかを調べるコードはmain_spectral_distribution.mに書く

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
y_hat = filterHeatKernel(x_hat, lambda, 3);

% IGFT
y = IGFT(U, y_hat);

%% ==============================================



%% ===== 村松先生のラプラシアンを用いた処理 =====

% グラフ作用素
[H_m, D_m, L_m, L_tilde_m, U_m, lambda_m] = getGraphOperatorOfMuramatsu(A);

% GFT
x_hat_m = GFT(U_m, x);

% フィルタリング
y_hat_m = filterHeatKernel(x_hat_m, lambda_m, 3);

% IGFT
y_m = IGFT(U_m, y_hat_m);

%% ==============================================



%% ===== Magneticラプラシアンを用いた処理 =====

% グラフ作用素
[H_mg, D_mg, L_mg, L_tilde_mg, U_mg, lambda_mg] = getGraphOperatorOfMagnetic(A);

% GFT
x_hat_mg = GFT(U_mg, x);

% フィルタリング
y_hat_mg = filterHeatKernel(x_hat_mg, lambda_mg, 3);

% IGFT
y_mg = IGFT(U_mg, y_hat_mg);

%% ==============================================


%% ===== 信号を描画 =====

plotThreeVectors(1:numel(x_hat), x_hat, x_hat_m, x_hat_mg, ...
                 'Kamata', 'Muramatsu', 'Magnetic', ...
                 'Signals on GF domain before processing', ...
                 'index of eigenvalue', 'spectral');

plotThreeVectors(1:numel(y_hat), y_hat, y_hat_m, y_hat_mg, ...
                 'Kamata', 'Muramatsu', 'Magnetic', ...
                 'Signals on GF domain after processing', ...
                 'index of eigenvalue', 'spectral');

%% ==============================================
