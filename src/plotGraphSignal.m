function plotGraphSignal(x, y)
  %PLOTSIGNAL Plot an original and a filtered graph signal.

  x = real(x(:));
  y = real(y(:));

  if (numel(x) != numel(y))
    error('plotSignal: x and y must have the same number of elements');
  end

  n = numel(x);
  node = 1:n;
  limits = [min([x; y]), max([x; y])];

  % Avoid a zero-height y-axis when both signals are constant.
  if (limits(1) == limits(2))
    margin = max(1, abs(limits(1)) * 0.05);
    limits = limits + [-margin, margin];
  else
    margin = 0.05 * diff(limits);
    limits = limits + [-margin, margin];
  end

  figure('color', 'w');

  subplot(3, 1, 1);
  plot(node, x, '-', 'linewidth', 1.0, 'color', [0.20, 0.45, 0.75]);
  ylabel('Amplitude');
  title('Original graph signal');
  xlim([1, max(1, n)]);
  ylim(limits);
  grid on;

  subplot(3, 1, 2);
  plot(node, y, '-', 'linewidth', 1.0, 'color', [0.85, 0.33, 0.10]);
  ylabel('Amplitude');
  title('Filtered graph signal');
  xlim([1, max(1, n)]);
  ylim(limits);
  grid on;

  subplot(3, 1, 3);
  plot(node, y - x, '-', 'linewidth', 1.0, 'color', [0.35, 0.35, 0.35]);
  xlabel('Node index');
  ylabel('Difference');
  title('Change introduced by filtering (y - x)');
  xlim([1, max(1, n)]);
  grid on;
end
