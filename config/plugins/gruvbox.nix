{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [gruvbox-material];
  colorscheme = "gruvbox-material";
  globals = {
    gruvbox_material_diagnostic_virtual_text = 1;
  };
  highlightOverride = {
    TelescopeSelection = {link = "CursorLine";};
    TelescopeMatching = {link = "OrangeBold";};
    NormalFloat = {link = "@none";};
    FloatBorder = {link = "@none";};
    Directory = {link = "Yellow";};
    MiniStatuslineModeNormal = {link = "OctoBubbleBlue";};
    MiniStatuslineModeInsert = {link = "OctoBubblePurple";};
    MiniStatuslineModeVisual = {link = "OctoBubbleRed";};
    MiniStatuslineModeReplace = {link = "OctoBubbleYellow";};
    MiniStatuslineModeCommand = {link = "OctoBubbleGreen";};
    MiniStatuslineModeOther = {link = "OctoBubbleGrey";};
  };
}
