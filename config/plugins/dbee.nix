{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [nvim-dbee];
  extraConfigLua = ''
    require"dbee".setup {}
  '';
}
