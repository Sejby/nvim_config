return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      debug = false,
      window = {
        layout = "vertical",
        width = 0.4,
      },
    },
    keys = {
      {
        "<leader>cc",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat",
      },
      {
        "<leader>cx",
        function()
          require("CopilotChat").reset()
        end,
        desc = "Clear Copilot Chat",
      },
      {
        "<leader>cq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Copilot Quick Chat",
      },
    },
  },
}

