return {
  { 'nvim-lua/plenary.nvim', },          -- Required as a dependency by a lot of plugins
  { 'christoomey/vim-tmux-navigator', }, -- tmux & split window navigation
  { 'windwp/nvim-ts-autotag', },         -- autoclose tags
  { 'tpope/vim-sleuth', },               -- detect tabstop and shiftwidth automatically
  { 'tpope/vim-fugitive' },              -- Git wrapper
  { 'tpope/vim-rhubarb' },               -- The github to fugitive's git
  {
    'stevearc/dressing.nvim',            -- better ui features
    event = 'VeryLazy',
  },
  {
    'szw/vim-maximizer', -- maximixe splits
    keys = {
      { '<leader>sm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize/minimize a split' },
    },
  },
  {
    'folke/which-key.nvim', -- Plugin that hints keybinds
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 750
    end,
    opts = {},
  },
  {
    'windwp/nvim-autopairs', -- Autoclose pairs
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    'kylechui/nvim-surround', -- Alter surrounding symbols
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*',            -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua', -- high-performance color highlighter
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'mistricky/codesnap.nvim', -- Test plugin for code screenshots
    lazy = 'true',
    build = 'make',
    cmd = 'CodeSnapPreviewOn',
    config = function(_, opts)
      require('codesnap').setup(opts)
    end,
  },
  {
    'michaelrommel/nvim-silicon', -- Main plugin for code screenshots
    lazy = true,
    cmd = 'Silicon',
    main = 'nvim-silicon',
    opts = {
      -- Configuration here, or leave empty to use defaults
      line_offset = function(args)
        return args.line1
      end,
    }
  },
}
