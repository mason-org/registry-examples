# Lua registries

This example demonstrates how to use registries that sources package definitions from Lua.

This example contains a [`rust-analyzer`](./lua/my-mason-registry/rust-analyzer.lua) package definition as well as a
[`custom-package`](./lua/my-mason-registry/custom-package.lua) package definition which contains a custom install
script in Lua.

## Try it out

```sh
$ nvim --clean -u init.lua -c Mason
```
