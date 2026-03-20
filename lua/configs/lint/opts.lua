return {
  -- Event to trigger linters
  events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  linters_by_ft = {
    nix = { "statix", "deadnix" },
  },
  linters = {
    statix = { cmd = "statix" },
    deadnix = { cmd = "deadnix" },
  },
}
