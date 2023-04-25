local utils = require "astrocommunity.utils"
return {
  { import = "astrocommunity.pack.yaml" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the "dart" and "yaml" language to opts.ensure_installed.
      utils.list_insert_unique(opts.ensure_installed, "dart")
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "dartls") end,
    opts = {
      lsp = require("astronvim.utils.lsp").config "dartls",
      debugger = {
        enabled = true,
        run_via_dap = true,
        register_configurations = function(_)
          require("dap").configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        -- opts = function(_, opts)
        --   -- Ensure that opts.ensure_installed exists and is a table.
        --   if not opts.ensure_installed then opts.ensure_installed = {} end
        --   utils.list_insert_unique(opts.ensure_installed, "dart")
        -- end,
      },
    },
  },
  -- Add "flutter" extension to "telescope"
  { "nvim-telescope/telescope.nvim",    opts = function() require("telescope").load_extension "flutter" end },
}
-- return {
-- "akinsho/flutter-tools.nvim",
-- {
--   'akinsho/flutter-tools.nvim',
--   -- lazy = false,
--   dependencies = {
--     -- "mfussenegger/nvim-dap",
--     -- "jay-babu/mason-nvim-dap.nvim",
--     'nvim-lua/plenary.nvim',
--     -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
--   },
-- }
-- {
--     "akinsho/flutter-tools.nv pim",
--     fvm = true,
--     debugger = {
--       -- integrate with nvim dap
--       enabled = true,
--       run_via_dap = true,
--       -- register_configuration = function(paths)
--       --   require("dap").configurations.dart = {
--       --     {
--       --       type = "dart",
--       --       request = "launch",
--       --       name = "Flutter",
--       --       dartSdkPath = paths.dart_sdk, -- This configuration is for debugging the flutter application
--       --       flutterSdkPath = paths.flutter_sdk, -- This configuration is for debugging the flutter application
--       --       program = "${workspaceFolder}/lib/main.dart",
--       --       cwd = vim.fn.getcwd(),
--       --     },
--       --   }
--     },
--   },
-- You can also add new plugins here as well:
-- Add plugins, the lazy syntax
-- "andweeb/presence.nvim",
-- {
--   "ray-x/lsp_signature.nvim",
--   event = "BufRead",
--   config = function()
--     require("lsp_signature").setup()
--   end,
-- },
-- }
