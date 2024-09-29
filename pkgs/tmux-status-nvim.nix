{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "tmux-status-nvim";
  src = fetchFromGitHub {
    owner = "christopher-francisco";
    repo = "tmux-status.nvim";
    rev = "0.2";
    hash = "sha256-Y+eucDyzlfXaKutmZJ+83UxVeRwRW+qbuvITB+GXWZ4=";
  };
}
