%% グラフ信号の総変動を算出する関数

function TV = calculateTotalVariation(L, x)

  % L: グラフラプラシアン
  % x: グラフ信号ベクトル

  TV = x' * L * x;
end
