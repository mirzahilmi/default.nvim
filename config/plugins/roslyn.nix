{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [roslyn-nvim];
  extraConfigLua = ''
    require('roslyn').setup {}
  '';
}
