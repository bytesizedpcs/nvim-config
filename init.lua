local opt = vim.opt
local g = vim.g
local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local fn = vim.fn

Icons = {
  left_triangle_down = '',
  right_triangle_down = '',
  left_slant_line = '╲',
  right_slant_line = '╱',
  left_triangle_up = '',
  right_triangle_up = '',
  left_semi_circle = '',
  right_semi_circle = '',
  left_circle_line = '',
  right_circle_line = '',
  skinny_block = '▐',
  thick_blokc = '█',
  checkmark = '✓',
  right_arrow = '➜',
  x_mark = '✗',
  dot = '•',
  border = {
    sharp = {
      top_right = "┐",
      bottom_right = "┘",
      bottom_left = "└",
    },
    round = {
      top_left= "╭",
      top_right = "╮",
      bottom_right = "╯",
      bottom_left = "╰"
    },
  },
}

_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}
local impatient_ok, impatient = pcall(require, 'impatient')
if impatient_ok then
  impatient.enable_profile()
end

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess = "sI"

opt.splitbelow = true
opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 500
opt.undofile = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

opt.ai = true
opt.hlsearch = true
opt.ruler = true
opt.path = { '**' }
opt.wildmenu = true
-- opt.wildcharm = '<Tab>'
opt.wildignore:append('**/node_modules/**')
opt.cmdheight = 2
opt.shortmess = 'c'
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wrap = false
opt.splitbelow  = true
opt.splitright = true
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldmethod = 'manual'
opt.foldcolumn = '1'
opt.foldnestmax = 0
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.listchars = {
  tab = '>·',
  trail = '¬'
}
opt.list = true
-- Lightline bufferline
opt.showtabline = 2
-- Make it so scrolling doesn't hit bottom
opt.scrolloff = 10

-- ctag config
opt.tags = { "./tags", "tags;$HOME" }

opt.laststatus = 2
opt.showmode = false
opt.hidden = true
opt.signcolumn = "yes:2"

-- gitgutter hanging
opt.updatetime = 100

g.mapLeader = " "

local packerOkay, packer = pcall(require, 'packer')
if packerOkay then
  -- for catppuccin auto compile
  packer.init { auto_reload_compiled = true }
  packer.startup(function(use)
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
      tag = '0.1.0',
      requires = {
        {
          'nvim-lua/plenary.nvim',
          lock = true,
        },
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',
          lock = true,
        }
      },
      lock = true,
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
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
      lock = true,
    }

    use {
      "luukvbaal/stabilize.nvim",
      lock = true,
    }

    use {
      'folke/trouble.nvim',
      commit = 'da61737d860ddc12f78e638152834487eabf0ee5',
      lock = true,
    }

    use {
      'gpanders/editorconfig.nvim',
      lock = true,
    }

    use {
      'mfussenegger/nvim-lint',
      lock = true,
    }

    use {
      'b3nj5m1n/kommentary',
      lock = true,
    }

    use {
      'sindrets/diffview.nvim',
      lock = true,
      requires = {
        { 'nvim-lua/plenary.nvim', lock = true }
      }
    }

    use {
      'tpope/vim-fugitive',
      lock = true
    }

    use {
      'lewis6991/gitsigns.nvim',
      lock = true,
    }

    use {
      'stevearc/aerial.nvim',
      lock = true
    }

    use {
      'ggandor/lightspeed.nvim',
      lock = true,
    }

    use {
      'norcalli/nvim-colorizer.lua',
      lock = true
    }

    use {
      'SmiteshP/nvim-navic',
      requires = { 'neovim/nvim-lspconfig', lock = true },
      lock = true,
    }

    use {
      'TimUntersberger/neogit',
      lock = true,
      requires = { 'nvim-lua/plenary.nvim', lock = true }
    }

    use {
      'szw/vim-maximizer',
      lock = true,
    }

    use {
      "petertriho/nvim-scrollbar",
      lock = true,
      requires = { 'kevinhwang91/nvim-hlslens', lock = true }
    }

    use {
      'rmagatti/goto-preview',
      lock = true,
    }

    use {
      'chaoren/vim-wordmotion',
      lock = true
    }

    use {
      'rebelot/kanagawa.nvim',
      lock = true,
    }

    use {
      'folke/twilight.nvim',
      lock = true,
    }

    use {
      'nvim-treesitter/playground',
      lock = true,
    }

    use {
      'RRethy/vim-illuminate',
      lock = true,
    }

    use {
      'nanozuki/tabby.nvim',
      lock = true,
    }

    use {
      'm-demare/hlargs.nvim',
      lock = true,
    }

    use {
      'kevinhwang91/nvim-ufo',
      lock = true,
      requires = {
        'kevinhwang91/promise-async',
        lock = true,
      }
    }

    use {
      'windwp/nvim-autopairs',
      lock = true,
    }

    use {
      'lewis6991/spellsitter.nvim',
      lock = true,
    }

    use {
      'chentoast/marks.nvim',
      lock = true,
    }

    if Packer_Bootstrap then
      require('packer').sync()
    end
  end)
