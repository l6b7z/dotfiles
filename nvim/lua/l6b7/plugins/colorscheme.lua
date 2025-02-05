return {'tanvirtin/monokai.nvim',
config = function()
local cfg = require('monokai').setup {
      palette = require('monokai').soda,
      italics = false
    }
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#00bff0' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#00ffff' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#00bff0' })
    vim.cmd.highlight('MsgArea guibg=#202328')
 end,
}
