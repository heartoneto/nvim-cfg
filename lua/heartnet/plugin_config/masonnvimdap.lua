local mnd = require('mason-nvim-dap')

mnd.setup({
    ensure_installed = {'codelldb', 'dart-debug-adapter'},
    -- ensure_installed = {'codelldb'},
    handlers = {
        function(config)
            mnd.default_setup(config)
        end,
    },
})
