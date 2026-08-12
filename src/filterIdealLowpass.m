%% Ideal low-pass filter

function y_hat = filterIdealLowpass(x_hat, lambda, c)
  
  % y_hat: フィルタリング後のグラフフーリエ領域上の信号
  % x_hat: フィルタリング前のグラフフーリエ領域上の信号
  % lambda: 固有値のベクトル
  % c: パラメータ

  g = double(lambda < c);
  y_hat = g .* x_hat;
end
