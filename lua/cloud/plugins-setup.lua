vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	-- file explorer
	"nvim-tree/nvim-tree.lua",

	-- dressing
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	--
	-- notify
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},

	-- colorscheme
	"folke/tokyonight.nvim",
	"rebelot/kanagawa.nvim",
	"bluz71/vim-nightfly-guicolors",
	"gustavo-hms/garbo",
	"Tsuzat/NeoSolarized.nvim",
	-- use("overcache/NeoSolarized")

	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restore current windo,

	-- essential plugins
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",

	-- db
	"tpope/vim-dadbod",

	-- db ui
	"kristijanhusak/vim-dadbod-ui",

	-- db completion
	"kristijanhusak/vim-dadbod-completion",

	-- commenting with gc
	"numToStr/Comment.nvim",

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- bufferline
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	-- status line
	"nvim-lualine/lualine.nvim",

	-- vim ls
	-- use("prabirshrestha/vim-lsp")
	-- use("mattn/vim-lsp-settings")

	-- fuzzy finding & lazygit
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	-- toggle term
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},

	-- autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			-- snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
	},

	-- managing & installing  lsp servers
	{ "williamboman/mason.nvim", dependencies = "williamboman/mason-lspconfig.nvim" },

	-- configuring lsp servers
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
	},

	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- nui nvim
	{ "MunifTanjim/nui.nvim" },

	-- noice nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			"rcarriga/nvim-notify",
		},
	},
	-- use({ "glepnir/lspsaga.nvim", branch = "main" })
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",
	-- use("MunifTanjim/prettier.nvim")

	-- lightbulb
	"kosayoda/nvim-lightbulb",
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- colorizer
	"NvChad/nvim-colorizer.lua",

	-- auto closing
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- git signs plugins
	"lewis6991/gitsigns.nvim",
})
