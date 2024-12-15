-- LINE NUMBERING
vim.wo.number = true -- Set line numbers (default: false)
vim.o.relativenumber = true -- Set relative numbered lines (default: false)

-- SYSTEM CLIPBOARD
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim (default: '')

-- WINDOW BEHAVIOUR
vim.o.wrap = false -- Wrap lines at window border (default: true)
vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.o.mouse = 'a' -- Enable mouse mode (default: '')
vim.o.showmode = false -- No more -- INSERT -- etc. anymore
vim.o.whichwrap = 'bs<>hl' -- Which "horizontal" keys are allowed to travel to the next/previous line
vim.o.numberwidth = 4 -- Set number column width to 4 (default: 4)
vim.o.swapfile = false -- Created=s a swapfile (default: true)
vim.o.showtabline = 2 -- Always show tabs (default: 1)
vim.o.backspace = 'indent,eol,start' -- Allow backspace on these
vim.o.pumheight = 10 -- Pop up menu height (default: 0)
vim.o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')
vim.o.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 750 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.o.backup = false -- Creates a backup file
vim.o.writebackup = false -- If a file is being edited by another program, it is not allowed to be edited
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience

-- CASE SENSITIVITY
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C used or explicit capital-typed search (default: false)
vim.o.smartcase = true -- Smart case (default: false)

-- INDENTATION
vim.o.autoindent = true --Copy indent from current line when starting new one (default: false)
vim.o.shiftwidth = 2 -- The number of spaces inserted for each indentation (default: 8)
vim.o.tabstop = 2 -- Insert n spaces for a tab (default: 8)
vim.o.softtabstop = 2 -- Number of spaces that a tab counts for while performing editing operations
vim.o.expandtab = true -- Convert tabs to spaces (default: false)
vim.o.smartindent = true -- Make indenting smarter again (default: false)
vim.o.breakindent = true -- Enable break indent

-- SCROLL BEHAVIOUR
vim.o.scrolloff = 8 -- Minimum number of lines to keep above and below the cursor while scrolling
vim.o.sidescrolloff = 8 -- Minimum number of screen columns either side of cursor if wrap is set to 'false'

-- CURSOR LINE
vim.o.cursorline = true -- Highlight the current line

-- SPLIT BEHAVIOUR
vim.o.splitbelow = true -- Force all horizontal splits to go below current window
vim.o.splitright = true -- Force all vertical splits to go to the right of current window

-- SEARCH HIGHLIGHTING
vim.o.hlsearch = false -- Set highlight on search

-- GUI COLOURS
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups

-- MISCELLANEOUS
vim.opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages
vim.opt.iskeyword:append '-' -- Hyphenated words recognized by searches
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove 'usr/share/vim/vimfiles' -- Separate vim plugins from Neovim incase vim is still in use.
