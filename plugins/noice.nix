{
  plugins.noice = {
    enable = true;
    settings = {
      lsp.override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
      presets.lsp_doc_border = true;
      cmdline.enabled = false;
      messages.enabled = false;
      notify.enabled = false;
      popupmenu.enabled = false;
      # Fix fidget.nvim overlapping statusbar
      views.mini.position = {
        row = -2;
        col = "100%";
      };
    };
  };
}