end

-- wordmotion
vim.cmd([[
  let g:wordmotion_uppercase_spaces = ['[', ']', '{', '}', '(', ')', ',', '.']
]])

local marks = (function ()
  local ok, marks = pcall(require, 'marks')
  if ok then
    marks.setup()
    return marks
  end
  return nil
end)()

local spellsitter_ok, spellsitter = pcall(require, spellsitter)
if spellsitter_ok then
  spellsitter.setup()
end

local pairs_ok, autopairs = pcall(require, 'nvim-autopairs')
if pairs_ok then
  autopairs.setup()
end

local illum_ok, illuminate = pcall(require, 'illuminate')
if illum_ok then
  illuminate.configure({
    filetypes_denylist = { 'nvim_tree', 'nvim-tree', 'NvimTree', },
  })
end
vim.cmd([[
  augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi link illuminatedWord CursorLine
  augroup END
  augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
  augroup END
]])

local twilight_ok, twilight = pcall(require, 'twilight')
if twilight_ok then
  twilight.setup{
    context = 0, -- amount of lines we will try to show around the current line
    expand = nil,
  }
end

-- Default options:
local kanagawa_ok, kanagawa = pcall(require, 'kanagawa')
if kanagawa_ok then
  kanagawa.setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { },
    keywordStyle = {},
    statementStyle = {},
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
  })
end

local goto_ok, preview = pcall(require, 'goto-preview')
if goto_ok then
  preview.setup {
    width = 120, -- Width of the floating window
    height = 15, -- Height of the floating window
    border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}, -- Border characters of the floating window
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    default_mappings = false, -- Bind default mappings
    debug = false, -- Print debug information
    opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
    resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
    post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
    -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
    focus_on_open = true, -- Focus the floating window when opening it.
    dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
    force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
    bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
  }
  vim.cmd([[
    nnoremap <Leader>pd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
    nnoremap <Leader>pt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
    nnoremap <Leader>pi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
    nnoremap <Leader>P <cmd>lua require('goto-preview').close_all_win()<CR>
    nnoremap <Leader>pr <cmd>lua require('goto-preview').goto_preview_references()<CR>
  ]])
end

