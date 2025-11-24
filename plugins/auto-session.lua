return {
  {
    "rmagatti/auto-session",
    lazy = false,
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/" },
      
      bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard" },
      
      enabled = true,
      auto_save = true,
      auto_restore = true,
      auto_create = true,
      
      git_use_branch_name = true,
      
      pre_save_cmds = {
        function()
          vim.cmd("NvimTreeClose")
        end,
      },
      
      post_restore_cmds = {
        function()
          local ok, nvim_tree_api = pcall(require, "nvim-tree.api")
          if ok then
            nvim_tree_api.tree.change_root(vim.fn.getcwd())
          end
        end,
      },
    },
  },
}

