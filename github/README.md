# GitHub registries

GitHub registries are the default and recommended registry protocol for `mason.nvim`. Refer to the [core
registry](https://github.com/mason-org/mason-registry) for a full example.

## Enabling Renovate

To enable Renovate you'll need to install the [Renovate app](https://github.com/apps/renovate) in the repository. To
ensure that Renovate is able to understand the repository structure you also need to extend the [registry Renovate
config](https://github.com/mason-org/registry-renovate-config):

```sh
$ cat renovate.json
{
  "extends": ["github>mason-org/registry-renovate-config"]
}
```

Refer to the [registry Renovate config](https://github.com/mason-org/registry-renovate-config) for more information.

## Automating releases

Automated releases are achieved via GitHub Workflows, see [release.yaml](./workflows/release.yaml). To enable this
workflow, place the contents inside `.github/workflows/release.yaml` of you registry.

## Enabling CI

You may also choose to implement the package test suite in your registry's CI pipeline. See
[package-tests.yaml](./workflows/package-tests.yaml) for a complete GitHub workflow.

> [!NOTE]
> The package test suite runs on many different runners in parallel and can quite quickly use up your GitHub plan if
> your action usage is metered.

There are no examples provided here as this is the default registry protocol provided by `mason.nvim`.
