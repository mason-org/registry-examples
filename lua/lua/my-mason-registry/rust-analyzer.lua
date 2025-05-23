return {
    name = "rust-analyzer",
    description = "rust-analyzer is an implementation of the Language Server Protocol for the\nRust programming language. It provides features like completion and goto\ndefinition for many code editors, including VS Code, Emacs and Vim.\n",
    categories = { "LSP" },
    homepage = "https://github.com/rust-lang/rust-analyzer",
    languages = { "Rust" },
    licenses = { "Apache-2.0", "MIT" },
    schemas = {
        lsp = "vscode:https://raw.githubusercontent.com/rust-analyzer/rust-analyzer/{{version}}/editors/code/package.json"
    },
    source = {
        id = "pkg:github/rust-lang/rust-analyzer@2025-02-10",
        asset = { {
            bin = "rust-analyzer-x86_64-unknown-linux-gnu",
            file = "rust-analyzer-x86_64-unknown-linux-gnu.gz",
            target = "linux_x64_gnu"
        }, {
            bin = "rust-analyzer-aarch64-unknown-linux-gnu",
            file = "rust-analyzer-aarch64-unknown-linux-gnu.gz",
            target = "linux_arm64_gnu"
        }, {
            bin = "rust-analyzer-x86_64-unknown-linux-musl",
            file = "rust-analyzer-x86_64-unknown-linux-musl.gz",
            target = "linux_x64_musl"
        }, {
            bin = "rust-analyzer-x86_64-apple-darwin",
            file = "rust-analyzer-x86_64-apple-darwin.gz",
            target = "darwin_x64"
        }, {
            bin = "rust-analyzer-aarch64-apple-darwin",
            file = "rust-analyzer-aarch64-apple-darwin.gz",
            target = "darwin_arm64"
        }, {
            bin = "rust-analyzer.exe",
            file = "rust-analyzer-x86_64-pc-windows-msvc.zip",
            target = "win_x64"
        }, {
            bin = "rust-analyzer.exe",
            file = "rust-analyzer-aarch64-pc-windows-msvc.zip",
            target = "win_arm64"
        } },
    },
    bin = {
        ["rust-analyzer"] = "{{source.asset.bin}}"
    },
}
