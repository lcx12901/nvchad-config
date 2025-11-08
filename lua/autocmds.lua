require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      -- Don't save while there's any 'nofile' buffer open.
      if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
        return
      end
    end
    require("session_manager").save_current_session()
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("my_nvim_lint", { clear = true }),
  callback = function(args)
    local buf = args.buf
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
    local linters = require("lint").linters
    local linters_from_ft = require("lint").linters_by_ft[ft]

    -- if no linter is configured for this filetype, stops linting
    if linters_from_ft == nil then
      return
    end

    for _, name in ipairs(linters_from_ft) do
      local linter = linters[name]
      assert(linter, "Linter with name `" .. name .. "` not available")

      if type(linter) == "function" then
        linter = linter()
      end
      -- for require("lint").lint() to work, linter.name must be set
      linter.name = linter.name or name
      local cwd = linter.required_files

      -- if no configuration files are configured, lint
      if cwd == nil then
        require("lint").lint(linter)
      else
        -- if configuration files are configured and present in the project, lint
        for _, fn in ipairs(cwd) do
          local path = vim.fs.joinpath(linter.cwd or vim.fn.getcwd(), fn)
          if vim.uv.fs_stat(path) then
            require("lint").lint(linter)
            break
          end
        end
      end
    end
  end
})
