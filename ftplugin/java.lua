local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

-- local home = os.getenv("HOME")
-- local workspace_dir = home .. "/Workspace/projects/" .. project_name
local nvim_data = vim.fn.stdpath("data") .. '/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/home/lxj/Workspace/projects/" .. project_name
local jdtls_dir = nvim_data .. "mason/packages/jdtls/"

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local bundles = {
  vim.fn.glob(
    nvim_data .. 'mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
    1),
}
vim.list_extend(bundles,
  vim.split(vim.fn.glob(nvim_data .. "mason/packages/java-test/extension/server/*.jar", 1), "\n"))
local config = {
  cmd = {
    "java", -- or '/path/to/java11_or_newer/bin/java'
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. jdtls_dir .. "lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    jdtls_dir .. "plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    jdtls_dir .. "config_linux",
    "-data",
    workspace_dir,
  },
  --  capabilities = capabilities,
  root_dir = root_dir,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = true,
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    contentProvider = { preferred = "fernflower" },
    -- extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = bundles
  },
}

config['on_attach'] = function()
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require('jdtls.dap').setup_dap_main_class_configs()
  require('dap.ext.vscode').load_launchjs()
end

require('jdtls').start_or_attach(config)
