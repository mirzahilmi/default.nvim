{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "bg-nvim";
  src = fetchFromGitHub {
    owner = "typicode";
    repo = "bg.nvim";
    rev = "61e1150dd5900eaf73700e4776088c2131585f99";
    hash = "sha256-qzBp5h9AkJWQ3X7TSwxX881klDXojefeH0Qn/prJ/78=";
  };
}
