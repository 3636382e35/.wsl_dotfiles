vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
-- vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.ignorecase = true
-- vim.cmd [[

--    augroup ilikecursorline
--       autocmd VimEnter * :highlight CursorLine guibg=#282a2e
--    augroup END

-- ]]

vim.cmd([[ autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
---local ft = require('Comment.ft')

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

local highlight = {"RainbowRed"}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

require('colorizer').setup {
  user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false, -- Enable tailwind colors
        -- parsers can contain values used in juser_default_options|
        sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false
      },
}
-- scroll smooth
-- require('neoscroll').setup({
--     -- All these keys will be mapped to their corresponding default scrolling animation
--     mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
--                 '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
--     hide_cursor = true,          -- Hide cursor while scrolling
--     stop_eof = true,             -- Stop at <EOF> when scrolling downwards
--     respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
--     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
--     easing_function = nil,       -- Default easing function
--     pre_hook = nil,              -- Function to run before the scrolling animation starts
--     post_hook = nil,             -- Function to run after the scrolling animation ends
--     performance_mode = false,    -- Disable "Performance Mode" on all buffers.
-- })

-- Undoes NvChad's effect of clearing CursorLine
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = { "*" },
--   command = "highlight link CursorLine CursorColumn",
-- })


local ft = require('Comment.ft')
ft.set('gml', '//%s')

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
