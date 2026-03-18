require("nvchad.configs.lspconfig").defaults()

local customizations = {
  { rule = "style/*", severity = "off", fixable = true },
  { rule = "format/*", severity = "off", fixable = true },
  { rule = "*-indent", severity = "off", fixable = true },
  { rule = "*-spacing", severity = "off", fixable = true },
  { rule = "*-spaces", severity = "off", fixable = true },
  { rule = "*-order", severity = "off", fixable = true },
  { rule = "*-dangle", severity = "off", fixable = true },
  { rule = "*-newline", severity = "off", fixable = true },
  { rule = "*quotes", severity = "off", fixable = true },
  { rule = "*semi", severity = "off", fixable = true },
}

local servers = {
  bashls = {},
  nixd = {},
  unocss = {},
  vue_ls = {},
  eslint = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "html",
      "markdown",
      "json",
      "jsonc",
      "yaml",
      "toml",
      "xml",
      "gql",
      "graphql",
      "astro",
      "svelte",
      "css",
      "less",
      "scss",
      "pcss",
      "postcss",
    },
    settings = {
      -- Silent the stylistic rules in your IDE, but still auto fix them
      rulesCustomizations = customizations,
    },
  },
  yamlls = {},
  ts_ls = {
    init_options = {
      maxTsServerMemory = 16384,
      plugins = {
        {
          name = "@vue/typescript-plugin",
          -- it's a hack for nixOS /nix/store/
          location = vim.fs.joinpath(
            vim.fs.dirname(vim.fs.dirname(vim.fn.system "echo -n $(readlink -f $(which vue-language-server))")),
            "/lib/language-tools/packages/language-server"
          ),
          languages = { "vue" },
        },
      },
    },
    filetypes = {
      "typescript",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "vue",
    },
    settings = {
      typescript = {
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = {
            enabled = "all", -- "none" | "literals" | "all"
            suppressWhenArgumentMatchesName = true,
          },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = {
            enabled = true,
            suppressWhenTypeMatchesName = true,
          },
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end

Snacks.util.lsp.on({ method = "textDocument/inlayHint" }, function(buffer)
  if
    vim.api.nvim_buf_is_valid(buffer)
    and vim.bo[buffer].buftype == ""
  then
    vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
  end
end)
