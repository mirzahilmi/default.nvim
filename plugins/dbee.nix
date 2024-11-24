{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-dbee
    cmp-dbee
  ];
  extraConfigLua = ''
    require"dbee".setup {}
  '';
  plugins.cmp.settings.sources = [{name = "cmp-dbee";}];
}
