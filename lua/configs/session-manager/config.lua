return function()
  local Path = require "plenary.path"
  local config = require "session_manager.config"
  require("session_manager").setup {
    sessions_dir = Path:new(vim.fn.stdpath "state", "sessions"),
    autoload_mode = config.AutoloadMode.GitSession,
  }
end
