require("nvchad.configs.lspconfig").defaults()

local servers = {
  nixd = {},
  unocss = {},
  vue_ls = {},
  ts_ls = {
    init_options = {
      maxTsServerMemory = 8192,
      plugins = {
        {
          name = "@vue/typescript-plugin",
          -- it's a hack for nixOS /nix/store/
          location = vim.fs.joinpath(
            vim.fs.dirname(vim.fs.dirname(vim.fn.system "echo -n $(readlink -f $(which vue-language-server))")),
            "/lib/language-tools/packages/language-server"
          ),
          --
          languages = { "vue" },
        },
      },
      preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    filetypes = {
      "typescript",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "vue",
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end
