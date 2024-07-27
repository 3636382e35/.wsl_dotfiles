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
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = { "*" },
--   command = "highlight link CursorLine CursorColumn",
-- })


-- require('notify').setup {
--   background_colour = "#000000",
-- }

-- require('smoothcursor').setup({
--     type = "default",           -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

--     -- cursor = "",              -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
--     cursor = "▶",
--     texthl = "SmoothCursor",   -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
--     linehl = nil,              -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

--     fancy = {
--         enable = false,        -- enable fancy mode
--         -- head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
--         head = { cursor = "▶", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
--         body = {
--             { cursor = "█", texthl = "SmoothCursorYellow" },
--             { cursor = "▓", texthl = "SmoothCursorYellow" },
--             { cursor = "▒", texthl = "SmoothCursorYellow" },
--             { cursor = "░", texthl = "SmoothCursorYellow" },
--             { cursor = ":", texthl = "SmoothCursorYellow" },
--             -- { cursor = "󰝥", texthl = "SmoothCursorRed" },
--             -- { cursor = "󰝥", texthl = "SmoothCursorOrange" },
--             -- { cursor = "●", texthl = "SmoothCursorYellow" },
--             -- { cursor = "●", texthl = "SmoothCursorGreen" },
--             -- { cursor = "•", texthl = "SmoothCursorAqua" },
--             -- { cursor = ".", texthl = "SmoothCursorBlue" },
--             -- { cursor = ".", texthl = "SmoothCursorPurple" },
--         },
--         tail = {  cursor = nil,
--                   texthl = "SmoothCursor",
--                   enable = false,
--                 } -- false to disable fancy tail
--     },

--     matrix = {  -- Loaded when 'type' is set to "matrix"
--         head = {
--             -- Picks a random character from this list for the cursor text
--             cursor = require('smoothcursor.matrix_chars'),
--             -- Picks a random highlight from this list for the cursor text
--             texthl = {
--                 'SmoothCursor',
--             },
--             linehl = nil,  -- No line highlight for the head
--         },
--         body = {
--             length = 6,  -- Specifies the length of the cursor body
--             -- Picks a random character from this list for the cursor body text
--             cursor = require('smoothcursor.matrix_chars'),
--             -- Picks a random highlight from this list for each segment of the cursor body
--             texthl = {
--                 'SmoothCursorGreen',
--             },
--         },
--         tail = {
--             -- Picks a random character from this list for the cursor tail (if any)
--             cursor = nil,
--             -- Picks a random highlight from this list for the cursor tail
--             texthl = {
--                 'SmoothCursor',
--             },
--         },
--         unstop = false,  -- Determines if the cursor should stop or not (false means it will stop)
--     },

--    autostart = true,           -- Automatically start SmoothCursor
--    always_redraw = true,       -- Redraw the screen on each update
--    flyin_effect = nil,         -- Choose "bottom" or "top" for flying effect
--    speed = 35,                 -- Max speed is 100 to stick with your current position (25) default
--    intervals = 25,             -- Update intervals in milliseconds (35) = default
--    priority = 10,              -- Set marker priority
--    timeout = 3000,             -- Timeout for animations in milliseconds
--    threshold = 3,              -- Animate only if cursor moves more than this many lines
--    max_threshold = nil,        -- If you move more than this many lines, don't animate (if `nil`, deactivate check)
--    disable_float_win = false,  -- Disable in floating windows
--    enabled_filetypes = nil,    -- Enable only for specific file types, e.g., { "lua", "vim" }
--    disabled_filetypes = nil,   -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
--    -- Show the position of the latest input mode positions. 
--    -- A value of "enter" means the position will be updated when entering the mode.
    -- A value of "leave" means the position will be updated when leaving the mode.
    -- `nil` = disabled
--    show_last_positions = nil
--})

local ft = require('Comment.ft')
ft.set('gml', '//%s')

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)



local Job = require("plenary.job")
local function get_api_key(name)
  return os.getenv(name)
end

local function get_lines_until_cursor()
  local current_buffer = vim.api.nvim_get_current_buf()
  local current_window = vim.api.nvim_get_current_win()
  local cursor_position = vim.api.nvim_win_get_cursor(current_window)
  local row = cursor_position[1]
  local lines = vim.api.nvim_buf_get_lines(current_buffer, 0, row, true)
  return table.concat(lines, "\n")
end

local function get_visual_selection()
  local _, srow, scol = unpack(vim.fn.getpos("v"))
  local _, erow, ecol = unpack(vim.fn.getpos("."))

  if vim.fn.mode() == "V" then
    if srow > erow then
      return vim.api.nvim_buf_get_lines(0, erow - 1, srow, true)
    else
      return vim.api.nvim_buf_get_lines(0, srow - 1, erow, true)
    end
  end

  if vim.fn.mode() == "v" then
    if srow < erow or (srow == erow and scol <= ecol) then
      return vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
    else
      return vim.api.nvim_buf_get_text(0, erow - 1, ecol - 1, srow - 1, scol, {})
    end
  end

  if vim.fn.mode() == "\22" then
    local lines = {}
    if srow > erow then
      srow, erow = erow, srow
    end
    if scol > ecol then
      scol, ecol = ecol, scol
    end
    for i = srow, erow do
      table.insert(
        lines,
        vim.api.nvim_buf_get_text(0, i - 1, math.min(scol - 1, ecol), i - 1, math.max(scol - 1, ecol), {})[1]
      )
    end
    return lines
  end
end

