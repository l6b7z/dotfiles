-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#BBC2CF',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98BE65',
  orange   = '#FF8800',
  violet   = '#A9A1E1',
  magenta  = '#C678DD',
  blue     = '#51AFEF',
  red      = '#EC5F67',

  fgnd         = '#50505F',
  ngreen       = '#D5FD00',
  bg_visual    = '#0080FF',
  bg_visual2   = '#00CCCC',
  rgb_black    = '#000000',
  dullred      = '#A00000',
  fgtext       = '#0A1010',
  fgtext2      = '#330066',
  rgb_green    = '#00FF00',
  fgtext3      = '#220044',

}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end




local mode_map = {
	["n"]    = "NORMAL ",
	["v"]    = "VISUAL ",
	["V"]    = "V LINE ",
	["\22"]  = "V BLOCK",
	["i"]    = "INSERT ",
	["R"]    = "REPLACE",
	["c"]    = "COMMAND",

  ["no"]   = " !     ",
	
  ["nov"]  = " ?     ",
	["noV"]  = " ?     ",
	["no\22"]= " ?     ",
	["niI"]  = " ?     ",
	["niR"]  = " ?     ",
	["niV"]  = " ?     ",
	["nt"]   = " ?     ",
	["vs"]   = " ?     ",
	["Vs"]   = " ?     ",
	["\22s"] = " ?     ",
	["s"]    = " ?     ",
	["S"]    = " ?     ",
	["\19"]  = " ?     ",
	["ic"]   = " ?     ",
	["ix"]   = " ?     ",
	["Rc"]   = " ?     ",
	["Rx"]   = " ?     ",
	["Rv"]   = " ?     ",
	["Rvc"]  = " ?     ",
	["Rvx"]  = " ?     ",
	["cv"]   = " ?     ",
	["ce"]   = " ?     ",
	["r"]    = " ?     ",
	["rm"]   = " ?     ",
	["r?"]   = " ?     ",
	["!"]    = " ?     ",
	["t"]    = " ?     ",
}
---------------------------------------------------------------------------------------------------


ins_left {
--  'mode',
  -- mode component

--'mode',
--fmt = function(str) return str:sub(1,7) end,

function() return mode_map[vim.api.nvim_get_mode().mode] or "" end,

  color = function()

local mode_color_bg = {
      n       = colors.violet, 
      i       = colors.ngreen,
      v       = colors.bg_visual,
      V       = colors.bg_visual2,
	    ["\22"] = colors.bg_visual2,
      c       = colors.rgb_black,
      R       = colors.dullred,
    }

    local mode_color_fg = {
      n       = colors.fgtext,
      i       = colors.fgtext,
      v       = colors.fgtext3,
      V       = colors.fgtext3,
	    ["\22"] = colors.fgtext3,
      c       = colors.rgb_green,
      R       = colors.fgtext2,
      
      -- no    = "000000", 
      -- s     = "000000", 
      -- S     = "000000", 
      -- ['']  = "000000", 
      -- ic    = "000000", 
      -- Rv    = "000000", 
      -- cv    = "000000", 
      -- ce    = "000000", 
      -- r     = "000000", 
      -- rm    = "000000", 
      -- ['r?']= "000000", 
      -- ['!'] = "000000", 
      -- t     = "000000", 
    }

    return { fg = mode_color_fg[vim.fn.mode()],bg = mode_color_bg[vim.fn.mode()], gui = 'bold' }
  end,
 -- padding = { right = 1 },
}



ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.violet, gui = 'bold' },
}

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}


-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}


ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}


ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}


ins_right {
  -- Lsp server name .
  function()
    local msg = '󰒋'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '',
  color = { fg = colors.fgnd, gui = 'bold' },
}



ins_right {
  'filesize',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.fgnd, gui = 'bold' },
}


ins_right { 'progress', color = { fg = colors.fgnd, gui = 'bold' } }

ins_right { 'location', color = { fg = colors.violet, gui = 'bold'} }


-- Now don't forget to initialize lualine
lualine.setup(config)
