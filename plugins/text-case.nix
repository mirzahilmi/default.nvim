{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    (
      text-case-nvim.overrideAttrs (prevAttrs: {
        src = prevAttrs.src.override {
          rev = "v1.2.0";
          sha256 = "sha256-gmyuRjX7V+Z2KFkl1tBiqpfrKrDoAoJlwSa3TYwnJ5Y=";
        };
      })
    )
  ];
  extraConfigLua = "require('textcase').setup( {} )";
}
