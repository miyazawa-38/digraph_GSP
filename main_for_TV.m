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

% ----- tauの値を変化させてフィルタリング -----
tau_values = 0:0.1:5;

% TVを保存するベクトル
TV_values = zeros(size(tau_values));

for i = 1:length(tau_values)
  tau = tau_values(i);
  y_hat = filterHeatKernel(x_hat, lambda, tau);

  % IGFT
  y = IGFT(U, y_hat);

  % TVを保存
  TV_values(i) = calculateTotalVariation(L, y);
end

% --------------------------------------------
%% ==============================================



%% ===== 村松先生のラプラシアンを用いた処理 =====

% グラフ作用素
[H_m, D_m, L_m, L_tilde_m, U_m, lambda_m] = getGraphOperatorOfMuramatsu(A);

% GFT
x_hat_m = GFT(U_m, x);

% ----- tauの値を変化させてフィルタリング -----
tau_values = 0:0.1:5;

% TVを保存するベクトル
TV_values_m = zeros(size(tau_values));

for i = 1:length(tau_values)
  tau = tau_values(i);
  y_hat_m = filterHeatKernel(x_hat_m, lambda_m, tau);

  % IGFT
  y_m = IGFT(U_m, y_hat_m);

  % TVを保存
  TV_values_m(i) = calculateTotalVariation(L, y_m);
end

% --------------------------------------------
%% ==============================================



%% ===== Magneticラプラシアンを用いた処理 =====

% グラフ作用素
[H_mg, D_mg, L_mg, L_tilde_mg, U_mg, lambda_mg] = getGraphOperatorOfMagnetic(A);

% GFT
x_hat_mg = GFT(U_mg, x);

% ----- tauの値を変化させてフィルタリング -----
tau_values = 0:0.1:5;

% TVを保存するベクトル
TV_values_mg = zeros(size(tau_values));

for i = 1:length(tau_values)
  tau = tau_values(i);
  y_hat_mg = filterHeatKernel(x_hat_mg, lambda_mg, tau);

  % IGFT
  y_mg = IGFT(U_mg, y_hat_mg);

  % TVを保存
  TV_values_mg(i) = calculateTotalVariation(L, y_mg);
end

% --------------------------------------------
%% ==============================================



%% ===== TVの値を描画 =====

% plotOneVector(TV_values, 'TVの値', 'TVの値の変化', 'tau', 'value of TV')

plotThreeVectors(tau_values, TV_values, TV_values_m, TV_values_mg, ...
                 'Kamata', 'Muramatsu', 'Magnetic', ...
                 'TVの値の変化', ...
                 'tau', 'value of TV');

%% ==============================================

