%% エルミート隣接行列に対しての次数行列を算出する関数

function D = getDegreeMatrix(H)

  % H: エルミート隣接行列
  % D: 次数行列

  [row_size, column_size] = size(H);
  D = zeros(row_size);
  
  for i = 1:row_size
    for j = 1:column_size
      D(i,i) += abs(real(H(i,j))) + abs(imag(H(i,j)));
    end
  end
end
