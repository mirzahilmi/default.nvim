{
  plugins.which-key = {
    enable = true;

    # Document existing key chains
    settings.spec = [
      {
        __unkeyed = "<leader>c";
        group = "[C]ode";
        desc = "which_key_ignore";
      }
      {
        __unkeyed = "<leader>d";
        group = "[D]ocument";
        desc = "which_key_ignore";
      }
      {
        __unkeyed = "<leader>r";
        group = "[R]ename";
        desc = "which_key_ignore";
      }
      {
        __unkeyed = "<leader>s";
        group = "[S]earch";
        desc = "which_key_ignore";
      }
      {
        __unkeyed = "<leader>w";
        group = "[W]orkspace";
        desc = "which_key_ignore";
      }
      {
        __unkeyed = "<leader>t";
        group = "[T]oggle";
        desc = "which_key_ignore";
      }
      {
        __unkeyed = "<leader>h";
        group = "Git [H]unk";
        desc = "which_key_ignore";
      }
    ];
  };
}
