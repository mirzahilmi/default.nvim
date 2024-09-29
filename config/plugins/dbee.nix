{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-dbee
    cmp-dbee
  ];
  extraConfigLua = ''
    require"dbee".setup {}
  '';
  plugins.cmp.filetype.sql.sources = [{name = "cmp-dbee";}];
}