local hls_ok, hlslens = pcall(require, 'hlslens')
if hls_ok then
  local kopts = {noremap = true, silent = true}

  vim.api.nvim_set_keymap('n', 'n',
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts)
  vim.api.nvim_set_keymap('n', 'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts)
  vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
end

local scrollbar_ok, scrollbar = pcall(require, 'scrollbar')
if scrollbar_ok then
  require("scrollbar.handlers.search").setup()
  local colors = require("catppuccin.palettes").get_palette()
  scrollbar.setup({
    show_in_active_only = true,
    marks = {
      Search = {
        text = { '?', '?' },
      },
      Error = {
        text = { Icons.dot, ':' },
      },
      Warn = {
        text = { Icons.dot, ':' },
      },
      Info = {
        text = { Icons.dot, ':' },
      },
      Hint = {
        text = { Icons.dot, ':' },
      },
      Misc = {
        text = { Icons.dot, ':' },
      },
    },
    handlers = {
      search = true,
    },
  })
end

keymap('n', '<Leader>mm', ':MaximizerToggle<cr>', {silent=true, noremap=true})

local scope_ok, scope = pcall(require, 'scope')
if scope_ok then
  scope.setup()
end

local colorizer_ok, colorizer = pcall(require, 'nvim-colorizer')
if colorizer_ok then
  colorizer.setup {}
end

local fugitive_ok, fugitive = pcall(require, 'vim-fugitive')
if fugitive_ok then
  fugitive.setup {}
end

local aerial_ok, aerial = pcall(require, 'aerial')
if aerial_ok then
  aerial.setup {
    backends = { "lsp", "treesitter", "markdown" },
    highlight_on_hover = true,
    show_guides = true,
  }
  keymap('n', '<leader>a', ':AerialToggle<CR>', {silent = true, noremap = true})
end

local signs_ok, gitsigns = pcall(require, 'gitsigns')
if signs_ok then
  gitsigns.setup {
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    linehl = false,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 2000,
      ignore_whitespace = false,
    },
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
          opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      -- Navigation
      map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
      map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

      -- Actions
      map('n', '<leader>ss', ':Gitsigns stage_hunk<CR>')
      map('v', '<leader>ss', ':Gitsigns stage_hunk<CR>')
      map('n', '<leader>sr', ':Gitsigns reset_hunk<CR>')
      map('v', '<leader>sr', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>sS', '<cmd>Gitsigns stage_buffer<CR>')
      map('n', '<leader>su', '<cmd>Gitsigns undo_stage_hunk<CR>')
      map('n', '<leader>sR', '<cmd>Gitsigns reset_buffer<CR>')
      map('n', '<leader>sp', '<cmd>Gitsigns preview_hunk<CR>')
      map('n', '<leader>sd', '<cmd>Gitsigns diffthis<CR>')
      map('n', '<leader>sD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      map('n', '<leader>sd', '<cmd>Gitsigns toggle_deleted<CR>')

      -- Text object
      map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
  }
end

local light_ok, lightspeed = pcall(require, 'lightspeed')
if light_ok then
  lightspeed.setup {}

  keymap('n', 's', '<Plug>Lightspeed_s', {silent=true,})
  keymap('n', 'S', '<Plug>Lightspeed_S', {silent=true,})
  keymap('n', 'x', '<Plug>Lightspeed_x', {silent=true,})
  keymap('n', 'X', '<Plug>Lightspeed_X', {silent=true,})
  keymap('n', 'f', '<Plug>Lightspeed_f', {silent=true,})
  keymap('n', 'F', '<Plug>Lightspeed_F', {silent=true,})
  keymap('n', 't', '<Plug>Lightspeed_t', {silent=true,})
  keymap('n', 'T', '<Plug>Lightspeed_T', {silent=true,})
end

local neogit_ok, neogit = pcall(require, 'neogit')
if neogit_ok then
  neogit.setup {}
end

local diff_ok, diffview = pcall(require, 'diffview')
local diffstatus = false
if diff_ok then
  diffview.setup {}
  keymap('n', '<Leader>d', '', {
    silent = true,
    noremap = true,
    callback = function()
      if not diffstatus then
        vim.cmd(':DiffviewOpen')
        diffstatus = true
      else
        vim.cmd(':DiffviewClose')
        diffstatus = false
      end
    end
  })
end

local kommentary_ok, kommentary = pcall(require, 'kommentary.config')
if kommentary_ok then
  kommentary.setup {}
end

local cmp_ok, cmp = pcall(require, 'cmp')
local snip_ok, luasnip = pcall(require, 'luasnip')
local kind_ok, lspkind = pcall(require, 'lspkind')
if cmp_ok and snip_ok and kind_ok then
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    fortmatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      })
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-j>'] = cmp.mapping.scroll_docs(-4),
      ['<C-k>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['C-e'] = cmp.mapping.abort(),
      ['<Esc>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.abort()
        end
        fallback()
      end, {'n', 'i'}),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'n', "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'n', "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'nvim_lsp_signature_help' },
    }, {
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

local stab_ok, stabilize = pcall(require, 'stabilize')
if stab_ok then
  stabilize.setup()
end

local surround_ok, surround = pcall(require, 'nvim-surround')
if surround_ok then
  surround.setup {}
end

local trouble_ok, trouble = pcall(require, 'trouble')
if trouble_ok then
  trouble.setup {
    auto_fold = true,
    auto_jump = { },
  }
  -- Lua
  --[[ vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>TroubleToggle lsp_definitions<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>TroubleToggle lsp_type_definitions<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>TroubleToggle lsp_references<cr>",
    {silent = true, noremap = true}
  ) ]]
  vim.api.nvim_set_keymap("n", "<leader>xew", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>xed", "<cmd>Trouble document_diagnostics<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    {silent = true, noremap = true}
  )
