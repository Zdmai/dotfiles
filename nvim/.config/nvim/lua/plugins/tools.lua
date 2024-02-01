return {
  "coffebar/neovim-project",
  -- cmd = "Telescope neovim-project",
  event = "VeryLazy",
  opts = {
    last_session_on_startup = false,
    projects = { -- define project roots
      "~/.config/nvim",
      "~/note/",
    },
  },
  init = function()
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  config = function()
    -- TODO: set the keymaps for project.nvim

    -- :Telescope neovim-project discover - find a project based on patterns.

    -- :-- Telescope neovim-project history - select a project from your recent history.

    -- :NeovimProjectLoadRecent - open the previous session.
  end,
}
