%% 1つのベクトルをプロットする関数

function plotOneVector(x, name_x, graph_title, x_label, y_label)

  % x: 複素ベクトル
  % name_x: ベクトルの凡例
  % title: グラフのタイトル
  % x_label, y_label: 横軸、縦軸のラベル

  x = abs(x(:));

  n = numel(x);
  node = 1:n;

  figure('color', 'w');

  plot(node, x, '-', 'linewidth', 1.2, 'color', [0.20, 0.45, 0.75]);

  xlabel(x_label, 'FontSize', 14);
  ylabel(y_label, 'FontSize', 14);
  title(graph_title, 'FontSize', 14);
  legend(name_x, 'location', 'northeast');
  xlim([1, max(1, n)]);
  grid on;
end
