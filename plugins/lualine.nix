{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        globalstatus = true;
        section_separators = "";
        component_separators = "";
        disabled_filetypes.statusline = ["dashboard" "lazy" "alpha"];
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = [""];
        lualine_c = ["filename"];
        lualine_x = [
          {
            __unkeyed = "diff";
            source = ''
              function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end
            '';
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
            colored = true;
            always_visible = false;
          }
          {
            __unkeyed = "diagnostics";
            sources = ["nvim_diagnostic"];
            sections = ["error" "warn" "info" "hint"];
            symbols = {
              error = " ";
              hint = " ";
              info = " ";
              warn = " ";
            };
            colored = true;
            update_in_insert = false;
            always_visible = false;
          }
          {
            __unkeyed = "filetype";
            icon_only = true;
          }
        ];
        lualine_y = ["progress"];
        lualine_z = ["location"];
      };
    };
  };
}
