%% 村松先生の次数行列を用いてグラフ作用素を算出する関数

function [H, D_m, L_m, L_tilde_m, U_m, lambda_m] = getGraphOperatorOfMuramatsu(A)

  % A: 隣接行列
  % H: エルミート隣接行列
  % L_m: 村松先生のエルミートグラフラプラシアン
  % L_tilde_m: 村松先生の正規化エルミートグラフラプラシアン
  % U_m: 村松先生の固有ベクトル行列
  % lambda_m: 村松先生の固有値のベクトル

  % エルミート隣接行列
  H = getHermitianAdjencyMatrix(A);

  % 次数行列
  D_m = getDegreeMatrixAsL2Norm(H);

  % グラフラプラシアン
  L_m = D_m - H;

  % 正規化グラフラプラシアン
  L_tilde_m = D_m^(-1/2) * L_m * D_m^(-1/2);

  % 固有ベクトル行列、固有値を対角に並べた行列
  [U_m,Lambda_m] = eig(L_tilde_m);
  Lambda_m = real(Lambda_m);
  [lambda_m, idx] = sort(diag(Lambda_m), 'ascend');
  U_m = U_m(:,idx);
  Lambda_m = diag(lambda_m);
end
