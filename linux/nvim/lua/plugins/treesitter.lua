return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function ()
	require('nvim-treesitter.config').setup({
	    ensure_installed = {'java', 'javascript', 'json', 'yaml' },
	    highlight = { enable = true },
	})
    end,
}
