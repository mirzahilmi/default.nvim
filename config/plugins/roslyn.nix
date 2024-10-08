{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [roslyn-nvim];
}
