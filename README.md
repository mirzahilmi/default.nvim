# default.nvim

This is my Neovim configuration, managed with [NixVim](https://github.com/nix-community/nixvim). It includes a variety of plugins to enhance the Neovim experience, all managed declaratively with Nix.

<!-- ## Installation -->
<!---->
<!-- 1. **Clone the Repo:** -->
<!---->
<!--    ```bash -->
<!--    git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim -->
<!--    ``` -->
<!---->
<!-- 2. **Set Up NixVim:** -->
<!---->
<!--    Add this to your Home Manager configuration: -->
<!---->
<!--    ```nix -->
<!--    { -->
<!--      imports = [ -->
<!--        <path-to-this-repo>/nvim.nix -->
<!--      ]; -->
<!--    } -->
<!--    ``` -->
<!---->
<!-- 3. **Apply the Configuration:** -->
<!---->
<!--    ```bash -->
<!--    home-manager switch -->
<!--    ``` -->

## Plugins Used

- **UI & Themes:**
  - `base16.nix`, `bufferline.nix`, `gruvbox.nix`, `which-key.nix`

- **Editing:**
  - `autopairs.nix`, `bg-nvim.nix`, `mini.nix`

- **Navigation:**
  - `telescope.nix`, `oil.nix`, `trouble.nix`, `text-case.nix`

- **Code Intelligence:**
  - `treesitter.nix`, `lsp.nix`, `conform.nix`, `nvim-cmp.nix`

- **Dev Tools:**
  - `dadbod.nix`, `dbee.nix`, `gitsigns.nix`, `cord.nix`, `neocord.nix`

- **Linting & Health:**
  - `lint.nix`, `health.nix`

## Usage

Start Neovim as usual:

```bash
nvim
```

Refer to the configuration files for custom keybindings and plugin settings.

## License

This config is licensed under the MIT License.
