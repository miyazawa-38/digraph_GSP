%% GFTを行う関数

function x_hat = GFT(U,x)

  % U: 固有ベクトル行列
  % x: グラフ信号
  % x_hat: グラフフーリエ領域上の信号

  x_hat = U' * x;
end

