%% main_comparing_methods.mでx_hatを図に起こした結果、低周波と高周波のスペクトルが大きくなった
%% ここではこれの原因を調べるコードを書く

% ヨーロッパのemailのネットワーク
addpath('datasets/email');
A = getAdjacencyMatrix('email-Eu-core-temporal-Dept1.txt');
x = generateGraphSignal(A);


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


%% ===== 低周波と高周波に集中する原因を調べる =====

diff_signal = x - y;
% plotTwoVectors(1:numel(x), x, y, 'before', 'after', 'before and after', 'Nodes', 'Value');
% plotOneVector(diff_signal, 'diff signal', '処理前と後の信号の差', 'Node', 'value of difference');

[max_value, idx_max_value] = max(diff_signal);
disp(max_value);
disp(abs(max_value));
disp(idx_max_value);

column_sum_A = (sum(A,1))';
row_sum_A = sum(A,2);

diff = row_sum_A - column_sum_A;

plotOneVector(diff, 'diff signal', '処理前と後の信号の差', 'Node', 'value of difference');
plotTwoVectors(1:numel(x), column_sum_A, row_sum_A, 'before', 'after', 'before and after', 'Nodes', 'Value');

%% ==============================================

