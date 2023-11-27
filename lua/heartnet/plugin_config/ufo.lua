local ufo = require('ufo')

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- local caps = vim.lsp.protocol.make_client_capabilities()
-- caps.textDocument.foldingRange = {
-- 	dynamicRegistration = false,
-- 	lineFoldingOnly = true,
-- }
--
-- local lang_servers = lsp.util.available_servers()
--
-- for _, ls in ipairs(lang_servers) do
-- 	lsp[ls].setup({ capabilities = caps })
-- end

ufo.setup()

