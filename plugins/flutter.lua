return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = true,
            project_config = false,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
        flutter_path = nil,
        flutter_lookup_cmd = nil,
        root_patterns = { ".git", "pubspec.yaml" },
        fvm = false,
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "Comment",
          prefix = "// ",
          enabled = true,
        },
        dev_log = {
          enabled = true,
          notify_errors = false,
          open_cmd = "tabedit",
        },
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        lsp = {
          color = {
            enabled = true,
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          on_attach = function(_, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>fa", "<cmd>FlutterRun<cr>", bufopts)
            vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", bufopts)
            vim.keymap.set("n", "<leader>fr", "<cmd>FlutterReload<cr>", bufopts)
            vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", bufopts)
            vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", bufopts)
            vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", bufopts)
            vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", bufopts)
            vim.keymap.set("n", "<leader>ft", "<cmd>FlutterDevTools<cr>", bufopts)
            vim.keymap.set("n", "<leader>fc", "<cmd>FlutterCopyProfilerUrl<cr>", bufopts)
            vim.keymap.set("n", "<leader>fl", "<cmd>FlutterLspRestart<cr>", bufopts)
          end,
          capabilities = function(config)
            config.specificThingIDontWant = false
            return config
          end,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
              vim.fn.expand("$HOME/.pub-cache"),
              vim.fn.expand("$HOME/tools/flutter"),
            },
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      })
    end,
  },
}

