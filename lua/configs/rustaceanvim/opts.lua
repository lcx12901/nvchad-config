local function rust_lsp_command(command)
  return function()
    if vim.fn.exists(":RustLsp") == 2 then
      vim.cmd("RustLsp " .. command)
      return
    end

    vim.notify("RustLsp command is not ready yet", vim.log.levels.WARN)
  end
end

local function rust_analyzer_command(command)
  return function()
    if vim.fn.exists(":RustAnalyzer") == 2 then
      vim.cmd("RustAnalyzer " .. command)
      return
    end

    vim.notify("RustAnalyzer command is not ready yet", vim.log.levels.WARN)
  end
end

return {
  tools = {
    enable_clippy = true,
  },
  server = {
    on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
          buffer = bufnr,
          desc = desc,
        })
      end

      map({ "n", "x" }, "<leader>za", rust_lsp_command "codeAction", "Code Action (Rust)")
      map("n", "<leader>zh", rust_lsp_command "hover actions", "Hover Actions (Rust)")
      map("x", "<leader>zh", rust_lsp_command "hover range", "Hover Range (Rust)")
      map("n", "<leader>zm", rust_lsp_command "expandMacro", "Expand Macro")
      map("n", "<leader>zp", rust_lsp_command "rebuildProcMacros", "Rebuild Proc Macros")
      map("n", "<leader>zr", rust_lsp_command "runnables", "Rust Runnables")
      map("n", "<leader>zt", rust_lsp_command "testables", "Rust Testables")
      map("n", "<leader>zo", rust_lsp_command "openDocs", "Open Docs (Rust)")
      map("n", "<leader>zc", rust_lsp_command "openCargo", "Open Cargo.toml")
      map("n", "<leader>zP", rust_lsp_command "parentModule", "Open Parent Module")
      map("n", "<leader>zW", rust_analyzer_command "reloadSettings", "Reload rust-analyzer Settings")

      if client:supports_method("textDocument/codeLens") and vim.lsp.codelens then
        vim.lsp.codelens.enable(true, {
          bufnr = bufnr,
        })
      end
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          buildScripts = {
            enable = true,
          },
        },
        check = {
          command = "clippy",
        },
        diagnostics = {
          enable = true,
          styleLints = {
            enable = true,
          },
        },
        files = {
          excludeDirs = {
            ".cargo",
            ".direnv",
            ".git",
            "node_modules",
            "target",
          },
        },
        inlayHints = {
          bindingModeHints = {
            enable = true,
          },
          closureReturnTypeHints = {
            enable = "always",
          },
          discriminantHints = {
            enable = "always",
          },
          lifetimeElisionHints = {
            enable = "always",
          },
          reborrowHints = {
            enable = "always",
          },
        },
        procMacro = {
          enable = true,
        },
        rustc = {
          source = "discover",
        },
      },
    },
  },
}
