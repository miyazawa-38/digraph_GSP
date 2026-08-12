%% IGFTを行う関数

function y = IGFT(U, y_hat)

  % U: 固有ベクトル行列
  % y_hat: フィルタリング後のグラフフーリエ領域上の信号
  % y: IGFTでグラフ領域上に戻した信号

  y = U * y_hat;
end

