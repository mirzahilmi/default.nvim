{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        diagnostics = "nvim_lsp";
        hover = {
          enabled = true;
          delay = 200;
          reveal = ["close"];
        };
      };
    };
  };
}
