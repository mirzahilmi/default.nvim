{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "roslyn.nvim";
  src = fetchFromGitHub {
    owner = "seblj";
    repo = "roslyn.nvim";
    rev = "85aca5d48ddf8ada4e010ee9fa4d43c77ebf68c9";
    hash = "sha256-UW0iWGNNWjLIYszKUBYOqoFxbmELX9VVgTj63UJdo4A=";
  };
  meta.homepage = "https://github.com/seblj/roslyn.nvim";
}
