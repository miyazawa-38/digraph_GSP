%% エルミート隣接行列に対しての村松先生の次数行列を算出する関数

function D_k = getDegreeMatrixOfMuramatsu(H)

  % H: エルミート隣接行列
  % D_k: 村松先生の次数行列

  [row_size, column_size] = size(H);
  D_k = zeros(row_size);
  
  for i = 1:row_size
    for j = 1:column_size
      D_k(i,i) += abs(H(i,j));
    end
  end
end
