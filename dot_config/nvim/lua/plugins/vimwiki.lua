return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Nextcloud/documents/vimwiki/",
				links_space_char = "_",
				syntax = "markdown",
				ext = ".md",
			},
		}
		vim.g.vimwiki_global_ext = 0
	end,
}
