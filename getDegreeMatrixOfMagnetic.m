%% Magneticラプラシアン用の次数行列を求める関数

function D_mg = getDegreeMatrixOfMagnetic(A)

  % A: 隣接行列

  W = (A + A')/2;

  [row_size, column_size] = size(A);
  D_mg = zeros(row_size);

  for i = 1:row_size
    for j = 1:column_size
      D_mg(i,i) += W(i,j);
    end
  end
end
