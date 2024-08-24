{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [bg-nvim];
}
