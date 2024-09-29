{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [cellular-automation-nvim];
}
