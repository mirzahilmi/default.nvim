{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "vim-dbml";
  src = fetchFromGitHub {
    owner = "jidn";
    repo = "vim-dbml";
    rev = "c684576d80542c52f888309b715c49bc69a02ed3";
    hash = "sha256-BCA/JUjvKcS4qbXm2iL+P/2ZDDBA2sblpKpAreodr9M=";
  };
}
