local Pkg = require("mason-core.package")

return Pkg:new({
    schema = "registry+v1",
    name = "custom-package",
    description = "custom-package is a tool that does something great.",
    categories = { "LSP", "Linter" },
    homepage = "https://github.com/example/example",
    languages = { "JavaScript" },
    licenses = { "Apache-2.0" },
    source = {
        id = "pkg:mason/custom-package@2025-02-10",
        ---@param ctx InstallContext
        install = function(ctx)
            -- Use regular Lua primitives for error handling
            local ok = pcall(ctx.spawn.bash, {
                "-c",
                [[echo "Attempting something that might fail…" && sleep 1 && exit 1]],
            })
            if not ok then
                -- Use ctx.stdio_sink to print output to the user.
                -- NOTE: You have to explicitly provide newline characters.
                ctx.stdio_sink:stderr("Process failed successfully.\n")
            end

            -- Do file system operations via ctx.fs.
            ctx.fs:mkdir("bin")
            ctx:chdir("bin", function()
                ctx.fs:write_file(
                    "hello-world.js",
                    [[
#!/usr/bin/env node
console.log("Hello World!")
                    ]]
                )
            end)

            -- Do network calls via ctx:fetch.
            ctx:fetch("https://bun.sh/install", {
                out_file = "install-bun.sh",
            })

            -- Use async functions
            ctx.stdio_sink:stdout("Sleeping for 2 seconds…\n")
            local value = ctx:await(function (resolve, reject)
                vim.defer_fn(function ()
                    ctx.stdio_sink:stdout("Done sleeping for 2 seconds.\n")
                    resolve("Sleeping is good.")
                end, 2000)
            end)
            ctx.stdio_sink:stdout("Result from ctx:await(): ")
            ctx.stdio_sink:stdout(value)
            ctx.stdio_sink:stdout("\n")

            local data = vim.json.decode(ctx:fetch("https://api.github.com/repos/mason-org/mason-registry", {
                headers = {
                    ["Accept"] = "application/vnd.github+json",
                    ["X-GitHub-Api-Version"] = "2022-11-28",
                },
            }))
            ctx.stdio_sink:stdout("Fetched GitHub repo data.\n")
            ctx.stdio_sink:stdout("Description: ")
            ctx.stdio_sink:stdout(data.description)
            ctx.stdio_sink:stdout("\n")

            ctx:await(function (resolve, reject)
                vim.defer_fn(resolve, 2500)
            end)
        end,
    },
    bin = {
        ["install-bun.sh"] = "install-bun.sh",
        ["hello-world"] = "bin/hello-world.js",
    },
})
