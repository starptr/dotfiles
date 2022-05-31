-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/yuto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/yuto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/yuto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/yuto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/yuto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nú\2\0\0\r\0\17\1&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0016\1\0\0'\3\4\0B\1\2\0029\1\3\0015\3\14\0004\4\3\0009\5\5\0006\a\6\0B\a\1\2'\b\a\0B\5\3\2>\5\1\0049\5\5\0006\a\b\0B\a\1\2'\b\t\0'\t\n\0'\n\v\0'\v\f\0'\f\r\0B\5\a\0?\5\0\0=\4\15\3B\1\2\0016\1\0\0'\3\16\0B\1\2\0029\1\3\1B\1\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\rsnippets\19get_config_dir\15join_paths luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\15lvim.utils\frequire\5€€À™\4\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dap-buddy.nvim"] = {
    config = { "\27LJ\2\nž\a\0\0\6\0\31\0I6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\28\0'\4\29\0005\5\30\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2)<Cmd>lua require'dap'.step_out()<CR>\n<F12>\1\0\2\vsilent\2\fnoremap\2*<Cmd>lua require'dap'.step_into()<CR>\n<F11>\1\0\2\vsilent\2\fnoremap\2*<Cmd>lua require'dap'.step_over()<CR>\n<F10>\1\0\2\vsilent\2\fnoremap\2.<Cmd>lua require'dap'.run_to_cursor()<CR>\t<F8>\1\0\2\vsilent\2\fnoremap\0022<Cmd>lua require'dap'.toggle_breakpoint()<CR>\t<F9>\1\0\2\vsilent\2\fnoremap\2&<Cmd>lua require'dap'.pause()<CR>\t<F6>\1\0\2\vsilent\2\fnoremap\2C<Cmd>lua require'dap'.terminate(); require'dap'.run_last()<CR>\t<F4>\1\0\2\vsilent\2\fnoremap\2*<Cmd>lua require'dap'.terminate()<CR>\t<F3>\1\0\2\vsilent\2\fnoremap\2)<Cmd>lua require'dap'.continue()<CR>\t<F5>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/dap-buddy.nvim",
    url = "https://github.com/Pocco81/dap-buddy.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n#\0\1\2\0\2\0\5)\1\2\0=\1\0\0)\1ÿÿ=\1\1\0K\0\1\0\bcol\brow`\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\ninput\1\0\0\roverride\1\0\0\0\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    commands = { "GitBlameToggle", "GitBlameEnable", "GitBlameCopySHA", "GitBlameOpenCommitURL" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n“\1\0\1\6\0\t\0\0206\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0'\5\4\0&\3\5\3B\1\2\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0\18\4\0\0B\1\3\0016\1\0\0009\1\1\0019\1\2\1'\3\b\0B\1\2\1K\0\1\0\18:OSCYankReg +\6+\vsetreg\afn\6'\15let @\" = '\17nvim_command\bapi\bvimg\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\topts\20action_callback\1\0\0\0\1\0\0\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["legendary.nvim"] = {
    config = { "\27LJ\2\nÈ\4\0\0\6\0\24\0.6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\a\0006\5\3\0009\5\4\0059\5\5\0059\5\6\5=\5\6\0046\5\3\0009\5\4\0059\5\5\0059\5\b\5=\5\b\4=\4\5\3B\1\2\0019\1\n\0004\3\a\0005\4\v\0005\5\f\0=\5\r\4>\4\1\0035\4\14\0005\5\15\0=\5\r\4>\4\2\0035\4\16\0005\5\17\0=\5\r\4>\4\3\0035\4\18\0005\5\19\0=\5\r\4>\4\4\0035\4\20\0005\5\21\0=\5\r\4>\4\5\0035\4\22\0005\5\23\0=\5\r\4>\4\6\3B\1\2\1K\0\1\0\1\2\0\0\6i\1\3\1\0\n<M-b>\b\27bi\16description\27Start of previous word\1\2\0\0\6i\1\3\1\0\n<M-f>\b\27wi\16description\23Start of next word\1\2\0\0\6i\1\3\1\0\n<C-b>\v<Left>\16description\14Move left\1\2\0\0\6i\1\3\1\0\n<C-f>\f<Right>\16description\15Move right\1\2\0\0\6i\1\3\1\0\n<C-e>\v<C-o>A\16description\16End of line\tmode\1\3\0\0\6i\6c\1\3\1\0\n<C-a>\v<C-o>0\16description\18Start of line\17bind_keymaps\1\0\0\topts\1\0\1\15do_binding\1\rmappings\14which_key\fbuiltin\tlvim\nsetup\14legendary\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n§\1\0\0\3\0\t\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0005\1\b\0=\1\a\0K\0\1\0\1\3\0\0*<cmd>lua require 'dapui'.toggle()<cr>\19Toggle Sidebar\adv\rmappings\14which_key\fbuiltin\tlvim\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21lvim.core.notify\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["structlog.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/structlog.nvim",
    url = "https://github.com/Tastyep/structlog.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0" },
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle", "Trouble" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-oscyank"] = {
    commands = { "OSCYank", "OSCYankReg" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/vim-oscyank",
    url = "https://github.com/ojroques/vim-oscyank"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yuto/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^lua%-dev"] = "lua-dev.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: vim-oscyank
time([[Setup for vim-oscyank]], true)
try_loadstring("\27LJ\2\nÒ\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\6\4=\4\v\3>\3\2\2B\0\2\1K\0\1\0\6v\1\0\1\fnoremap\2\1\2\0\0\17:OSCYank<CR>\6n\1\0\0\topts\1\0\1\fnoremap\2\1\2\0\0\17:OSCYank<CR>\1\2\1\0\agy\16description\20Copy with OSC52\16bind_keymap\14legendary\frequire\0", "setup", "vim-oscyank")
time([[Setup for vim-oscyank]], false)
-- Setup for: gitlinker.nvim
time([[Setup for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17get_repo_url\14gitlinker\frequireM\0\0\4\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0004\3\0\0B\0\3\1K\0\1\0\6v\22get_buf_range_url\14gitlinker\frequireÂ\1\1\0\6\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0005\4\5\0003\5\4\0>\5\1\4=\4\a\0035\4\t\0003\5\b\0>\5\1\4=\4\n\3>\3\2\2B\0\2\1K\0\1\0\6v\1\0\1\16description\31Remote repo url with lines\0\6n\1\0\0\1\0\1\16description\20Remote repo url\0\1\2\0\0\agh\16bind_keymap\14legendary\frequire\0", "setup", "gitlinker.nvim")
time([[Setup for gitlinker.nvim]], false)
time([[packadd for gitlinker.nvim]], true)
vim.cmd [[packadd gitlinker.nvim]]
time([[packadd for gitlinker.nvim]], false)
-- Setup for: git-blame.nvim
time([[Setup for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n‡\2\0\0\3\0\n\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0/highlight GitBlame ctermfg=grey guifg=grey\bcmd\rGitBlame\29gitblame_highlight_group+ è‘—è€… <author>, <date> â€¢ <summary>\30gitblame_message_template\19%m/%d/%y %H:%M\25gitblame_date_format\6g\bvim\0", "setup", "git-blame.nvim")
time([[Setup for git-blame.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n§\1\0\0\3\0\t\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0005\1\b\0=\1\a\0K\0\1\0\1\3\0\0*<cmd>lua require 'dapui'.toggle()<cr>\19Toggle Sidebar\adv\rmappings\14which_key\fbuiltin\tlvim\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: dap-buddy.nvim
time([[Config for dap-buddy.nvim]], true)
try_loadstring("\27LJ\2\nž\a\0\0\6\0\31\0I6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\28\0'\4\29\0005\5\30\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2)<Cmd>lua require'dap'.step_out()<CR>\n<F12>\1\0\2\vsilent\2\fnoremap\2*<Cmd>lua require'dap'.step_into()<CR>\n<F11>\1\0\2\vsilent\2\fnoremap\2*<Cmd>lua require'dap'.step_over()<CR>\n<F10>\1\0\2\vsilent\2\fnoremap\2.<Cmd>lua require'dap'.run_to_cursor()<CR>\t<F8>\1\0\2\vsilent\2\fnoremap\0022<Cmd>lua require'dap'.toggle_breakpoint()<CR>\t<F9>\1\0\2\vsilent\2\fnoremap\2&<Cmd>lua require'dap'.pause()<CR>\t<F6>\1\0\2\vsilent\2\fnoremap\2C<Cmd>lua require'dap'.terminate(); require'dap'.run_last()<CR>\t<F4>\1\0\2\vsilent\2\fnoremap\2*<Cmd>lua require'dap'.terminate()<CR>\t<F3>\1\0\2\vsilent\2\fnoremap\2)<Cmd>lua require'dap'.continue()<CR>\t<F5>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "dap-buddy.nvim")
time([[Config for dap-buddy.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21lvim.core.notify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: legendary.nvim
time([[Config for legendary.nvim]], true)
try_loadstring("\27LJ\2\nÈ\4\0\0\6\0\24\0.6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\a\0006\5\3\0009\5\4\0059\5\5\0059\5\6\5=\5\6\0046\5\3\0009\5\4\0059\5\5\0059\5\b\5=\5\b\4=\4\5\3B\1\2\0019\1\n\0004\3\a\0005\4\v\0005\5\f\0=\5\r\4>\4\1\0035\4\14\0005\5\15\0=\5\r\4>\4\2\0035\4\16\0005\5\17\0=\5\r\4>\4\3\0035\4\18\0005\5\19\0=\5\r\4>\4\4\0035\4\20\0005\5\21\0=\5\r\4>\4\5\0035\4\22\0005\5\23\0=\5\r\4>\4\6\3B\1\2\1K\0\1\0\1\2\0\0\6i\1\3\1\0\n<M-b>\b\27bi\16description\27Start of previous word\1\2\0\0\6i\1\3\1\0\n<M-f>\b\27wi\16description\23Start of next word\1\2\0\0\6i\1\3\1\0\n<C-b>\v<Left>\16description\14Move left\1\2\0\0\6i\1\3\1\0\n<C-f>\f<Right>\16description\15Move right\1\2\0\0\6i\1\3\1\0\n<C-e>\v<C-o>A\16description\16End of line\tmode\1\3\0\0\6i\6c\1\3\1\0\n<C-a>\v<C-o>0\16description\18Start of line\17bind_keymaps\1\0\0\topts\1\0\1\15do_binding\1\rmappings\14which_key\fbuiltin\tlvim\nsetup\14legendary\frequire\0", "config", "legendary.nvim")
time([[Config for legendary.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nú\2\0\0\r\0\17\1&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0016\1\0\0'\3\4\0B\1\2\0029\1\3\0015\3\14\0004\4\3\0009\5\5\0006\a\6\0B\a\1\2'\b\a\0B\5\3\2>\5\1\0049\5\5\0006\a\b\0B\a\1\2'\b\t\0'\t\n\0'\n\v\0'\v\f\0'\f\r\0B\5\a\0?\5\0\0=\4\15\3B\1\2\0016\1\0\0'\3\16\0B\1\2\0029\1\3\1B\1\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\rsnippets\19get_config_dir\15join_paths luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\15lvim.utils\frequire\5€€À™\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n#\0\1\2\0\2\0\5)\1\2\0=\1\0\0)\1ÿÿ=\1\1\0K\0\1\0\bcol\brow`\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\ninput\1\0\0\roverride\1\0\0\0\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n“\1\0\1\6\0\t\0\0206\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0'\5\4\0&\3\5\3B\1\2\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0\18\4\0\0B\1\3\0016\1\0\0009\1\1\0019\1\2\1'\3\b\0B\1\2\1K\0\1\0\18:OSCYankReg +\6+\vsetreg\afn\6'\15let @\" = '\17nvim_command\bapi\bvimg\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\topts\20action_callback\1\0\0\0\1\0\0\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitBlameEnable lua require("packer.load")({'git-blame.nvim'}, { cmd = "GitBlameEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitBlameCopySHA lua require("packer.load")({'git-blame.nvim'}, { cmd = "GitBlameCopySHA", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitBlameOpenCommitURL lua require("packer.load")({'git-blame.nvim'}, { cmd = "GitBlameOpenCommitURL", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file OSCYank lua require("packer.load")({'vim-oscyank'}, { cmd = "OSCYank", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file OSCYankReg lua require("packer.load")({'vim-oscyank'}, { cmd = "OSCYankReg", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitBlameToggle lua require("packer.load")({'git-blame.nvim'}, { cmd = "GitBlameToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-ts-context-commentstring'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'Comment.nvim', 'gitsigns.nvim', 'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim', 'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
