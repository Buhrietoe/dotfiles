return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    { "echasnovski/mini.diff", version = "*" },
  },
  config = function()
    require("codecompanion").setup({
      completion = {
        enabled_providers = { "codecompanion" },
      },
      providers = {
        codecompanion = {
          name = "CodeCompanion",
          module = "codecompanion.providers.completion.blink",
          enabled = true,
        },
      },
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
        agent = {
          adapter = "ollama",
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "ollama",
            schema = {
              num_ctx = {
                default = 32768,
              },
              model = {
                default = "qwen2.5-coder:1.5b",
              },
            },
            env = {
              url = "http://127.0.0.1:11434",
              api_key = "NONE",
            },
          })
        end,
      },
      opts = {
        log_level = "DEBUG",
      },
      display = {
        diff = {
          provider = "mini_diff",
        },
      },
    })
  end,
}
