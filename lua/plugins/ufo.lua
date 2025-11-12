return {
  "kevinhwang91/nvim-ufo",
  event = "LSPAttach",
  dependencies = { { "kevinhwang91/promise-async" } },
  config = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is less than v0.6.1, remap yourself
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zr", function()
      require("ufo").openFoldsExceptKinds()
    end, { desc = "Fold less" })
    vim.keymap.set("n", "zm", function()
      require("ufo").closeFoldsWith()
    end, { desc = "Fold more" })
    vim.keymap.set("n", "zp", function()
      require("ufo").peekFoldedLinesUnderCursor()
    end, { desc = "Peek fold" })

    require("ufo").setup {
      provider_selector = function(_, filetype, buftype)
        local function handleFallbackException(bufnr, err, providerName)
          if type(err) == "string" and err:match "UfoFallbackException" then
            return require("ufo").getFolds(bufnr, providerName)
          else
            return require("promise").reject(err)
          end
        end

        return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
          or function(bufnr)
            return require("ufo")
              .getFolds(bufnr, "lsp")
              :catch(function(err)
                return handleFallbackException(bufnr, err, "treesitter")
              end)
              :catch(function(err)
                return handleFallbackException(bufnr, err, "indent")
              end)
          end
      end,
    }
  end,
}
