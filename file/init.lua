vim.opt.packpath:append(vim.fn.fnamemodify(vim.fn.getcwd(), ":h"))

require("mason").setup {
    registries = {
        "file:" .. vim.fn.getcwd()
    }
}