end

local servers = { "eslint", "bashls", "cssls", "html", "tsserver", "vuels", "sumneko_lua" }
local inst_ok, installer = pcall(require, 'nvim-lsp-installer')
if inst_ok then
  installer.setup {
    automatic_installation = true,
    ensure_installed = servers,
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  }
end

local ufo_ok, ufo = pcall(require, 'ufo')
if ufo_ok then
  vim.keymap.set('n', 'zR', ufo.openAllFolds)
  vim.keymap.set('n', 'zM', ufo.closeAllFolds)
  vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
  vim.keymap.set('n', 'zm', ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
  vim.keymap.set('n', 'K', function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end)
  ufo.setup({
    preview = {
      win_config = {
        winhighlight = 'Normal:Normal',
      },
    },
  })
end

local ll_ok, lualine = pcall(require, 'lualine')
local navic_ok, navic = pcall(require, 'nvim-navic')
if ll_ok then
  for i = 1,9 do
    keymap('n', ('<Leader>%s'):format(i), (':LualineBuffersJump %s<CR>'):format(i), { noremap = true, silent = true })
  end

  lualine.setup {
    options = {
      disabled_filetypes = { },
      section_separators = { left = Icons.left_triangle_down, right = Icons.right_triangle_down },
      component_separators = { left = Icons.left_slant_line, right = Icons.right_slant_line },
      globalstatus = false,
    },
    sections = {
      lualine_b = {
        'branch',
        'diff',
        {
          'diagnostics',
          always_visible = true,
          colored = (Colorscheme ~= 'gruvbox-material'),
        }
      },
      lualine_c = {
        { navic.get_location, cond = navic.is_available },
      }
    },
    extensions = {
      'nvim-tree',
      'symbols-outline',
      'aerial'
    },
  }
end

local bl_ok, bl = pcall(require, 'indent-blankline')
if bl_ok then
  bl.setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  }
end

local tree_ok, nvimtree = pcall(require, 'nvim-tree')
if tree_ok then
  nvimtree.setup({
    disable_netrw = true,
    hijack_netrw = false,
    view = {
      adaptive_size = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    git = {
      ignore = true,
    },
  })
end

local ts_okay, treesitter = pcall(require, 'nvim-treesitter.configs')
if ts_okay then
  treesitter.setup({
    auto_install = true,
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    highlight = {
      enable = true,
      disable = function(lang, bufnr)
        return lang == 'javascript' and vim.api.nvim_buf_line_count(bufnr) > 1000
      end,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  })
end

local tele_ok, telescope = pcall(require, 'telescope')
if tele_ok then
  telescope.setup {
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  }
  pcall(telescope.load_extension, 'fzf')
end

local lsp_ok, lspconfig = pcall(require, 'lspconfig')
if lsp_ok then
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>h', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, bufopts)
    --vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<Leader>gk', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<Leader>gs', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>gfa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>gfr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>gfl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    --vim.keymap.set('n', '<Leader>gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>grn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ga', vim.lsp.buf.code_action, bufopts)
    --vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>gf', vim.lsp.buf.formatting, bufopts)

    if vim.g.logging_level == 'debug' then
      local msg = string.format("Language server %s started!", client.name)
      vim.notify(msg, 'info', {title = 'Nvim-config'})
    end
  end

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }
  local capabilities
  local cmp_lsp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
  if cmp_lsp_ok then
    capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  end
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Disable virtual_text
            virtual_text = false,
          }
        ),
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
          focusable = false,
          source = 'always',
        })
      },
      on_attach = function(client, bufnr)
        print(vim.inspect(server))
        on_attach(client, bufnr)
        if (server ~= "eslint") then
          navic.attach(client, bufnr)
        end
        aerial.on_attach(client, bufnr)
      end,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  end
