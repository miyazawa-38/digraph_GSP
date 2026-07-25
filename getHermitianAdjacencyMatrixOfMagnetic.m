%% Magneticラプラシアンのエルミート隣接行列を求める関数

function H_mg = getHermitianAdjacencyMatrixOfMagnetic(A)

  % A: 隣接行列
  % H_mg: エルミート隣接行列
  
  % charge parameter
  q = 0.25;

  % 位相
  Theta = 2 * pi * q * (A - A');

  % 辺の重みを対称化
  W = (A + A')/2;

  % エルミート隣接行列
  H_mg = W .* exp(1i * Theta);
end
