{pkgs, ...}: {
  imports = [
    ./plugins/autopairs.nix
    ./plugins/cmp.nix
    ./plugins/codesnap.nix
    ./plugins/conform.nix
    ./plugins/cord.nix
    ./plugins/dadbod.nix
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
    ./plugins/oil.nix
    ./plugins/persistence.nix
    ./plugins/roslyn.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    ./plugins/vim-startuptime.nix
    ./plugins/web-devicons.nix
    ./plugins/which-key.nix
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
    # Don't show the mode, since it's already in the statusline
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
    # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
    # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
    # is not what someone will guess without a bit more experience.
    {
      mode = "t";
      key = "<Esc><Esc>";
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
    # Keybinds to make split navigation easier.
    #  Use CTRL+<hjkl> to switch between windows
    #
    #  See `:help wincmd` for a list of all window commands
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
    # {
    #   mode = "n";
    #   key = "<C-/>";
    #   action = "<C-w><C-k>";
    #   options = {
    #     desc = "Move focus to the upper window";
    #   };
    # }
  ];

  autoGroups = {
    kickstart-highlight-yank = {
      clear = true;
    };
  };

  autoCmd = [
    #  Highlight when yanking (copying) text
    #  Try it with `yap` in normal mode
    #  See `:help vim.highlight.on_yank()`
    {
      event = ["TextYankPost"];
      desc = "Highlight when yanking (copying) text";
      group = "kickstart-highlight-yank";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];

  plugins = {
    # Detect tabstop and shiftwidth automatically
    # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
    sleuth = {
      enable = true;
    };

    # "gc" to comment visual regions/lines
    # https://nix-community.github.io/nixvim/plugins/comment/index.html
    comment = {
      enable = true;
    };

    # Highlight todo, notes, etc in comments
    # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
    todo-comments = {
      enable = true;
      settings.signs = true;
    };
  };

  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraplugins
  extraPlugins = with pkgs.vimPlugins; [
    vim-abolish
    vim-be-good
  ];

  # The line beneath this is called `modeline`. See `:help modeline`
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
  extraConfigLuaPost = ''
    -- vim: ts=2 sts=2 sw=2 et
  '';
}