end

local cat_ok, catppuccin = pcall(require, 'catppuccin')
if cat_ok then
  catppuccin.setup({
    compile = {
      enabled = true,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
    },
    dim_inactive = {
      enable = true,
      shade = 'dark',
      percentage = 0.15
    },
    styles = {
      comments = { 'italic' },
      conditionals = { 'bold' },
      loops = { 'italic' },
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = { 'italic' },
      operators = {},
    },
    integrations = {
      native_lsp = {
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true
      },
      lightspeed = true,
    }
  })
end

vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha
vim.g.zenwritten_solid_line_nr = true
vim.g.zenwritten_darken_comments = 45
vim.g.zenwritten_darken_non_text = 45
vim.g.vimbones = {
  lightness = 'dim',
}

Colorscheme = 'vimbones'
vim.cmd(string.format([[
  set background=light
  let g:gruvbox_material_foreground = 'material'
  let g:gruvbox_material_background = 'medium'
  let g:sonokai_style = 'shusia'
  let g:sonokai_better_performance = 1
  let g:ayucolor = "mirage"
  colorscheme %s
]], Colorscheme))

local palette = require("catppuccin.palettes").get_palette(vim.g.catppuccin_flavour)

vim.cmd(string.format('hi default UfoFoldedBg guibg=%s', palette.base))

local ok, hl = pcall(vim.api.nvim_get_hl_by_name, 'Normal', opt.termguicolors)
local hlargs_ok, hlargs = pcall(require, 'hlargs')
if hlargs_ok then
  hlargs.setup {
    -- color = palette.red,
    highlight = { underline=true, italic=true, fg=hl.foreground, bg=hl.background },
  }
end

local normal_hl = vim.api.nvim_get_hl_by_name('Normal', opt.termguicolors)
local lln_hl = vim.api.nvim_get_hl_by_name('lualine_c_normal', opt.termguicolors)
local cursor_line_hl = vim.api.nvim_get_hl_by_name('CursorLine', opt.termguicolors)
local normal_bg, normal_fg, lln_bg
normal_fg = tostring(normal_hl.foreground)
normal_bg = tostring(normal_hl.background)
lln_bg = tostring(lln_hl.background)
cursorline_bg = tostring(cursor_line_hl.background)
print (normal_fg, normal_bg, lln_bg)

local tabby_ok, tabby = pcall(require, 'tabby')
if tabby_ok then
  local filename = require('tabby.filename')
  local cwd = function()
    return ' ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' '
  end
  local tabname = function(tabid)
    return ' ' .. vim.api.nvim_tabpage_get_number(tabid)
  end
  local line = {
    hl = { },
    layout = 'active_wins_at_tail',
    head = {
      { cwd, hl = {} },
      { '', hl = {} },
    },
    active_tab = {
      label = function(tabid)
        return {
          tabname(tabid) .. ' ',
          hl = { style = 'bold' },
        }
      end,
      left_sep = { '', hl = {} },
      right_sep = { '', hl = {} },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          tabname(tabid) .. ' ',
          hl = { style = 'bold' },
        }
      end,
    },
    top_win = {
      label = function(winid)
        return {
          ' ' .. filename.unique(winid) .. ' ',
          hl = {},
        }
      end,
      left_sep = { '', hl = {} },
      right_sep = { '', hl = {} },
    },
    win = {
      label = function(winid)
        return {
          ' ' .. filename.unique(winid) .. ' ',
          hl = {},
        }
      end,
    },
    tail = {
      { '', hl = {} },
      { '  ', hl = {} },
    },
  }
  tabby.setup({
    tabline = line,
  })
