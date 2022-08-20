local packer = require('packer')

packer.init { auto_reload_compiled = true }
local plugins = packer.startup({ function (use)
  use {
    'lewis6991/impatient.nvim',
    lock = true,
  }

  use {
    'wbthomason/packer.nvim',
    lock = true
  }

  use {
    'nvim-telescope/telescope.nvim',
    module = 'telescope',
    tag = '0.1.0',
    requires = {
      {
        'nvim-lua/plenary.nvim',
        module = 'plenary',
        lock = true,
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        module = 'telescope-fzf-native',
        run = 'make',
        lock = true,
      }
    },
    lock = true,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    module = 'treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    lock = true,
    requires = {
      {
        'p00f/nvim-ts-rainbow',
        as = 'rainbow',
        lock = true,
      },
      {
        'nvim-treesitter/nvim-treesitter-context',
        lock = true,
      },
      {
        'nvim-treesitter/nvim-treesitter-refactor',
        lock = true,
      },
    },
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
      lock = true,
    },
    lock = true,
  }

  use {
    'williamboman/nvim-lsp-installer',
    lock = true,
  }

  use {
    'neovim/nvim-lspconfig',
    lock = true,
  }

  use {
    'hrsh7th/nvim-cmp',
    lock = true,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        lock = true,
      },
      {
        'saadparwaiz1/cmp_luasnip',
        lock = true,
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        lock = true,
      },
      {
        'hrsh7th/cmp-buffer',
        lock = true,
      },
      {
        'hrsh7th/cmp-path',
        lock = true,
      },
      {
        'hrsh7th/cmp-cmdline',
        lock = true,
      },
      {
        'onsails/lspkind.nvim',
        lock = true,
      },
      {
        'hrsh7th/cmp-nvim-lsp-signature-help',
        lock = true
      }
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
      lock = true,
    },
    lock = true,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    lock = true,
  }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    run = ":CatppuccinCompile",
    lock = true,
  }

  use {
    "mcchrish/zenbones.nvim",
    as = "zenbones",
    lock = true,
    requires = { "rktjmp/lush.nvim", lock = true }
  }

  use {
    'kylechui/nvim-surround',
    module = 'surround',
    config = function ()
      require('surround').setup {}
    end,
    lock = true,
  }

  use {
    'luukvbaal/stabilize.nvim',
    module = 'stabilize',
    config = function ()
      require('stabilize').setup {}
    end,
    lock = true,
  }

  use {
    'folke/trouble.nvim',
    module = 'trouble',
    commit = 'da61737d860ddc12f78e638152834487eabf0ee5',
    lock = true,
  }

  use {
    'nanozuki/tabby.nvim',
    module = 'tabby',
    lock = true,
  }

  use {
    'gpanders/editorconfig.nvim',
    module = 'editorconfig',
    lock = true,
  }

  use {
    'mfussenegger/nvim-lint',
    module = 'lint',
    lock = true,
  }

  use {
    'b3nj5m1n/kommentary',
    module = 'kommentary',
    config = function ()
      require('kommentary').setup {}
    end,
    lock = true,
  }

  use {
    'sindrets/diffview.nvim',
    module = 'diffview',
    lock = true,
    requires = {
      { 'nvim-lua/plenary.nvim', lock = true }
    }
  }

  use {
    'tpope/vim-fugitive',
    module = 'fugitive',
    config = function ()
      require('fugitive').setup {}
    end,
    lock = true
  }

  use {
    'lewis6991/gitsigns.nvim',
    module = 'gitsigns',
    lock = true,
  }

  use {
    'stevearc/aerial.nvim',
    module = 'aerial',
    lock = true
  }

  use {
    'ggandor/lightspeed.nvim',
    module = 'lightspeed',
    lock = true,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    module = 'colorizer',
    config = function ()
      require('colorizer').setup {}
    end,
    lock = true
  }

  use {
    'SmiteshP/nvim-navic',
    module = 'navic',
    requires = { 'neovim/nvim-lspconfig', lock = true },
    lock = true,
  }

  use {
    'tiagovla/scope.nvim',
    module = 'scope',
    config = function ()
      require('scope').setup {}
    end,
    lock = true,
  }

  use {
    'TimUntersberger/neogit',
    module = 'neogit',
    confg = function ()
      require('neogit').setup {}
    end,
    lock = true,
    requires = { 'nvim-lua/plenary.nvim', lock = true },
  }

  use {
    'szw/vim-maximizer',
    module = 'maximizer',
    config = function ()
      vim.api.nvim_set_keymap('n', '<Leader>mm', ':MaximizerToggle<cr>', {silent=true, noremap=true})
    end,
    lock = true,
  }

  use {
    "petertriho/nvim-scrollbar",
    lock = true,
    requires = { 'kevinhwang91/nvim-hlslens', lock = true }
  }

  use {
    'rmagatti/goto-preview',
    module = 'goto-preview',
    lock = true,
  }

  use {
    'chaoren/vim-wordmotion',
    module = 'wordmotion',
    lock = true
  }

  use {
    'mg979/vim-visual-multi',
    module = 'visual-multi',
    lock = true,
  }

  use {
    'sainnhe/sonokai',
    module = 'sonokai',
    lock = true,
  }

  use {
    'sainnhe/gruvbox-material',
    modules = 'gruvbox',
    lock = true,
  }

  use {
    'rebelot/kanagawa.nvim',
    module = 'kanagawa',
    lock = true,
  }

  use {
    'folke/twilight.nvim',
    module = 'twilight',
    lock = true,
  }

  use {
    'projekt0n/github-nvim-theme',
    lock = true,
  }

  use {
    'ayu-theme/ayu-vim',
    module = 'ayu',
    lock = true,
  }

  use {
    'nvim-treesitter/playground',
    module = 'playground',
    lock = true,
  }
end,
config = {
  auto_clean = true,
  compile_on_sync = true,
  ensure_dependencies = true,
  display = { open_cmd = "vnew \\[packer\\]" },
  profile = { enable = false }
}})

return plugins
