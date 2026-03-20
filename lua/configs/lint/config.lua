return function(_, opts)
  require("lint").linters_by_ft = opts.linters_by_ft

  local linters = require("lint").linters
  local my_linters = opts.linters
  for linter, config in pairs(my_linters) do
    if linters[linter] == nil then
      linters[linter] = config
    else
      for key, val in pairs(config) do
        linters[linter][key] = val
      end
    end
  end
end
