return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      nix = { "statix", "deadnix" },
      typescript = { "eslint_d" },
      vue = { "eslint_d" },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd(opts.events, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