end

keymap('', '<Space>', '<Leader>', {})
keymap('', 'j', 'gj', { silent = true })
keymap('', 'k', 'gk', { silent = true })

keymap('n', 'K', '<Esc>10<up>', { noremap=true})
keymap('n', 'J', '<Esc>10<down>', { noremap=true})
keymap('n', 'H', '<Esc>0', { noremap=true})
keymap('n', 'L', '<Esc>$', { noremap=true})
keymap('v', 'K', '5<up>', { noremap=true})
keymap('v', 'J', '5<down>', { noremap=true})
keymap('v', 'H', '0', { noremap=true})
keymap('v', 'L', '$<Paste>', { noremap=true})

keymap('n', '<C-h>', '<C-w>h', {silent=true, noremap=true})
keymap('n', '<C-j>', '<C-w>j', {silent=true, noremap=true})
keymap('n', '<C-k>', '<C-w>k', {silent=true, noremap=true})
keymap('n', '<C-l>', '<C-w>l', {silent=true, noremap=true})
keymap('v', '<C-h>', '<C-w>h', {silent=true, noremap=true})
keymap('v', '<C-j>', '<C-w>j', {silent=true, noremap=true})
keymap('v', '<C-k>', '<C-w>k', {silent=true, noremap=true})
keymap('v', '<C-l>', '<C-w>l', {silent=true, noremap=true})

keymap('n', '<Leader>e', ':NvimTreeToggle <CR>', { noremap=true, silent=true })
keymap('n', '<Leader>f', ':NvimTreeFindFile <CR>', { noremap=true, silent=true })

keymap('n', '<C-p>', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.find_files()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<C-f>', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.current_buffer_fuzzy_find()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<Leader>rg', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.live_grep()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<Leader>l', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.buffers()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<Leader>th', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.help_tags()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<Leader>ts', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.lsp_document_symbols()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<Leader>gr', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.lsp_references()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<Leader>gd', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.lsp_definitions()
    end
  end,
  silent=true,
  noremap=true
})

keymap('n', '<Leader>gt', '', {
  callback=function()
    local okay, builtin = pcall(require, 'telescope.builtin')
    if okay then
      builtin.lsp_type_definitions()
    end
  end,
  silent=true,
  noremap=true
})

local function delete_buffer()
  local buflisted = fn.getbufinfo({buflisted = 1})
  local cur_winnr, cur_bufnr = fn.winnr(), fn.bufnr()
  if #buflisted < 2 then vim.cmd 'confirm qall' return end
  for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
    vim.cmd(string.format('%d wincmd w', fn.win_id2win(winid)))
    vim.cmd(cur_bufnr == buflisted[#buflisted].bufnr and 'bp' or 'bn')
  end
  vim.cmd(string.format('%d wincmd w', cur_winnr))
  local is_terminal = fn.getbufvar(cur_bufnr, '&buftype') == 'terminal'
  vim.cmd(is_terminal and 'bd! #' or 'silent! confirm bd #')
end

keymap('n', '<Leader>q', '', { callback=delete_buffer, silent=true, noremap=true })

function Close_Windows_And_Floats()
  local this_win = vim.fn.win_getid()
  -- close all floating windows that are relative to the current one
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local win_config = vim.api.nvim_win_get_config(win)
    -- If the mapping doesn't close enough windows, use the following line instead:
    -- if win_config.relative ~= "" then
    if win_config.relative == "win" and win_config.win == this_win then
      vim.api.nvim_win_close(win, false)
    end
  end
  -- close current window
  vim.cmd("quit")
end

-- setting specfic tabs for specific file types
autocmd("FileType", {
  pattern = { "python","go","java","swift" },
  command = "setlocal shiftwidth=4 softtabstop=4 expandtab"
})

autocmd("FileType", {
  pattern="javascript",
  command="setlocal suffixesadd+=.js"
})

-- disable automatic comments
autocmd("FileType", {
  pattern="*",
  command="setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

-- " Trigger `autoread` when files changes on disk
-- " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
local reloadGroup = augroup("ReloadGroup", { clear = true })
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = reloadGroup,
  pattern="*",
  command="if mode() != 'c' | checktime | endif"
})
-- " Notification after file change
-- " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd("FileChangedShellPost", {
  group = reloadGroup,
  pattern="*",
  command="echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None | :TSBufToggle rainbow <CR>"
})

