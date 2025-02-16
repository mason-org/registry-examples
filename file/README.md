# File registries

This example demonstrates how to use registries that sources package definitions from your local file system.

This example contains a single [`rust-analyzer`](./packages/rust-analyzer/package.yaml) package definition.

> [!IMPORTANT]
> In order for `mason.nvim` to be able to parse the YAML files you must have `yq` installed on your system. Tip: install
> `yq` (`:MasonInstall yq`) from the core registry before testing.

## Try it out

Make sure `yq` is installed, for example:

```sh
$ nvim --headless -c "MasonInstall yq" -c qall
```

```sh
$ nvim --clean -u init.lua -c Mason
```
