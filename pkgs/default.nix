{
  pkgs,
  prev,
}: {
  vimPlugins =
    prev.vimPlugins
    // {
      bg-nvim = pkgs.callPackage ./bg-nvim.nix {};
      cellular-automation-nvim = pkgs.callPackage ./cellular-automation-nvim.nix {};
      cmp-dbee = pkgs.callPackage ./cmp-dbee.nix {};
      laravel-nvim = pkgs.callPackage ./laravel-nvim.nix {};
      roslyn-nvim = pkgs.callPackage ./roslyn-nvim.nix {};
      tmux-status-nvim = pkgs.callPackage ./tmux-status-nvim.nix {};
      vim-dbml = pkgs.callPackage ./vim-dbml.nix {};
    };
}
