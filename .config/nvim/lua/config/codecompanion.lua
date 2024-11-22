return require("codecompanion").setup({
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
  server = {
    url = "127.0.0.1:11434",
  },
  model = "qwen2.5-coder:0.5b",
  opts = {
    log_level = "DEBUG",
  },
  display = {
    diff = {
      provider = "mini_diff",
    },
  },
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        schema = {
          model = {
            default = "qwen2.5-coder:0.5b",
          },
        },
      })
    end,
  },
})
