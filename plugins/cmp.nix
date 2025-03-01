{
  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
  };
  extraLuaPackages = ps: [ps.jsregexp];
  plugins.cmp = {
    enable = true;
    settings = {
      completion.completeopt = "menu,menuone,noinsert";
      window = {
        completion = {
          border = "rounded";
          scrollbar = true;
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          zindex = 1001;
        };
        documentation = {
          winhighlight = "Normal:DarkFloat,FloatBorder:DarkFloat";
          zindex = 1001;
        };
      };
      performance = {
        debounce = 0;
        throttle = 0;
      };
      mapping = {
        # Select the [n]ext item
        "<C-n>" = "cmp.mapping.select_next_item()";
        # Select the [p]revious item
        "<C-p>" = "cmp.mapping.select_prev_item()";
        # Scroll the documentation window [b]ack / [f]orward
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        # Accept ([y]es) the completion.
        #  This will auto-import if your LSP supports it.
        #  This will expand snippets if the LSP sent a snippet.
        "<C-y>" = "cmp.mapping.confirm { select = true }";
        # Manually trigger a completion from nvim-cmp.
        #  Generally you don't need this, because nvim-cmp will display
        #  completions whenever it has completion options available.
        "<C-Space>" = "cmp.mapping.complete {}";
        # Think of <c-l> as moving to the right of your snippet expansion.
        #  So if you have a snippet that's like:
        #  function $name($args)
        #    $body
        #  end
        #
        # <c-l> will move you to the right of the expansion locations.
        # <c-h> is similar, except moving you backwards.
      };
      sources = [
        {name = "nvim_lsp";}
        {name = "path";}
      ];
    };
  };
}
