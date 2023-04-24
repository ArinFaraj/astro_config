return {
  "akinsho/flutter-tools.nvim",
  {
    "akinsho/flutter-tools.nvim",
    fvm = true,
    debugger = {
      -- integrate with nvim dap
      enabled = true,
      run_via_dap = true,
      -- register_configuration = function(paths)
      --   require("dap").configurations.dart = {
      --     {
      --       type = "dart",
      --       request = "launch",
      --       name = "Flutter",
      --       dartSdkPath = paths.dart_sdk, -- This configuration is for debugging the flutter application
      --       flutterSdkPath = paths.flutter_sdk, -- This configuration is for debugging the flutter application
      --       program = "${workspaceFolder}/lib/main.dart",
      --       cwd = vim.fn.getcwd(),
      --     },
      --   }
    },
  },
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
}
