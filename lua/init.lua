vim.opt.packpath:append(vim.fn.fnamemodify(vim.fn.getcwd(), ":h"))
vim.opt.rtp:append(vim.fn.getcwd())

require("mason").setup {
    registries = {
        "lua:my-mason-registry"
    }
}
