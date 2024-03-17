return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "projekt0n/github-nvim-theme"
    use {
        "nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        tag = "nightly"
    }
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use {
        "github/copilot.vim"
    }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    -- lsp icon
    use "onsails/lspkind.nvim"
    -- lsp status
    use "nvim-lua/lsp-status.nvim"
    use "simrat39/rust-tools.nvim"
    --nvim-cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip" 
end)

