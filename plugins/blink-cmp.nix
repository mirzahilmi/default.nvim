{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources = {
        completion.enabled_providers = ["lsp" "path"];
        transform_items.__raw = ''
          function(ctx, items)
            -- Remove the "Text" source from lsp autocomplete
            return vim.tbl_filter(function(item)
              return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
            end, items)
          end
        '';
      };
      completion = {
        accept = {
          auto_brackets.enabled = true;
        };
        menu = {
          border = "rounded";
          draw.treesitter = ["lsp"];
        };
      };
      appearance = {
        nerd_font_variant = "normal";
      };
    };
  };
}
