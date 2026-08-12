%% Heat kernel filter

function y_hat = filterHeatKernel(x_hat, lambda, tau)

  % y_hat: フィルタリング後のグラフフーリエ領域上の信号
  % x_hat: フィルタリング前のグラフフーリエ領域上の信号
  % lambda: 固有値のベクトル
  % tau: パラメータ

  g = exp(-tau * lambda);
  y_hat = g .* x_hat;
end
