return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = "make tiktoken",
  cmd = {
    "CopilotChat",
    "CopilotChatAgents",
    "CopilotChatLoad",
    "CopilotChatModels",
    "CopilotChatOpen",
    "CopilotChatPrompts",
    "CopilotChatToggle",
  },
}
