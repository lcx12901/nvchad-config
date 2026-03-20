return {
  {
    "<tab>",
    function()
      -- if there is a next edit, jump to it, otherwise apply it if any
      if not require("sidekick").nes_jump_or_apply() then
        return "<Tab>" -- fallback to normal tab
      end
    end,
    expr = true,
    desc = "Goto/Apply Next Edit Suggestion",
  },
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
