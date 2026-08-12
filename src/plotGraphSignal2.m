%% 2つの信号を比較するためのグラフを出力する関数

function plotGraphSignal2(x, y)

  % x, y: グラフ信号

  x = real(x(:));
  y = real(y(:));

  if (numel(x) != numel(y))
    error('plotGraphSignal2: x and y must have the same number of elements');
  end

  n = numel(x);
  node = 1:n;

  figure('color', 'w');

  plot(node, x, '-', ...
       'linewidth', 1.2, ...
       'color', [0.20, 0.45, 0.75]);
  hold on;

  plot(node, y, '-', ...
       'linewidth', 1.2, ...
       'color', [0.85, 0.33, 0.10]);

  hold off;

  xlabel('Node index');
  ylabel('Signal amplitude');
  title('Original and filtered graph signals');
  legend('Original signal', 'Filtered signal', 'location', 'northeast');
  xlim([1, max(1, n)]);
  grid on;
end
