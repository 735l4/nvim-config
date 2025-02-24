return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
        "lua-language-server",
        "eslint-lsp",
  			"typescript-language-server",
        "phpactor",
        "intelephense",
        "emmet-ls",
        "gopls",
  		},
  	},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
      require("nvchad.configs.lspconfig").defaults()
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "configs.lint"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function ()
      require("telescope").setup {
        file_ignore_patterns = {
            "node_modules",
        }
      }
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {}
    end
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  --     ensure_installed = {
  --       "vim", "lua", "vimdoc",
  --       "html", "css",
  --       'javascript',
  --       "typescript",
  --       "dart",
  --       "php",
  --       "tsx",
  --       "dockerfile",
  --       "markdown",
  --       "yaml",
  --       "json"
  --     },
  -- 	},
  -- },
{
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure required parsers are installed, including Blade
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "vim", "lua", "vimdoc", "html", "css",
        "javascript", "typescript", "dart",
        "php", "tsx", "dockerfile", "markdown",
        "yaml", "json", "blade",
      })

      -- Enable Treesitter highlighting
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }

      -- Configure the custom Blade parser
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      -- Add custom filetype mapping for Blade
      vim.filetype.add({
        extension = {
          blade = "blade",
        },
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
{
  "tpope/vim-fugitive",
  lazy=false
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter"
    },
    config = function ()
      require("Comment").setup {
        pre_hook = function()
          return vim.bo.commentstring
        end
      }
    end
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    opts = {},
    config = true,
  }

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
