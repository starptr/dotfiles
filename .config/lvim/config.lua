--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
vim.opt.showtabline = 1
vim.opt.showmode = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.guifont = "Iosevka Nerd Font:h14"

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "vscode"
lvim.transparent_window = true

local function setDayNNite()
  local mode_config_filepath = vim.env.HOME .. "/.config/day-n-nite/mode_config"
  local fh = io.open(mode_config_filepath, "r")
  if fh then
    local mode = fh:read()
    if mode == "Day" then
      vim.g.vscode_style = "light"
    else
      vim.g.vscode_style = "dark"
    end
    fh:close()
  else
    vim.g.vscode_style = "dark"
  end
end

setDayNNite()

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- disable wrapped movement
lvim.line_wrap_cursor_movement = false
vim.opt.whichwrap = ""
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   t = { "<cmd>TroubleToggle<cr>", "Trouble" },
--   r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
--   f = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
--   D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Worksplace Diagnostics" },
--   q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
--   l = { "<cmd>TroubleToggle loclist<cr>", "LocationList" },
--   o = { "<cmd>TodoTrouble<cr>", "Todo" },
-- }
-- lvim.builtin.which_key.mappings["w"] = {
--   name = "+Window",
--   h = { "<C-w>h", "Go to the left window" },
--   j = { "<C-w>j", "Go to the down window" },
--   k = { "<C-w>k", "Go to the up window" },
--   l = { "<C-w>l", "Go to the right window" },
--   -- ["\""] = { "<cmd>split<CR>", "Split window" },
--   -- ["%"] = { "<cmd>vsplit<CR>", "Split window vertically" },
-- }

-- Hook into rename command to move cursor to beginning of word
-- lvim.builtin.which_key.mappings["l"]["r"] = { function(passing_arg)
--   vim.api.nvim_command("normal! viwo")
--   vim.lsp.buf.rename(passing_arg)
-- end, "Rename" }

-- Remove maps set by lvim
lvim.keys.insert_mode["jj"] = false
lvim.keys.insert_mode["jk"] = false
lvim.keys.insert_mode["kj"] = false

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.lualine.options.theme = "vscode"
-- TODO: custom mode text
local mode_map = {
  -- text and padding
  n = "  通常  ",
  v = "  選択  ",
  V = " 行選択 ",
  [''] = "部分選択",
  i = "  入力  ",
  R = " 代える ",
  c = "  実行  ",
  r = "  Wait  ",
  ['!'] = " 実行中 ",
  t = "  Term  ",
}
local short_mode = {
  function()
    local mode_str = vim.api.nvim_get_mode().mode
    local mode_char = string.sub(mode_str, 1, 1) --mode_str:sub(1, 1)
    local maybe_short_mode = mode_map[mode_char]
    if maybe_short_mode then
      return maybe_short_mode
    else
      return "      "
    end
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
}
lvim.builtin.lualine.sections.lualine_a = { short_mode }
--lvim.builtin.lualine.on_config_done = function (lualine)
--  local config = lualine.get_config()
--  config.sections.lualine_a = { short_mode }
--  lualine.setup(config)
--end
local components = require "lvim.core.lualine.components"
--lvim.builtin.lualine.sections.lualine_a = { components.mode }
lvim.builtin.lualine.style = "lvim"
-- lvim.builtin.lualine.style = "none"
 lvim.builtin.lualine.active = true
lvim.builtin.dap.active = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
--lvim.builtin.nvimtree.show_icons.git = 0 -- invalid config
-- lvim.builtin.project.manual_mode = true
lvim.builtin.project.exclude_dirs = { "~/src/contest/*" }
lvim.builtin.bufferline.active = false

