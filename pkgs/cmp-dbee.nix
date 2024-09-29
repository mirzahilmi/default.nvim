{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "cmp-dbee";
  src = fetchFromGitHub {
    owner = "MattiasMTS";
    repo = "cmp-dbee";
    rev = "1650f67b9bf43c029fc37570665ca895a33cdf5a";
    hash = "sha256-XxB4jQu9xAi/7XDcwsd0hGLSs74ysjg0N/uaTHjqByI=";
  };
}
