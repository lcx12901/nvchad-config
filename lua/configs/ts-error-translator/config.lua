return function()
  require("ts-error-translator").setup {
    auto_attach = true,
    servers = {
      "astro",
      "svelte",
      "ts_ls",
      "typescript-tools",
      "vue_ls",
      "vtsls",
    },
  }
end
