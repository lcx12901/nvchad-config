return {
  {
    "<leader>tl",
    function()
      Snacks.lazygit()
    end,
    desc = "Open lazygit",
  },
  -- find
  {
    "<leader>fb",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Buffers",
  },
  {
    "<leader>fB",
    function()
      Snacks.picker.buffers { hidden = true, nofile = true }
    end,
    desc = "Buffers (all)",
  },
}
