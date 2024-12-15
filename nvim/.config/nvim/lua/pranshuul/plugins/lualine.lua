return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lazy_status = require 'lazy.status'

    local colors = {
      blue = '#61afef',
      green = '#98c379',
      purple = '#c678dd',
      cyan = '#56b6c2',
      red1 = '#e06c75',
      red2 = '#be5046',
      yellow = '#e5c07b',
      fg = '#abb2bf',
      bg = '#282c34',
      gray1 = '#828997',
      gray2 = '#2c323c',
      gray3 = '#3e4452',
    }

    local onedark_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.gray3 },
        c = { fg = colors.fg, bg = colors.gray2 },
      },
      command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
      insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
      visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
      terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
      replace = { a = { fg = colors.bg, bg = colors.red1, gui = 'bold' } },
      inactive = {
        a = { fg = colors.gray1, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.gray1, bg = colors.bg },
        c = { fg = colors.gray1, bg = colors.gray2 },
      },
    }

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
        -- return '' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status)
      path = 0,           -- 0 => just filename, 1 => relative path, 2 => absolute path
    }

    local os_logo = {
      'os_logo',
      fmt = function()
        return '󰣇'
      end,
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

    local buffers = {
      'buffers',
      show_filename_only = true,       -- Shows shortened relative path when set to false.
      hide_filename_extension = false, -- Hide filename extension when set to true.
      show_modified_status = true,     -- Shows indicator when the buffer is modified.

      mode = 0,                        -- 0: Shows buffer name
      -- 1: Shows buffer index
      -- 2: Shows buffer name + buffer index
      -- 3: Shows buffer number
      -- 4: Shows buffer name + buffer number

      max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
      -- it can also be a function that returns
      -- the value of `max_length` dynamically.
      filetype_names = {
        TelescopePrompt = 'Telescope',
        dashboard = 'Dashboard',
        packer = 'Packer',
        fzf = 'FZF',
        alpha = 'Alpha',
      }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

      -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
      use_mode_colors = false,

      -- buffers_color = {
      --   -- Same values as the general color option can be used here.
      --   active = colors.blue,     -- Color for active buffer.
      --   inactive = colors.gray1, -- Color for inactive buffer.
      -- },

      symbols = {
        modified = ' ●', -- Text to show when the buffer is modified
        alternate_file = '#', -- Text to show to identify the alternate file
        directory = '', -- Text to show when the buffer is a directory
      },
    }

    -- -- Import color theme based on environment variable NVIM_THEME
    -- local env_var_nvim_theme = os.getenv 'NVIM_THEME' or 'nord'
    --
    -- -- Define a table of themes
    -- local themes = {
    --   onedark = onedark_theme,
    --   nord = 'nord',
    -- }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- theme = themes[env_var_nvim_theme], -- Set theme based on environment variable
        theme = 'tokyonight', -- Set theme based on environment variable
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
        disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'neo-tree', 'Outline' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {
          {
            'branch',
            -- color = { fg = '#040c36' },
            color = { fg = '#fff' },
          },
        },
        lualine_c = { buffers },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, 'filetype', filename, os_logo },
        lualine_y = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
          {
            'progress',
            -- color = { fg = '#040c36' },
            color = { fg = '#fff' },
          },
        },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
