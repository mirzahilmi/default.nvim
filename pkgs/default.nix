{
  pkgs,
  prev,
}: {
  vimPlugins =
    prev.vimPlugins
    // {
      bg-nvim = pkgs.callPackage ./bg-nvim.nix {};
      laravel-nvim = pkgs.callPackage ./laravel-nvim.nix {};
      tmux-status-nvim = pkgs.callPackage ./tmux-status-nvim.nix {};
      cellular-automation-nvim = pkgs.callPackage ./cellular-automation-nvim.nix {};
    };
}
