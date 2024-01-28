local home = os.getenv("HOME")

local jdtls_dir = vim.fn.stdpath(home .. "/.local/share/nvim/mason/packages/jdtls")
local plugins_dir = jdtls_dir .. "/plugins"
local path_to_jar = plugins_dir .. "org.eclipse.equinox.launcher_*.jar"

-- Determine OS
if vim.fn.has("mac") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "linux"
else
	print("Unsupported system")
end

-- Find the root of the project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		-- 💀
		home .. ".asdf/installs/java/openjdk-17.0.2/bin/java", -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. jdtls_dir .. "/lombok.jar",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED", -- 💀
		"-jar",
		path_to_jar,
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},

	root_dir = root_dir,

	settings = {
		["java.format.settings.url"] = home .. "/.config/nvim/formatters/eclipse-java-google-style.xml",
		["java.format.settings.profile"] = "GoogleStyle",
		java = {
			-- jdt = {
			--   ls = {
			--     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
			--   }
			-- },
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
			references = { includeDecompiledSources = true },
			format = {
				enabled = true,
				-- settings = { url = home .. "/.config/nvim/formatters/java-google-formatter.xml" },
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
		configuration = {
			runtime = {
				{
					name = "JavaSE-17",
					path = home .. "/.asdf/installs/java/openjdk-17.0.2",
				},
				{
					name = "JavaSE-14",
					path = home .. "/.asdf/installs/java/openjdk-17.0.2",
				},
				{
					name = "JavaSE-13",
					path = home .. "/.asdf/installs/java/openjdk-13.0.2",
				},
				{
					name = "JavaSE-11",
					path = home .. "/.asdf/installs/java/openjdk-11.0.2",
				},
				{
					name = "JavaSE-10",
					path = home .. "/.asdf/installs/java/openjdk-10.0.2",
				},
				{
					name = "JavaSE-1.8",
					path = home .. "/.asdf/installs/java/adoptopenjdk-8.0.382+5",
				},
			},
		},
		flags = {
			allow_incremental_sync = true,
		},
		init_options = {
			bundles = {},
		},
	},
}

-- local config = {
-- 	cmd = { "/home/profkache/.local/share/nvim/mason/bin/jdtls" },
-- 	root_dir = vim.fs.dirname(
-- 		vim.fs.find({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }, { upward = true })[1]
-- 	),
-- }

require("jdtls").start_or_attach(config)
