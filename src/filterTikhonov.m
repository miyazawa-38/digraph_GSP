%% Tikhonov low-pass filter

% heat kernel: 高周波を指数関数的に強く落とす
% Tikhonov: 高周波をもう少し緩やかに落とす
% 元の信号xから離れすぎない、かつ、グラフ上で滑らかな信号yにしたい

function y_hat = filterTikhonov(xhat, lambda ,alpha)

  % y_hat: フィルタリング後のグラフフーリエ領域上の信号
  % x_hat: フィルタリング前のグラフフーリエ領域上の信号
  % lambda: 固有値のベクトル
  % alpha: パラメータ

  g = 1 ./ (1 + alpha * lambda);
  y_hat = g .* x_hat;
end
