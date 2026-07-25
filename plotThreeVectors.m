%% 3つのベクトルをプロットする関数

function plotThreeVectors(x, y, z, name_x, name_y, name_z, graph_title, x_label, y_label)

  % x, y, z: 複素ベクトル
  % name_x, name_y, name_z: ベクトルの凡例
  % title: グラフのタイトル
  % x_label, y_label: 横軸、縦軸のラベル

  x = abs(x(:));
  y = abs(y(:));
  z = abs(z(:));

  if (numel(x) ~= numel(y) || numel(y) ~= numel(z))
    error('plotThreeVectors: x, y and z must have the same number of elements');
  end

  n = numel(x);
  node = 1:n;

  figure('color', 'w');

  plot(node, x, '-', 'linewidth', 1.2, 'color', [0.20, 0.45, 0.75]);
  hold on;

  plot(node, y, '-', 'linewidth', 1.2, 'color', [0.85, 0.33, 0.10]);

  plot(node, z, '-', 'linewidth', 1.2, 'color', [0.49, 0.18, 0.56]);
  hold off;

  xlabel(x_label, 'FontSize', 14);
  ylabel(y_label, 'FontSize', 14);
  title(graph_title, 'FontSize', 14);
  legend(name_x, name_y, name_z, 'location', 'northeast');
  xlim([1, max(1, n)]);
  grid on;
end
