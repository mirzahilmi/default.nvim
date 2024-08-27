{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [laravel-nvim];
  extraConfigLua = ''

  '';
}
