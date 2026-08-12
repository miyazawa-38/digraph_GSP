%% 3つのベクトルをプロットする関数

function plotThreeVectors(horizontal_values, x, y, z, name_x, name_y, name_z, graph_title, x_label, y_label)

  % horizontal_values: 横軸の値
  % x, y, z: 複素ベクトル
  % name_x, name_y, name_z: ベクトルの凡例
  % graph_title: グラフのタイトル
  % x_label, y_label: 横軸、縦軸のラベル

  horizontal_values = horizontal_values(:);
  x = abs(x(:));
  y = abs(y(:));
  z = abs(z(:));

  if (numel(horizontal_values) ~= numel(x) || ...
      numel(x) ~= numel(y) || numel(y) ~= numel(z))
    error('plotThreeVectors: horizontal_values, x, y and z must have the same number of elements');
  end

  figure('color', 'w');

  plot(horizontal_values, x, '-', 'linewidth', 1.2, 'color', [0.20, 0.45, 0.75]);
  hold on;

  plot(horizontal_values, y, '-', 'linewidth', 1.2, 'color', [0.85, 0.33, 0.10]);

  plot(horizontal_values, z, '-', 'linewidth', 1.2, 'color', [0.49, 0.18, 0.56]);
  hold off;

  xlabel(x_label, 'FontSize', 14);
  ylabel(y_label, 'FontSize', 14);
  title(graph_title, 'FontSize', 14);
  legend(name_x, name_y, name_z, 'location', 'northeast');
  if (min(horizontal_values) < max(horizontal_values))
    xlim([min(horizontal_values), max(horizontal_values)]);
  end
  grid on;
end
