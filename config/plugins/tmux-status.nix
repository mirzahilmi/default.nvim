{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [tmux-status-nvim];
  # extraConfigLua = ''
  #   require('tmux-status').tmux_windows()
  # '';
}
