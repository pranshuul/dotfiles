return {
  {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<C-_>', require('Comment.api').toggle.linewise.current, opts)
      vim.keymap.set('n', '<C-c>', require('Comment.api').toggle.linewise.current, opts)
      vim.keymap.set('n', '<C-/>', require('Comment.api').toggle.linewise.current, opts)
      vim.keymap.set('v', '<C-_>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
      vim.keymap.set('v', '<C-c>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
      vim.keymap.set('v', '<C-/>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local todo_comments = require("todo-comments")

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "]t", function()
        todo_comments.jump_next()
      end, { desc = "Next todo comment" })

      keymap.set("n", "[t", function()
        todo_comments.jump_prev()
      end, { desc = "Previous todo comment" })

      -- TODO: todo comment
      -- PERF: perf comment
      -- NOTE: note comment
      -- FIX: bug comment
      -- BUG: bug comment
      -- HACK: hack comment
      -- WARN: warn comment
      -- WARNING: warning comment

      todo_comments.setup()
    end,
  },
}
