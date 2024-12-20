local overrides = require("config.overrides")

local M = {
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    config = function(_, opts)
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "rayliwell/nvim-ts-autotag" },
    },
    opts = overrides.treesitter,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telsecope,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = overrides.neotree,
  },
}

return M
