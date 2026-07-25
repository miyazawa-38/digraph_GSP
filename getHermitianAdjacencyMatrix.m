%% エルミート隣接行列を算出する関数

function H = getHermitianAdjencyMatrix(A)

  % A: 隣接行列
  % H: エルミート隣接行列

  A_s = (A + A')/2;
  A_a = (A - A')/2;
  H = A_s + i * A_a;
end

