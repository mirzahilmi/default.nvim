{
  pkgs,
  prev,
}: {
  vimPlugins =
    prev.vimPlugins
    // {
      bg-nvim = pkgs.callPackage ./bg-nvim.nix {};
      laravel-nvim = pkgs.callPackage ./laravel-nvim.nix {};
    };
}