-- number and cursor line toggle
local numberToggleGroup = augroup("NumberToggle", { clear = true })
autocmd({ "BufEnter","FocusGained","InsertLeave" }, {
  pattern="*",
  command="set relativenumber",
  group=numberToggleGroup
})
autocmd({ "BufEnter","FocusGained","InsertLeave" }, {
  pattern="*",
  command="set cursorline",
  group=numberToggleGroup
})
autocmd({ "BufLeave","FocusLost","InsertEnter" }, {
  pattern="*",
  command="set norelativenumber",
  group=numberToggleGroup
})
autocmd({ "BufLeave","FocusLost","InsertEnter" }, {
  pattern="*",
  command="set cursorline",
  group=numberToggleGroup
})

autocmd("TermOpen", { pattern="*", command="set signcolumn = no", group=numberToggleGroup })

vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

vim.fn.sign_define("DiagnosticSignError", { text="", linehl="", texthl="", numhl="DiagnosticError" })
vim.fn.sign_define("DiagnosticSignHint", { text="", linehl="", texthl="", numhl="DiagnosticHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text="", linehl="", texthl="", numhl="DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignWarn", { text="", linehl="", texthl="", numhl="DiagnosticWarn" })

-- Create an autocmd User PackerCompileDone to update it every time packer is compiled
--[[ local CompileGroup = augroup("CompileGroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = CompileGroup,
  pattern = "PackerCompileDone",
  callback = function()
    vim.cmd "CatppuccinCompile"
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = CompileGroup,
  pattern = "init.lua",
  callback = function ()
    vim.cmd('source <afile> | PackerCompile')
    vim.defer_fn(function ()
      vim.cmd('source $NVIM/init.lua')
    end, 2000)
  end,
}) ]]

keymap('n', '<Leader>c', ':let @/ = ""<cr>', { silent=true, noremap=true })

-- Create a custom namespace. This will aggregate signs from all other
-- namespaces and only show the one with the highest severity on a
-- given line
local ns = vim.api.nvim_create_namespace("my_namespace")

-- Get a reference to the original signs handler
local orig_signs_handler = vim.diagnostic.handlers.signs

-- Override the built-in signs handler
vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, _, opts)
    -- Get all diagnostics from the whole buffer rather than just the
    -- diagnostics passed to the handler
    local diagnostics = vim.diagnostic.get(bufnr)

    -- Find the "worst" diagnostic per line
    local max_severity_per_line = {}
    for _, d in pairs(diagnostics) do
      local m = max_severity_per_line[d.lnum]
      if not m or d.severity < m.severity then
        max_severity_per_line[d.lnum] = d
      end
    end

    -- Pass the filtered diagnostics (with our custom namespace) to
    -- the original handler
    local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
    orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
  end,
  hide = function(_, bufnr)
    orig_signs_handler.hide(ns, bufnr)
  end,
}

local lint_group = augroup("LintGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = lint_group,
  callback = function()
    local lint_ok, lint = pcall(require, 'lint')
    if lint_ok then
      lint.try_lint()
    end
  end,
})

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  focusable = false,
  source = 'always',
})

vim.diagnostic.config({
  float = {
    border = 'rounded',
    focusable = false,
    source = 'always',
  }
})

