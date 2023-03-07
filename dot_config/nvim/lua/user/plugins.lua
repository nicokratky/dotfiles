vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup({
  function(use)
    use('wbthomason/packer.nvim') -- package manager
    use('nvim-lua/popup.nvim') -- popup API implementation for lua
    use('nvim-lua/plenary.nvim')

    use('tpope/vim-fugitive') -- git commands in nvim
    use('tpope/vim-rhubarb') -- fugitive-companion to interact with github

    -- add git info
    use({
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end,
    })

    -- 'gc' to comment visual regions/lines
    use({
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    })

    -- colorscheme
    use({
      'RRethy/nvim-base16',
      config = function()
        vim.cmd('colorscheme base16-default-dark')
      end,
    })

    -- statusline
    use({
      'nvim-lualine/lualine.nvim',
      after = 'nvim-base16',
      config = function()
        require('user.plugins.lualine')
      end,
    })

    -- UI to select things (files, grep results, open buffers...)
    use({
      {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
          require('user.plugins.telescope')
        end,
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        after = 'telescope.nvim',
        run = 'make',
        config = function()
          require('telescope').load_extension('fzf')
        end,
      }
    })

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('user.plugins.treesitter')
      end,
    })

    use({
      'phaazon/hop.nvim',
      branch = 'v2',
      config = function()
        require('user.plugins.hop')
      end,
    })

    use('editorconfig/editorconfig-vim')
    use('tpope/vim-sleuth') -- automatically detect tabstop and shiftwidth

    use({
      'vimwiki/vimwiki',
      config = function()
        vim.g.vimwiki_list = {{ path = '~/Nextcloud/documents/vimwiki/', links_space_char = '_' }}
      end,
    })

    use({
      'lewis6991/impatient.nvim',
      config = function()
        require('impatient').enable_profile()
      end,
    })

    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})
