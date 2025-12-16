return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  version = '*',
  config = function()
    require('bufferline').setup({
      options = {
        mode = 'tabs',
        themable = true,                     -- allows highlight groups to be overriden i.e. sets highlights as default
        close_command = 'tabclose',       -- can be a string | function, see "Mouse actions"
        right_mouse_command = 'tabclose', -- can be a string | function, see "Mouse actions"
        left_mouse_command = 'buffer %d',    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = 'tabnew %',          -- can be a string | function, see "Mouse actions"
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = false,    -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
        custom_filter = function(buf_number)
          local buf_ft = vim.bo[buf_number].filetype
          if buf_ft ~= 'neo-tree' then
            return true
          end
        end,
      },
      highlights = {
        -- indicator_selected = {
        -- 	fg = "#8EBB73",
        -- },
        -- separator = {
        -- 	fg = "#8EBB73",
        -- },
        -- separator_selected = {
        -- 	fg = "#8EBB73",
        -- 	bg = "#8EBB73",
        -- },
        -- tab_selected = {
        -- 	bg = "#8EBB73",
        -- },
        -- background = {
        -- 	fg = "#657b83",
        -- 	bg = "#002b36",
        -- },
        buffer_selected = {
          -- fg = "#8EBB73",
          -- bg = "#8EBB73",
          bold = true,
          italic = false,
        },
        -- fill = {
        -- 	bg = "#073642",
        -- },
      },
    })
  end,
}
