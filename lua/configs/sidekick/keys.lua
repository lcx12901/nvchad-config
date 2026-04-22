return {
  {
    "<c-.>",
    function()
      require("sidekick.cli").toggle()
    end,
    desc = "Sidekick Toggle",
    mode = { "n", "t", "i", "x" },
  },
  {
    "<leader>ao",
    function()
      require("sidekick.cli").toggle { name = "opencode", focus = true }
    end,
    -- Or to select only installed tools:
    -- require("sidekick.cli").select({ filter = { installed = true } })
    desc = "Opencode Toggle",
  },
}
