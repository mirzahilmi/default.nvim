{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [cord-nvim];
  extraConfigLua = ''
    require('cord').setup {
      editor = { tooltip = "Neovim" }
    }
  '';
}
