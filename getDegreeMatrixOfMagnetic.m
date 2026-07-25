%% Magneticラプラシアン用の次数行列を求める関数

function D_mg = getDegreeMatrixOfMagnetic(A)

  % A: 隣接行列
  % D_mg: 次数行列

  % 辺の重みを対称化
  W = (A + A')/2;

  % 次数行列
  D_mg = diag(sum(W, 2));
end
