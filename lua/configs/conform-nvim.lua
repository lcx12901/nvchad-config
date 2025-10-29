local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
    typescript = { "eslint_d" },
    vue = { "eslint_d" },
  },

  formatters = {
    eslint_d = {
      cwd = require("conform.util").root_file {
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        "eslint.config.ts",
        "eslint.config.mts",
        "eslint.config.cts",
      },
      require_cwd = true,
    },
  },

  format_on_save = false,
}

return options
