{
  plugins.lspsaga = {
    enable = true;
    lightbulb.enable = false;
    symbolInWinbar.showFile = false;
  };
  keymaps = [
    {
      mode = "n";
      key = "K";
      action = "<CMD>Lspsaga hover_doc<CR>";
      options.desc = "LSP: Hover Documentation";
    }
  ];
}
