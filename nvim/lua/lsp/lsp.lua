local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local lspkind = require("lspkind")

lsp_status.register_progress()

-- configure lsp-status
lsp_status.config {
    kind_labels = lspkind.symbol_map,
    status_symbol = "",
    indicator_errors = 'error',
    indicator_warnings = 'warn',
    indicator_info = 'info',
    indicator_hint = 'hint',
    indicator_ok = 'ok'
}

--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
--
---- Mappings.
---- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--    -- status
--    lsp_status.on_attach(client)
--    -- Enable completion triggered by <c-x><c-o>
--    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--    -- Mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local bufopts = { noremap=true, silent=true, buffer=bufnr }
--    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--    vim.keymap.set('n', '<space>wl', function()
--        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--    end, bufopts)
--    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
--end


local servers = {
    "rust_analyzer", "zls", "serve_d",
    "gopls", "pyright", "hls",
    "html", "cssls", "eslint", "jsonls",
    "cmake"
}

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        single_file_support = true,
    }
end

lspconfig.clangd.setup {
    cmd = { "clangd", "--header-insertion=never" }
}

lspconfig.qmlls.setup {
    cmd = { "qmlls6" },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

