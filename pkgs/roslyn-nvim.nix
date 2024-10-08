{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "roslyn.nvim";
  src = fetchFromGitHub {
    owner = "seblj";
    repo = "roslyn.nvim";
    rev = "11168911d35ea276b1fbd8fa33f7564325b6c624";
    hash = "sha256-iHCDmht0qCkfuFHTHKSuq7s6hnDRhHJeOfbcOlee6Rs=";
  };
  meta.homepage = "https://github.com/seblj/roslyn.nvim";
}
