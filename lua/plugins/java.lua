-- jdtls itself needs Java >= 21 to run, regardless of which JDK a given
-- project builds with (JAVA_HOME may be set to 8/11/17 per-project via sdkman).
-- Resolve a Java 21 runtime independently so switching project JDKs doesn't
-- break the language server.
local function find_java21()
    if vim.fn.executable("/usr/libexec/java_home") == 1 then
        local out = vim.fn.system({ "/usr/libexec/java_home", "-v", "21" })
        if vim.v.shell_error == 0 then
            return vim.trim(out) .. "/bin/java"
        end
    end
    return nil
end

return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
        local jdtls = require("jdtls")
        local home = os.getenv("HOME")
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = home .. "/.local/share/jdtls/workspaces/" .. project_name

        local cmd = {
            "jdtls",
            "-data", workspace_dir,
        }
        local java21 = find_java21()
        if java21 then
            vim.list_extend(cmd, { "--java-executable", java21 })
        end

        jdtls.start_or_attach({
            cmd = cmd,
            root_dir = vim.fs.dirname(
                vim.fs.find({ "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }, { upward = true })[1]
            ),
            settings = {
                java = {
                    format = { enabled = true },
                    completion = { importOrder = { "java", "javax", "com", "org" } },
                },
            },
            init_options = {
                bundles = {},
            },
        })
    end,
}
