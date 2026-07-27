• できます。ベクトルと凡例をセル配列で渡す形にすると、1本でも3本でも任意の本数でも同じ関数
  で描画できます。

  例えば plotVectors.m として次のようにまとめられます。

  function plotVectors(vectors, names, graph_title, x_label, y_label)

    % vectors: 描画するベクトルのセル配列
    % names:   凡例名のセル配列
    %
    % 使用例:
    % plotVectors({x}, {'x'}, ...)
    % plotVectors({x, y, z}, {'x', 'y', 'z'}, ...)

    if ~iscell(vectors) || isempty(vectors)
      error('plotVectors: vectors must be a non-empty cell array');
    end

    if ~iscell(names) || numel(vectors) ~= numel(names)
      error('plotVectors: vectors and names must have the same number of elements');
    end

    n = numel(vectors{1});

    % ベクトルの長さを確認
    for k = 1:numel(vectors)
      vectors{k} = abs(vectors{k}(:));

      if numel(vectors{k}) ~= n
        error('plotVectors: all vectors must have the same number of elements');
      end
    end

    node = 1:n;

    colors = [
      0.20, 0.45, 0.75;
      0.85, 0.33, 0.10;
      0.49, 0.18, 0.56
    ];

    figure('color', 'w');
    hold on;

    for k = 1:numel(vectors)
      color_index = mod(k - 1, size(colors, 1)) + 1;

      plot(node, vectors{k}, '-', ...
           'linewidth', 1.2, ...
           'color', colors(color_index, :));
    end

    hold off;

    xlabel(x_label, 'FontSize', 14);
    ylabel(y_label, 'FontSize', 14);
    title(graph_title, 'FontSize', 14);
    legend(names, 'location', 'northeast');
    xlim([1, max(1, n)]);
    grid on;
  end

  呼び出し方は次のようになります。

  % 1本
  plotVectors( ...
    {x}, ...
    {'Original'}, ...
    'Graph title', 'Node', 'Magnitude' ...
  );

  % 3本
  plotVectors( ...
    {x_hat, x_hat_m, x_hat_mg}, ...
    {'Kamata', 'Muramatsu', 'Magnetic'}, ...
    'Graph title', 'Node', 'Magnitude' ...
  );

  現在の main_comparing_methods.m なら、例えば以下のように置き換えられます。

  plotVectors( ...
    {x_hat, x_hat_m, x_hat_mg}, ...
    {'Kamata', 'Muramatsu', 'Magnetic'}, ...
    graph_title, x_label, y_label ...
  );

  セル配列方式は引数の対応関係が明確で、本数を増減しやすいのが利点です。ファイルはまだ変更
  していません。必要なら、この方針で関数の作成と既存呼び出し箇所の置き換えまで行えます。
