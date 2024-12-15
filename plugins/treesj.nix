{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.treesj];
  extraConfigLua = ''
    require('treesj').setup {
      use_default_keymaps = false,
    }
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>j";
      action = "<cmd>TSJToggle<cr>";
    }
  ];
}
