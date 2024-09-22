{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [cord-nvim];
  extraConfigLua = ''
    require('cord').setup {
      editor = { tooltip = "Neovim" },
      display = { show_cursor_position = true },
      lsp = { show_problem_count = false },
      assets = {
        [".tf"] = {
          icon = "https://i.postimg.cc/8C4x6HxS/terraform.png",
          tooltip = "Terraform",
          type = 0,
        },
        [".tfvars"] = {
          icon = "https://i.postimg.cc/8C4x6HxS/terraform.png",
          tooltip = "Terraform",
          type = 0,
        }
      },
    }
  '';
}
