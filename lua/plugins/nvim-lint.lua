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
    linters = {
      statix = { cmd = "statix" },
      deadnix = { cmd = "deadnix" },
      eslint_d = { cmd = "eslint_d" },
    },
  },
  config = function(_, opts)
    require("lint").linters_by_ft = opts.linters_by_ft

    local linters = require("lint").linters
    local my_linters = opts.linters
    for linter, config in pairs(my_linters) do
      if linters[linter] == nil then
        linters[linter] = config
      else
        for key, val in pairs(config) do
          linters[linter][key] = val
        end
      end
    end
  end,
}
