{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.vim-startuptime];
  globals.startuptime_tries = 10;
}
