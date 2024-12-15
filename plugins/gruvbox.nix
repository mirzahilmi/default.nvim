{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [gruvbox-material];
  colorscheme = "gruvbox-material";
  globals = {
    gruvbox_material_diagnostic_virtual_text = 1;
  };
  highlightOverride = {
    DarkFloat = {bg = "#232323";};
    NormalFloat = {link = "@none";};
    FloatBorder = {link = "@none";};
    Directory = {link = "Yellow";};
    BlinkCmpMenu = {link = "@Normal";};
    BlinkCmpMenuBorder = {link = "FloatBorder";};
    BlinkCmpDoc = {link = "DarkFloat";};
    BlinkCmpDocBorder = {link = "DarkFloat";};
  };
}
