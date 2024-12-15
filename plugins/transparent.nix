{
  plugins.transparent = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>k";
      action = "<cmd>TransparentToggle<cr>";
    }
  ];
}
