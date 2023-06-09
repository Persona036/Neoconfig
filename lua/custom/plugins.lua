local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {"windwp/nvim-ts-autotag"},
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ggandor/flit.nvim",
    keys = function()

      local ret = {}

      for _, key in ipairs({"f", "F", "t", "T"}) do 
        ret[#ret + 1] = {key, mode = {"n", "x", "o"}, des = key}
      end
      return ret
    end,
    opts = {labeled_modes = "nx"},
  },
  {"ggandor/leap.nvim"},
{
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

    {
    "zbirenbaum/copilot.lua",
    -- Lazy load when event occurs. Events are triggered
    -- as mentioned in:
    -- https://vi.stackexchange.com/a/4495/20389
    event = "InsertEnter",
    suggestion = {enabled = false},
    panel = {enabled = false},
    -- You can also have it load at immediately at
    -- startup by commenting above and uncommenting below:
    lazy = false,
    opts = overrides.copilot,
  },

   {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  lazy=false,
  config = function ()
    require("copilot_cmp").setup()
  end
  },

  {"MunifTanjim/prettier.nvim",
  lazy=false,
  },

  {"windwp/nvim-ts-autotag",
   event = "InsertEnter",
  config = function ()
  require("nvim-ts-autotag").setup()
    end,
  },
  
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },
}

return plugins