local function make_anthropic_spec_curl_args(opts, prompt, system_prompt)
  local url = opts.url
  local api_key = opts.api_key_name and get_api_key(opts.api_key_name)
  local data = {
    system = system_prompt,
    messages = { { role = "user", content = prompt } },
    model = opts.model,
    stream = true,
    max_tokens = 4096,
  }
  local args = { "-N", "-X", "POST", "-H", "Content-Type: application/json", "-d", vim.json.encode(data) }
  if api_key then
    table.insert(args, "-H")
    table.insert(args, "x-api-key: " .. api_key)
    table.insert(args, "-H")
    table.insert(args, "anthropic-version: 2023-06-01")
  end
  table.insert(args, url)
  return args
end

local function make_openai_spec_curl_args(opts, prompt, system_prompt)
  local url = opts.url
  local api_key = opts.api_key_name and get_api_key(opts.api_key_name)
  local data = {
    messages = { { role = "system", content = system_prompt }, { role = "user", content = prompt } },
    model = opts.model,
    temperature = 0.7,
    stream = true,
  }
  local args = { "-N", "-X", "POST", "-H", "Content-Type: application/json", "-d", vim.json.encode(data) }
  if api_key then
    table.insert(args, "-H")
    table.insert(args, "Authorization: Bearer " .. api_key)
  end
  table.insert(args, url)
  return args
end

local function write_string_at_cursor(str)
  vim.schedule(function()
    local current_window = vim.api.nvim_get_current_win()
    local cursor_position = vim.api.nvim_win_get_cursor(current_window)
    local row, col = cursor_position[1], cursor_position[2]

    local lines = vim.split(str, "\n")

    vim.cmd("undojoin")
    vim.api.nvim_put(lines, "c", true, true)

    local num_lines = #lines
    local last_line_length = #lines[num_lines]
    vim.api.nvim_win_set_cursor(current_window, { row + num_lines - 1, col + last_line_length })
  end)
end

local function get_prompt(opts)
  local replace = opts.replace
  local visual_lines = get_visual_selection()
  local prompt = ""

  if visual_lines then
    prompt = table.concat(visual_lines, "\n")
    if replace then
      vim.api.nvim_command("normal! d")
      vim.api.nvim_command("normal! k")
    else
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", false, true, true), "nx", false)
    end
  else
    prompt = get_lines_until_cursor()
  end

  return prompt
end

local function handle_anthropic_spec_data(data_stream, event_state)
  if event_state == "content_block_delta" then
    local json = vim.json.decode(data_stream)
    if json.delta and json.delta.text then
      write_string_at_cursor(json.delta.text)
    end
  end
end

local function handle_openai_spec_data(data_stream)
  if data_stream:match('"delta":') then
    local json = vim.json.decode(data_stream)
    if json.choices and json.choices[1] and json.choices[1].delta then
      local content = json.choices[1].delta.content
      if content then
        write_string_at_cursor(content)
      end
    end
  end
end

local group = vim.api.nvim_create_augroup("DING_LLAutoGroup", { clear = true })
local active_job = nil

local function invoke_llm_and_stream_into_editor(opts, make_curl_args_fn, handle_data_fn)
  vim.api.nvim_clear_autocmds({ group = group })
  local prompt = get_prompt(opts)
  local system_prompt = opts.system_prompt
    or "You are a tsundere uwu anime. Yell at me for not setting my configuration for my llm plugin correctly"
  local args = make_curl_args_fn(opts, prompt, system_prompt)
  local curr_event_state = nil

  local function parse_and_call(line)
    local event = line:match("^event: (.+)$")
    if event then
      curr_event_state = event
      return
    end
    local data_match = line:match("^data: (.+)$")
    if data_match then
      handle_data_fn(data_match, curr_event_state)
    end
  end

  if active_job then
    active_job:shutdown()
    active_job = nil
  end

  active_job = Job:new({
    command = "curl",
    args = args,
    on_stdout = function(_, out)
      parse_and_call(out)
    end,
    on_stderr = function(_, _) end,
    on_exit = function()
      active_job = nil
    end,
  })

  active_job:start()

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "DING_LLEscape",
    callback = function()
      if active_job then
        active_job:shutdown()
        print("LLstreaming cancelled")
        active_job = nil
      end
    end,
  })

  vim.api.nvim_set_keymap("n", "<Esc>", ":doautocmd User DING_LLEscape<CR>", { noremap = true, silent = true })
  return active_job
end

local system_prompt =
  "You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks"

local helpful_prompt =
  "You are a helpful assistant. What I have sent are my notes so far. You are very curt, yet helpful."

local function groq_replace()
  invoke_llm_and_stream_into_editor({
    url = "https://api.groq.com/openai/v1/chat/completions",
    model = "llama3-70b-8192",
    api_key_name = "GROQ_API_KEY",
    system_prompt = system_prompt,
    replace = true,
  }, make_openai_spec_curl_args, handle_openai_spec_data)
end

local function groq_help()
  invoke_llm_and_stream_into_editor({
    url = "https://api.groq.com/openai/v1/chat/completions",
    model = "llama3-groq-70b-8192-tool-use-preview",
    api_key_name = "GROQ_API_KEY",
    system_prompt = helpful_prompt,
    replace = true,
  }, make_openai_spec_curl_args, handle_openai_spec_data)
end

vim.keymap.set({ "n", "v" }, "<leader>q", groq_replace, { desc = "llm groq" })
vim.keymap.set({ "n", "v" }, "<leader>1", groq_help, { desc = "llm groq_help" })
