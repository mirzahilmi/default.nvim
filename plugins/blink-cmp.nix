{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources.default = ["lsp" "path"];
      completion.menu.border = "rounded";
      appearance = {
        use_nvim_cmp_as_default = true;
        nerd_font_variant = "normal";
      };
    };
  };
}