lvim.builtin.cmp.mapping["<C-b>"] = lvim.builtin.cmp.mapping["<C-d>"]
lvim.builtin.cmp.mapping["<C-d>"] = nil

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "latex",
}
lvim.builtin.treesitter.on_config_done = function(configs)
  local parsers = require "nvim-treesitter.parsers"
  local confs = parsers.get_parser_configs()
  confs.objcpp = {
    install_info = {
      url = "~/src/tree-sitter-objc",
      files = { "src/parser.c" },
      requires_generate_from_grammar = false,
    },
  }
end

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- Configure Lsp server setup script location
-- lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "after", "ftplugin")

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- should be used in ftplugin file
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }

-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  --{ exe = "flake8", filetypes = { "python" } },
  {
    exe = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    args = { "--severity", "warning" },
  },
  --{
  --  exe = "codespell",
  --  ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --  filetypes = { "javascript", "python" },
  --},
  --{
  --  exe = "eslint_d",
  --  filetypes = {
  --    "javascriptreact",
  --    "javascript",
  --    "typescriptreact",
  --    "typescript",
  --    "vue",
  --  },
  --},
}
-- set code actions
local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
}

-- Additional Plugins
lvim.plugins = {
  {
    'gpanders/editorconfig.nvim',
  },
  {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup({
        input = {
          override = function(conf)
            conf['row'] = 2
            conf['col'] = -1
          end,
        },
      })
    end,
  },
  {
    'Pocco81/dap-buddy.nvim',
    commit = "24923c3819a450a772bb8f675926d530e829665f",
    config = function()
      -- TODO: use legendary
      --local dap = require('dap')
      vim.api.nvim_set_keymap('n', '<F5>', [[<Cmd>lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F3>', [[<Cmd>lua require'dap'.terminate()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F4>', [[<Cmd>lua require'dap'.terminate(); require'dap'.run_last()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F6>', [[<Cmd>lua require'dap'.pause()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F9>', [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], { noremap = true, silent = true })
      -- TODO: conditional breakpoints
      vim.api.nvim_set_keymap('n', '<F8>', [[<Cmd>lua require'dap'.run_to_cursor()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F10>', [[<Cmd>lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F11>', [[<Cmd>lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F12>', [[<Cmd>lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
      -- TODO: more debug commands https://github.com/mfussenegger/nvim-dap/blob/9b8c27d6dcc21b69834fe9c2d344e49030783390/doc/dap.txt#L460
    end,
  },
  {
    "mrjones2014/legendary.nvim",
    commit = "b1943584b1b1e808ae449a5ada56407fb41671d6",
    config = function()
      local legendary = require('legendary')
      -- legendary.setup({
      --   which_key = {
      --     mappings = lvim.builtin.which_key.mappings,
      --     opts = lvim.builtin.which_key.opts,
      --     do_binding = false,
      --   },
      -- })
      -- Light emacs binds
      -- TODO: support ex mode (command mode)
      legendary.bind_keymaps({
        { '<C-a>', '<C-o>0', description = 'Start of line', mode = { 'i', 'c' } },
        { '<C-e>', '<C-o>A', description = 'End of line', mode = { 'i' } },
        { '<C-f>', '<Right>', description = 'Move right', mode = { 'i' } },
        { '<C-b>', '<Left>', description = 'Move left', mode = { 'i' } },
        { '<M-f>', 'wi', description = 'Start of next word', mode = { 'i' } },
        { '<M-b>', 'bi', description = 'Start of previous word', mode = { 'i' } },
      })
    end,
  },
  -- {"folke/tokyonight.nvim"},
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   config = function()
  --     require('dapui').setup()
  --     -- lvim.builtin.which_key.mappings["dv"] = { "<cmd>lua require 'dapui'.toggle()<cr>", "Toggle Sidebar" }
  --   end,
  -- },
  {
    "Mofiqul/vscode.nvim",
    disable = false,
  },
  { "tpope/vim-fugitive" },
  --{
  --  "APZelos/blamer.nvim",
  --  disable = true,
  --  opt = true,
  --  cmd = "BlamerShow",
  --  setup = function()
  --    vim.api.nvim_set_var('blamer_enabled', 1)
  --    vim.api.nvim_set_var('blamer_delay', 200)
  --    vim.api.nvim_set_var('blamer_prefix', ' 著者 ')
  --    vim.cmd([[highlight Blamer ctermfg=grey guifg=grey]])
  --  end,
  --},
  {
    "f-person/git-blame.nvim",
    cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameCopySHA", "GitBlameOpenCommitURL" },
    setup = function()
      vim.g.gitblame_date_format = '%m/%d/%y %H:%M'
      vim.g.gitblame_message_template = ' 著者 <author>, <date> • <summary>'
      vim.g.gitblame_highlight_group = "GitBlame"
      vim.cmd([[highlight GitBlame ctermfg=grey guifg=grey]])
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup({})
    end,
  },
  -- {
  --   "ruifm/gitlinker.nvim",
  --   requires = 'nvim-lua/plenary.nvim',
  --   setup = function()
  --     require('legendary').bind_keymap({
  --       'gh',
  --       {
  --         n = { function() require 'gitlinker'.get_repo_url() end, description = "Remote repo url" },
  --         v = { function() require 'gitlinker'.get_buf_range_url('v', {}) end, description = "Remote repo url with lines" },
  --       },
  --     })
  --   end,
  --   config = function()
  --     require('gitlinker').setup({
  --       mappings = nil,
  --       opts = {
  --         action_callback = function(url)
  --           vim.api.nvim_command('let @" = \'' .. url .. '\'')
  --           vim.fn.setreg('+', url)
  --           vim.api.nvim_command(':OSCYankReg +')
  --         end,
  --       },
  --       callbacks = {
  --         ["github.rbx.com"] = require "gitlinker.hosts".get_github_type_url,
  --       }
  --     })
  --   end,
  -- },
  -- {
  --   "ojroques/vim-oscyank",
  --   branch = "main",
  --   cmd = { "OSCYank", "OSCYankReg" },
  --   setup = function()
  --     require('legendary').bind_keymap({
  --       'gy',
  --       {
  --         n = { ':OSCYank<CR>', opts = { noremap = true } },
  --         v = { ':OSCYank<CR>', opts = { noremap = true } },
  --       },
  --       description = 'Copy with OSC52',
  --     })
  --   end,
  -- },
  {
    "windwp/windline.nvim",
    disable = true,
    config = function ()
      local windline = require('windline')
      local helper = require('windline.helpers')
      local utils = require('windline.utils')
      local sep = helper.separators
      local animation = require('wlanimation')
      local effects = require('wlanimation.effects')
      --
      local state = _G.WindLine.state
      --
      local hl_list = {
          Black = { 'white', 'black' },
          Inactive = { 'InactiveFg', 'InactiveBg' },
          Active = { 'ActiveFg', 'ActiveBg' },
      }
      local basic = {}
      --
      basic.divider = { '%=', '' }
      basic.space = { ' ', '' }
      basic.line_col = { [[ %3l:%-2c ]], hl_list.Black }
      basic.progress = { [[%3p%% ]], hl_list.Black }
      basic.bg = { ' ', 'StatusLine' }
      basic.file_name_inactive = { '%f', hl_list.Inactive }
      basic.line_col_inactive = { [[ %3l:%-2c ]], hl_list.Inactive }
      basic.progress_inactive = { [[%3p%% ]], hl_list.Inactive }
      --
      utils.change_mode_name({
          ['n'] = { ' NORMAL', 'Normal' },
          ['no'] = { ' O-PENDING', 'Visual' },
          ['nov'] = { ' O-PENDING', 'Visual' },
          ['noV'] = { ' O-PENDING', 'Visual' },
          ['no'] = { ' O-PENDING', 'Visual' },
          ['niI'] = { ' NORMAL', 'Normal' },
          ['niR'] = { ' NORMAL', 'Normal' },
          ['niV'] = { ' NORMAL', 'Normal' },
          ['v'] = { ' VISUAL', 'Visual' },
          ['V'] = { ' V-LINE', 'Visual' },
          [''] = { ' V-BLOCK', 'Visual' },
          ['s'] = { ' SELECT', 'Visual' },
          ['S'] = { ' S-LINE', 'Visual' },
          [''] = { ' S-BLOCK', 'Visual' },
          ['i'] = { ' INSERT', 'Insert' },
          ['ic'] = { ' INSERT', 'Insert' },
          ['ix'] = { ' INSERT', 'Insert' },
          ['R'] = { ' REPLACE', 'Replace' },
          ['Rc'] = { ' REPLACE', 'Replace' },
          ['Rv'] = { 'V-REPLACE', 'Normal' },
          ['Rx'] = { ' REPLACE', 'Normal' },
          ['c'] = { ' COMMAND', 'Command' },
          ['cv'] = { ' COMMAND', 'Command' },
          ['ce'] = { ' COMMAND', 'Command' },
          ['r'] = { ' REPLACE', 'Replace' },
          ['rm'] = { ' MORE', 'Normal' },
          ['r?'] = { ' CONFIRM', 'Normal' },
          ['!'] = { ' SHELL', 'Normal' },
          ['t'] = { ' TERMINAL', 'Command' },
      })
      --
      basic.vi_mode = {
          name = 'vi_mode',
          hl_colors = {
              Normal = { 'white', 'black' },
              Insert = { 'black', 'red' },
              Visual = { 'black', 'green' },
              Replace = { 'black', 'cyan' },
              Command = { 'black', 'yellow' },
          },
          text = function()
              return ' ' .. state.mode[1] .. ' '
          end,
          hl = function()
              return state.mode[2]
          end,
      }
      --
      basic.vi_mode_sep = {
          name = 'vi_mode_sep',
          hl_colors = {
              Normal = { 'black', 'FilenameBg' },
              Insert = { 'red', 'FilenameBg' },
              Visual = { 'green', 'FilenameBg' },
              Replace = { 'cyan', 'FilenameBg' },
              Command = { 'yellow', 'FilenameBg' },
          },
          text = function()
              return sep.right_rounded
          end,
          hl = function()
              return state.mode[2]
          end,
      }
      --
      basic.file_name = {
          text = function()
              local name = vim.fn.expand('%:p:t')
              if name == '' then
                  name = '[No Name]'
              end
              return name .. ' '
          end,
          hl_colors = { 'FilenameFg', 'FilenameBg' },
      }
      --
      local status_color = ''
      local change_color = function()
          --local anim_colors = {
          --    '#90CAF9',
          --    '#64B5F6',
          --    '#42A5F5',
          --    '#2196F3',
          --    '#1E88E5',
          --    '#1976D2',
          --    '#1565C0',
          --    '#0D47A1',
          --}
          local anim_colors = {
            '#0d47a1',
            '#104aa4',
            '#134ea6',
            '#1651a9',
            '#1954ab',
            '#1c58ae',
            '#1f5bb0',
            '#225eb3',
            '#2561b5',
            '#2865b8',
            '#2b68ba',
            '#2e6bbc',
            '#316fbf',
            '#3472c1',
            '#3775c4',
            '#3a79c6',
            '#3d7cc8',
            '#407fca',
            '#4483cd',
            '#4786cf',
            '#4a8ad1',
            '#4e8dd3',
            '#5190d5',
            '#5494d8',
            '#5897da',
            '#5b9adc',
            '#5f9ede',
            '#62a1e0',
            '#66a5e2',
            '#6aa8e4',
            '#6dabe6',
            '#71afe9',
            '#75b2eb',
            '#79b6ed',
            '#7cb9ef',
            '#80bcf1',
            '#84c0f3',
            '#88c3f5',
            '#8cc7f7',
            '#90caf9',
          }
          if status_color == 'blue' then
              anim_colors = {
                  '#F9FBE7',
                  '#F0F4C3',
                  '#E6EE9C',
                  '#DCE775',
                  '#D4E157',
                  '#CDDC39',
                  '#C0CA33',
                  '#AFB42B',
              }
              status_color = 'yellow'
          else
              status_color = 'blue'
          end
        --
          animation.stop_all()
          animation.animation({
              data = {
                  { 'waveleft24', effects.list_color(anim_colors, 24) },
                  { 'waveleft23', effects.list_color(anim_colors, 23) },
                  { 'waveleft22', effects.list_color(anim_colors, 22) },
                  { 'waveleft21', effects.list_color(anim_colors, 21) },
                  { 'waveleft20', effects.list_color(anim_colors, 20) },
                  { 'waveleft19', effects.list_color(anim_colors, 19) },
                  { 'waveleft18', effects.list_color(anim_colors, 18) },
                  { 'waveleft17', effects.list_color(anim_colors, 17) },
                  { 'waveleft16', effects.list_color(anim_colors, 16) },
                  { 'waveleft15', effects.list_color(anim_colors, 15) },
                  { 'waveleft14', effects.list_color(anim_colors, 14) },
                  { 'waveleft13', effects.list_color(anim_colors, 13) },
                  { 'waveleft12', effects.list_color(anim_colors, 12) },
                  { 'waveleft11', effects.list_color(anim_colors, 11) },
                  { 'waveleft10', effects.list_color(anim_colors, 10) },
                  { 'waveleft9', effects.list_color(anim_colors, 9) },
                  { 'waveleft8', effects.list_color(anim_colors, 8) },
                  { 'waveleft7', effects.list_color(anim_colors, 7) },
                  { 'waveleft6', effects.list_color(anim_colors, 6) },
                  { 'waveleft5', effects.list_color(anim_colors, 5) },
                  { 'waveleft4', effects.list_color(anim_colors, 4) },
                  { 'waveleft3', effects.list_color(anim_colors, 3) },
                  { 'waveleft2', effects.list_color(anim_colors, 2) },
                  { 'waveleft1', effects.list_color(anim_colors, 1) },
              },
              timeout = nil,
              delay = 200,
              interval = 20,
          })
        --
          --animation.animation({
          --    data = {
          --        { 'waveright1', efffects.list_color(anim_colors, 2) },
          --        { 'waveright2', efffects.list_color(anim_colors, 3) },
          --        { 'waveright3', efffects.list_color(anim_colors, 4) },
          --        { 'waveright4', efffects.list_color(anim_colors, 5) },
          --        { 'waveright5', efffects.list_color(anim_colors, 6) },
          --    },
          --    timeout = 100,
          --    delay = 200,
          --    interval = 150,
          --})
      end
      --
      local wave_left = {
          text = function()
              return {
                  { sep.right_rounded .. ' ', { 'black_light', 'waveleft1' } },
                  { sep.right_rounded .. ' ', { 'waveleft1', 'waveleft2' } },
                  { sep.right_rounded .. ' ', { 'waveleft2', 'waveleft3' } },
                  { sep.right_rounded .. ' ', { 'waveleft3', 'waveleft4' } },
                  { sep.right_rounded .. ' ', { 'waveleft4', 'waveleft5' } },
                  { sep.right_rounded .. ' ', { 'waveleft5', 'waveleft6' } },
                  { sep.right_rounded .. ' ', { 'waveleft6', 'waveleft7' } },
                  { sep.right_rounded .. ' ', { 'waveleft7', 'waveleft8' } },
                  { sep.right_rounded .. ' ', { 'waveleft8', 'waveleft9' } },
                  { sep.right_rounded .. ' ', { 'waveleft9', 'waveleft10' } },
                  { sep.right_rounded .. ' ', { 'waveleft10', 'waveleft11' } },
                  { sep.right_rounded .. ' ', { 'waveleft11', 'waveleft12' } },
                  { sep.right_rounded .. ' ', { 'waveleft12', 'waveleft13' } },
                  { sep.right_rounded .. ' ', { 'waveleft13', 'waveleft14' } },
                  { sep.right_rounded .. ' ', { 'waveleft14', 'waveleft15' } },
                  { sep.right_rounded .. ' ', { 'waveleft15', 'waveleft16' } },
                  { sep.right_rounded .. ' ', { 'waveleft16', 'waveleft17' } },
                  { sep.right_rounded .. ' ', { 'waveleft17', 'waveleft18' } },
                  { sep.right_rounded .. ' ', { 'waveleft18', 'waveleft19' } },
                  { sep.right_rounded .. ' ', { 'waveleft19', 'waveleft20' } },
                  { sep.right_rounded .. ' ', { 'waveleft20', 'wavedefault' } },
              }
          end,
          click = change_color,
      }
      --
      local wave_right = {
          text = function()
              return {
                  { ' ' .. sep.left_rounded, { 'waveright1', 'wavedefault' } },
                  { ' ' .. sep.left_rounded, { 'waveright2', 'waveright1' } },
                  { ' ' .. sep.left_rounded, { 'waveright3', 'waveright2' } },
                  { ' ' .. sep.left_rounded, { 'waveright4', 'waveright3' } },
                  { ' ' .. sep.left_rounded, { 'waveright5', 'waveright4' } },
                  { ' ' .. sep.left_rounded, { 'black', 'waveright5' } },
              }
          end,
          click = change_color,
      }
      --
      local default = {
          filetypes = { 'default' },
          active = {
              basic.vi_mode,
              basic.vi_mode_sep,
              { ' ', '' },
              basic.file_name,
              wave_left,
              { ' ', { 'FilenameBg', 'wavedefault' } },
              basic.divider,
              wave_right,
              basic.line_col,
              basic.progress,
          },
          inactive = {
              basic.file_name_inactive,
              basic.divider,
              basic.divider,
              basic.line_col_inactive,
              { '', { 'white', 'InactiveBg' } },
              basic.progress_inactive,
          },
      }
      --
      windline.setup({
          colors_name = function(colors)
              colors.FilenameFg = colors.white
              colors.FilenameBg = colors.black_light
          --
              colors.wavedefault = colors.white_light
              colors.waveleft1 = colors.wavedefault
              colors.waveleft2 = colors.wavedefault
              colors.waveleft3 = colors.wavedefault
              colors.waveleft4 = colors.wavedefault
              colors.waveleft5 = colors.wavedefault
              colors.waveleft6 = colors.wavedefault
              colors.waveleft7 = colors.wavedefault
              colors.waveleft8 = colors.wavedefault
              colors.waveleft9 = colors.wavedefault
              colors.waveleft10 = colors.wavedefault
              colors.waveleft11 = colors.wavedefault
              colors.waveleft12 = colors.wavedefault
              colors.waveleft13 = colors.wavedefault
              colors.waveleft14 = colors.wavedefault
              colors.waveleft15 = colors.wavedefault
              colors.waveleft16 = colors.wavedefault
              colors.waveleft17 = colors.wavedefault
              colors.waveleft18 = colors.wavedefault
              colors.waveleft19 = colors.wavedefault
              colors.waveleft20 = colors.wavedefault
          --
              colors.waveright1 = colors.wavedefault
              colors.waveright2 = colors.wavedefault
              colors.waveright3 = colors.wavedefault
              colors.waveright4 = colors.wavedefault
              colors.waveright5 = colors.wavedefault
              return colors
          end,
          statuslines = {
              default,
          },
      })
      --
      vim.defer_fn(function()
          change_color()
      end, 100)
    end
  }
}

-- Neovim keybinds

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
