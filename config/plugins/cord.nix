{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [cord-nvim];
  extraConfigLua = ''
    require('cord').setup {
      editor = { tooltip = "Neovim" },
      display = { show_cursor_position = true },
      lsp = { show_problem_count = false }
    }
  '';
}
