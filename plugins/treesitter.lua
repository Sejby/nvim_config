return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "prisma",
        "javascript",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "lua",
        "dart",
        "php",
        "c",
        "cpp",
        "java",
        "c_sharp",
      },
      highlight = {
        enable = true,
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
}
