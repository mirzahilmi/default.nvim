{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [cord-nvim];
  extraConfigLua =
    #Lua
    ''
      require('cord').setup {
        editor = { tooltip = "Neovim" },
        display = { show_cursor_position = true },
        lsp = { show_problem_count = false },
        assets = {
          ["terraform"] = {
            icon = "https://i.postimg.cc/8C4x6HxS/terraform.png",
            tooltip = "Terraform",
            type = 0,
          },
          ["terraform-vars"] = {
            icon = "https://i.postimg.cc/8C4x6HxS/terraform.png",
            tooltip = "Terraform",
            type = 0,
          },
          ["hcl"] = {
            icon = "https://i.postimg.cc/Dw8WSH1w/image.png",
            tooltip = "HashiCorp Configuration Language",
            type = 0,
          }
        },
      }
    '';
}
