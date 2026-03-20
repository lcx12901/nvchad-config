return {
  { "<leader>sn", "", desc = "noice" },
  {
    "<S-Enter>",
    function()
      require("noice").redirect(vim.fn.getcmdline())
    end,
    mode = "c",
    desc = "Redirect Cmdline",
  },
  {
    "<leader>snl",
    function()
      require("noice").cmd "last"
    end,
    desc = "Noice Last Message",
  },
  {
    "<leader>snh",
    function()
      require("noice").cmd "history"
    end,
    desc = "Noice History",
  },
  {
    "<leader>sna",
    function()
      require("noice").cmd "all"
    end,
    desc = "Noice All",
  },
  {
    "<leader>snd",
    function()
      require("noice").cmd "dismiss"
    end,
    desc = "Dismiss All",
  },
}
