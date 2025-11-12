return {
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "BufReadPost",
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
      },
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      provider = "copilot",
      file_selector = {
        provider = "snacks", -- Avoid native provider issues
        provider_opts = {},
      },
      selection = {
        hint_display = "none",
      },
      behaviour = {
        auto_set_keymaps = false,
      },
    },
    cmd = {
      "AvanteAsk",
      "AvanteBuild",
      "AvanteChat",
      "AvanteClear",
      "AvanteEdit",
      "AvanteFocus",
      "AvanteHistory",
      "AvanteModels",
      "AvanteRefresh",
      "AvanteShowRepoMap",
      "AvanteStop",
      "AvanteSwitchProvider",
      "AvanteToggle",
    },
    keys = {
      { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Ask Avante" },
      { "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat with Avante" },
      { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Edit Avante" },
      { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },
      { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante History" },
      { "<leader>am", "<cmd>AvanteModels<CR>", desc = "Select Avante Model" },
      { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Avante Chat" },
      { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider" },
      { "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Refresh Avante" },
      { "<leader>as", "<cmd>AvanteStop<CR>", desc = "Stop Avante" },
      { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
    },

    config = function()
      local wk = require "which-key"
      wk.add { mode = { "n", "v" }, "<leader>a", icon = "", group = "AI Assistant" }
    end,
  },
}
