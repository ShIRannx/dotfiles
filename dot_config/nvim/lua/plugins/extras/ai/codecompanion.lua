return {
  {
    "olimorris/codecompanion.nvim",
    keys = {
      { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" } },
      { "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" } },
    },
    opts = {
      interactions = {
        cli = {
          agent = "codex",
          agents = {
            claude_code = {
              cmd = "claude",
              args = {},
              description = "Claude Code CLI",
            },
            gemini = {
              cmd = "gemini",
              args = {},
              description = "Gemini Code CLI",
            },
            codex = {
              cmd = "codex",
              args = {},
              description = "OpenAI Codex CLI",
            },
          },
        },
        chat = {
          adapter = "codex",
          keymaps = {
            close = {
              modes = { n = "gq", i = "gq" },
              opts = {},
            },
            -- Add further custom keymaps here
          },
        },
        inline = {
          adapter = "codex",
        },
        cmd = {
          adapter = "codex",
        },
      },
      adapters = {
        acp = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
              defaults = {
                auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
              },
              env = {
                GEMINI_API_KEY = "",
              },
            })
          end,
          codex = function()
            return require("codecompanion.adapters").extend("codex", {
              defaults = {
                auth_method = "chatgpt", -- "openai-api-key"|"codex-api-key"|"chatgpt"
              },
            })
          end,
        },
        http = {
          dashscope = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://coding.dashscope.aliyuncs.com",
                api_key = "DASHSCOPE_API_KEY",
                chat_url = "/v1/chat/completions", -- optional: default value, override if differen0
              },
              schema = {
                model = {
                  default = "qwen3-coder-plus",
                  choices = {
                    ["glm-5"] = {},
                    ["qwen3.5-plus"] = {},
                    ["qwen3-coder-plus"] = {},
                  },
                },
              },
            })
          end,
          wangsu = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://aigateway.edgecloudapp.com", -- optional: default value is ollama url http://127.0.0.1:11434
                api_key = "WANGSU_API_KEY", -- optional: if your endpoint is authenticated
                chat_url = "/v1/dd49a827f86db98f499afcb77642ca6b/aicenter_gpt_chat", -- optional: default value, override if different
              },
              schema = {
                model = {
                  default = "gpt-5.3-codex", -- define llm model to be used
                },
              },
            })
          end,
          openrouter = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://openrouter.ai/api", -- optional: default value is ollama url http://127.0.0.1:11434
                api_key = "OPENROUTER_API_KEY", -- optional: if your endpoint is authenticated
                chat_url = "/v1/chat/completions", -- optional: default value, override if different
              },
              schema = {
                model = {
                  default = "openai/gpt-5.3-codex", -- define llm model to be used
                },
              },
            })
          end,
        },
      },
      extensions = {
        history = {
          enabled = true,
        },
        agentskills = {
          opts = {
            paths = {
              { "~/.claude/skills" },
              { "~/.codex/skills" },
            },
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "cairijun/codecompanion-agentskills.nvim",
      "ravitemer/codecompanion-history.nvim",
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
}
