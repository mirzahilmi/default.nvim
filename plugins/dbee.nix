{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-dbee
    cmp-dbee
  ];
  extraConfigLua = ''
    require"dbee".setup {}
  '';
}
