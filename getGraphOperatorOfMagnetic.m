%% Magneticラプラシアンに関するグラフ作用素を求める関数

function [H_mg, D_mg, L_mg, L_tilde_mg, U_mg, lambda_mg] = getGraphOperatorOfMagnetic(A)

  % A: 隣接行列
  % H_mg: エルミート隣接行列
  % D_mg: 次数行列
  % L_mg: Magneticラプラシアン
  % L_tilde_mg: 正規化Magneticラプラシアン
  % U_mg: 固有ベクトル行列
  % lambda_mg: 固有値のベクトル

  % エルミート隣接行列
  H_mg = getHermitianAdjacencyMatrixOfMagnetic(A);

  % 次数行列
  D_mg = getDegreeMatrixOfMagnetic(A);

  % Magneticラプラシアン
  L_mg = D_mg - H_mg;

  % 正規化Magneticプラシアン
  L_tilde_mg = D_mg^(-1/2) * L_mg * D_mg^(-1/2);

  % 固有ベクトル行列、固有値を対角に並べた行列
  [U_mg, Lambda_mg] = eig(L_tilde_mg);
  Lambda_mg = real(Lambda_mg);
  [lambda_mg, idx] = sort(diag(Lambda_mg), 'ascend');
  U_mg = U_mg(:,idx);
  Lambda_mg = diag(lambda_mg);
end
