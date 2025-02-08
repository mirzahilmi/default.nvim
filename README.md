> [!WARNING]
> I've been long move out configuring my neovim [using lua](https://github.com/mirzahilmi/nvim) instead of nix. Its to much, of a burden translating lua configuration to nix, not even mentioning writing the lua code as a string value in nix without good lsp support \*\*yikes**. The repository are still here if anybody interested about how i configure neovim with nix along time ago.

# default.nvim

This is my Neovim configuration, managed with [NixVim](https://github.com/nix-community/nixvim). It includes a variety of plugins all managed declaratively with Nix.

## Plugins Used

**UI & Themes:**
`base16.nix`, `bufferline.nix`, `gruvbox.nix`, `which-key.nix`  

**Editing:**
`autopairs.nix`, `bg-nvim.nix`, `mini.nix`  


**Navigation:**
`telescope.nix`, `oil.nix`, `trouble.nix`, `text-case.nix`  


**Code Intelligence:**
`treesitter.nix`, `lsp.nix`, `conform.nix`, `nvim-cmp.nix`  


**Dev Tools:**
`dadbod.nix`, `dbee.nix`, `gitsigns.nix`, `cord.nix`, `neocord.nix`  


**Linting & Health:**
`lint.nix`, `health.nix`  
