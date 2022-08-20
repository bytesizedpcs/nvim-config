local opt = vim.opt
local g = vim.g

g.mapLeader = " "
opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

opt.fillchars = { eob = " " }
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
opt.foldmethod = 'marker'
opt.cmdheight = 2
opt.shortmess = 'c'
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wrap = false
opt.splitbelow  = true
opt.splitright = true
opt.foldnestmax = 10
opt.foldenable = false
opt.foldlevel = 2
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
