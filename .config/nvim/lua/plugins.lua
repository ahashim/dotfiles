local status, packer = pcall(require, "packer")
if not status then
    print "Packer is not installed"
    return
end

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

packer.init {
    auto_clean = true,
    compile_on_sync = true,
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "single",
            }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 6000, -- seconds
    },
}
--

return require("packer").startup(function(use)
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
    }
    use "folke/trouble.nvim"
    use "glepnir/dashboard-nvim"
    use "glepnir/lspsaga.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    }
    use "jose-elias-alvarez/null-ls.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "L3MON4D3/LuaSnip"
    use "lewis6991/gitsigns.nvim"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "navarasu/onedark.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "numToStr/Comment.nvim"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/plenary.nvim"
    use "nvim-lualine/lualine.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
    }
    use "nvim-telescope/telescope-fzf-native.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "ojroques/nvim-bufdel"
    use "rafamadriz/friendly-snippets"
    use "saadparwaiz1/cmp_luasnip"
    use "TovarishFin/vim-solidity"
    use "tpope/vim-fugitive"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "wbthomason/packer.nvim"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
