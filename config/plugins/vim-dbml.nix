{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [vim-dbml];
}
