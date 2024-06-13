return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    version = '*', -- Use the latest stable version
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      statusline.setup {}

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Automatic highlighting of word under cursor
      require('mini.cursorword').setup()

      -- Highlight indent scope
      require('mini.indentscope').setup()

      -- Jump to next/previous single character
      require('mini.jump').setup()

      -- Show notifications
      require('mini.notify').setup()

      -- Move lines and selections in direction
      require('mini.move').setup {
        mappings = {
          -- Visual mode
          left = '<M-Left>',
          right = '<M-Right>',
          down = '<M-Down>',
          up = '<M-Up>',
          -- Normal mode
          line_left = '<M-Left>',
          line_right = '<M-Right>',
          line_down = '<M-Down>',
          line_up = '<M-Up>',
        },
      }

      -- Start page
      require('mini.starter').setup {
        header = [[
██████╗  ██████╗ ███╗   ██╗██╗███╗   ██╗██╗
██╔══██╗██╔═══██╗████╗  ██║██║████╗  ██║██║
██████╔╝██║   ██║██╔██╗ ██║██║██╔██╗ ██║██║
██╔══██╗██║   ██║██║╚██╗██║██║██║╚██╗██║██║
██║  ██║╚██████╔╝██║ ╚████║██║██║ ╚████║██║
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝╚═╝
        ]],
        footer = '',
      }

      -- File utils
      require('mini.files').setup {
        mappings = {
          go_in = '<Right>',
          go_in_plus = '<S-Right>',
          go_out = '<Left>',
          go_out_plus = '<S-Left>',
        },
      }
      local minifiles_toggle = function()
        if not MiniFiles.close() then
          MiniFiles.open()
        end
      end
      vim.keymap.set('n', '<leader>ft', minifiles_toggle, { desc = '[F]ile utils [T]oggle' })
    end,
  },
}
