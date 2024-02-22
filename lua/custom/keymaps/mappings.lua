-- Toggle inlay hints
vim.keymap.set('n', '<leader>H',
	function()
		if vim.lsp.inlay_hint.is_enabled(0) then
			vim.lsp.inlay_hint.enable(0, false)
		else
			vim.lsp.inlay_hint.enable(0, true)
		end
	end
)

-- Disable mouse mode
vim.o.mouse = ''

-- Keymap for formatting code
vim.keymap.set('n', '<leader>f', function(_) vim.lsp.buf.format() end, { desc = 'Format code' })

-- Keymap to allow moving up and down selected text while in visual mode
vim.keymap.set('v', '<Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<Up>', ":m '<-2<CR>gv=gv")
--vim.keymap.set('v', '<A-l>', ":m '<-2<CR>gv=gv")
--vim.keymap.set('v', '<A-h>', ":m '<-2<CR>gv=gv")

-- Keymap for opening the file explorer
vim.keymap.set('n', '<leader>x', vim.cmd.Explore, { desc = 'Open file explorer' })
