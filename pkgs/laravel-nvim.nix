{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "bg-nvim";
  src = fetchFromGitHub {
    owner = "adalessa";
    repo = "laravel.nvim";
    rev = "v2.2.1";
    hash = "";
  };
}
