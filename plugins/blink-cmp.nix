{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources = {
        default = ["lsp" "path"];
        providers = {
          lsp.fallbacks = [];
          path.fallbacks = [];
        };
      };
      completion = {
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
