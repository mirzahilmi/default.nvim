{
  plugins.obsidian = {
    enable = true;
    settings = {
      dir = "~/Notes";
      workspaces = [
        {
          name = "default";
          path = "~/Notes";
        }
      ];
      new_notes_location = "current_dir";
      completion = {
        min_chars = 2;
      };
      picker = {
        name = "telescope.nvim";
      };
      ui = {
        enable = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>oc";
      action.__raw = ''
        function()
          require('obsidian').util.toggle_checkbox()
        end
      '';
      options = {
        desc = "Obsidian Check Checkbox";
      };
    }
    {
      mode = "n";
      key = "<leader>ot";
      action = "<CMD>ObsidianTemplate<CR>";
      options = {
        desc = "Insert Obsidian Template";
      };
    }
    {
      mode = "n";
      key = "<leader>oo";
      action = "<CMD>ObsidianOpen<CR>";
      options = {
        desc = "Open in Obsidian App";
      };
    }
    {
      mode = "n";
      key = "<leader>ob";
      action = "<CMD>ObsidianBacklinks<CR>";
      options = {
        desc = "Show ObsidianBacklinks";
      };
    }
    {
      mode = "n";
      key = "<leader>ol";
      action = "<CMD>ObsidianLinks<CR>";
      options = {
        desc = "Show ObsidianLinks";
      };
    }
    {
      mode = "n";
      key = "<leader>on";
      action = "<CMD>ObsidianNew<CR>";
      options = {
        desc = "Create New Note";
      };
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<CMD>ObsidianSearch<CR>";
      options = {
        desc = "Search Obsidian";
      };
    }
    {
      mode = "n";
      key = "<leader>oq";
      action = "<CMD>ObsidianQuickSwitch<CR>";
      options = {
        desc = "Quick Switch";
      };
    }
  ];
}
