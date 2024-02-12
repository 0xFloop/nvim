-- this autocmd prevents neovim from crashing on large single line json files (ie foundry build files) by auto formatting them on opening.
-- requires that jq is installed on your machine
local jsonGroup = vim.api.nvim_create_augroup("JsonLoadFix", { clear = true })
vim.api.nvim_create_autocmd("FileType",
	{
		command = "%!jq .",
		group =
		    jsonGroup,
		pattern = "json"
	})

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = opts.num,
	})
end

sign({ name = 'DiagnosticSignError', text = 'f' })

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		border = 'rounded',
		source = 'always',
		header = 'Oopsies List: \n',
	},
})
