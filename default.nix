{
  imports = [
    ./plugins/autopairs.nix
    ./plugins/cmp.nix
    ./plugins/codesnap.nix
    ./plugins/comment.nix
    ./plugins/conform.nix
    ./plugins/cord.nix
    ./plugins/dbee.nix
    ./plugins/fzf.nix
    ./plugins/git-conflict.nix
    ./plugins/gitsigns.nix
    ./plugins/gruvbox.nix
    ./plugins/health.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/mini.nix
    ./plugins/noice.nix
    ./plugins/oil.nix
    ./plugins/roslyn.nix
    ./plugins/sleuth.nix
    ./plugins/todo-comment.nix
    ./plugins/treesitter.nix
    ./plugins/treesj.nix
    ./plugins/trouble.nix
    ./plugins/vim-startuptime.nix
    ./plugins/web-devicons.nix
    ./plugins/zen-mode.nix
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };

  opts = {
    relativenumber = true;
    # Enable mouse mode, can be useful for resizing splits for example!
    mouse = "a";
    showmode = false;
    # Sync clipboard between OS and Neovim
    clipboard = "unnamedplus";
    # Enable break indent
    breakindent = true;
    # Save undo history
    undofile = true;
    # Case-insensitive searching UNLESS \C or one or more capital letters in search term
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    # Decrease update time
    updatetime = 250;
    # Decrease mapped sequence wait time
    # Displays which-key popup sooner
    timeoutlen = 300;
    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;
    # Sets how neovim will display certain whitespace characters in the editor
    list = true;
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
    # Preview subsitutions live, as you type!
    inccommand = "split";
    cursorline = true;
    # cursorlineopt = "number";
    # Minimal number of screen lines to keep above and below the cursor
    scrolloff = 10;
    # Set highlight on search, but clear on pressing <Esc> in normal mode
    hlsearch = true;
    # disable text wrapping
    wrap = false;
    # expand tab input with spaces characters
    expandtab = true;
    # syntax aware indentations for newline inserts
    smartindent = true;
    # num of space characters per tab
    tabstop = 4;
    softtabstop = 4;
    # spaces per indentation level
    shiftwidth = 4;
    termguicolors = true;
    mousemoveevent = true;
    # line length marker
    colorcolumn = "80";
  };

  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
      options = {
        desc = "Exit terminal mode";
      };
    }
    {
      mode = "n";
      key = "<left>";
      action = "<cmd>echo 'Use h to move!!'<CR>";
    }
    {
      mode = "n";
      key = "<right>";
      action = "<cmd>echo 'Use l to move!!'<CR>";
    }
    {
      mode = "n";
      key = "<up>";
      action = "<cmd>echo 'Use k to move!!'<CR>";
    }
    {
      mode = "n";
      key = "<down>";
      action = "<cmd>echo 'Use j to move!!'<CR>";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options = {
        desc = "Move focus to the left window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options = {
        desc = "Move focus to the right window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options = {
        desc = "Move focus to the lower window";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options = {
        desc = "Move focus to the upper window";
      };
    }
  ];

  autoGroups = {
    hl-yank = {clear = true;};
  };
  autoCmd = [
    {
      event = ["TextYankPost"];
      desc = "Highlight when yanking (copying) text";
      group = "hl-yank";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];
}
