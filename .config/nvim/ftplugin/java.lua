-- JDTLS (Java LSP) configuration
local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.env.HOME .. "/jdtls-workspace/" .. project_name

-- Needed for debugging
local bundles = {
	vim.fn.glob(
		vim.env.HOME .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"
	),
}

-- Needed for running/debugging unit tests
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(vim.env.HOME .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n")
)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. vim.env.HOME .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Eclipse jdtls location
		"-jar",
		vim.env.HOME .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
		-- TODO Update this to point to the correct jdtls subdirectory for your OS (config_linux, config_mac, config_win, etc)
		"-configuration",
		vim.env.HOME .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
		workspace_dir,
	},

	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	settings = {
		java = {
			-- TODO Replace this with the absolute path to your main java version (JDK 17 or higher)
			home = vim.env.HOME .. "/.asdf/installs/java/openjdk-17.0.2",
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				-- TODO Update this by adding any runtimes that you need to support your Java projects and removing any that you don't have installed
				-- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = vim.env.HOME .. "/.asdf/installs/java/adoptopenjdk-8.0.452+9",
					},
					{
						name = "JavaSE-11",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-11.0.2",
					},
					{
						name = "JavaSE-13",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-13.0.2",
					},
					{
						name = "JavaSE-15",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-15.0.2",
					},
					{
						name = "JavaSE-17",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-17.0.2",
					},
					{
						name = "JavaSE-19",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-19.0.2",
					},
					{
						name = "JavaSE-21",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-21.0.2",
					},
					{
						name = "JavaSE-22",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-22.0.2",
					},
					{
						name = "JavaSE-24",
						path = vim.env.HOME .. "/.asdf/installs/java/openjdk-24.0.1",
					},
				},
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
			signatureHelp = { enabled = true },
			format = {
				enabled = true,
				-- Formatting works by default, but you can refer to a specific file/URL if you choose
				-- settings = {
				--   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
				--   profile = "GoogleStyle",
				-- },
			},
		},
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
			importOrder = {
				"java",
				"javax",
				"com",
				"org",
			},
		},
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
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
	-- Needed for auto-completion with method signatures and placeholders
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		-- References the bundles defined above to support Debugging and Unit Testing
		bundles = bundles,
	},
}

-- Needed for debugging
config["on_attach"] = function(client, bufnr)
	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)

-- =================================================================================

-- Custom commands to create Java Class, Package, Abstract Class, Interface, and Enums

-- =================================================================================

-- Helper: scan packages under src/main/java and return as dot-separated names
local function complete_java_packages(arg_lead, _, _)
	local results = {}
	local base_path = "src/main/java/"

	local scan = vim.loop.fs_scandir(base_path)
	if not scan then
		return results
	end

	local function scan_dir(path, prefix)
		local fs = vim.loop.fs_scandir(path)
		if not fs then
			return
		end
		while true do
			local name, type = vim.loop.fs_scandir_next(fs)
			if not name then
				break
			end
			if type == "directory" then
				local new_prefix = prefix .. "." .. name
				if new_prefix:sub(1, 1) == "." then
					new_prefix = new_prefix:sub(2)
				end
				table.insert(results, new_prefix)
				scan_dir(path .. "/" .. name, new_prefix)
			end
		end
	end

	scan_dir(base_path, "")
	return vim.tbl_filter(function(item)
		return vim.startswith(item, arg_lead)
	end, results)
end

-- Create a Java class/interface/abstract/enum
vim.api.nvim_create_user_command("CreateJavaClass", function(opts)
	local args = vim.split(opts.args, " ")
	if #args < 2 then
		print("Usage: :CreateJavaClass <package.name> <ClassName> [class|interface|abstract|enum]")
		return
	end

	local package = args[1]
	local class_name = args[2]
	local kind = args[3] or "class"

	local valid_kinds = { class = true, interface = true, abstract = true, enum = true }
	if not valid_kinds[kind] then
		print("Invalid type. Use: class, interface, abstract, or enum")
		return
	end

	local package_path = package:gsub("%.", "/")
	local full_path = "src/main/java/" .. package_path
	local full_file = full_path .. "/" .. class_name .. ".java"

	vim.fn.mkdir(full_path, "p")

	if vim.fn.filereadable(full_file) == 1 then
		print("File already exists: " .. full_file)
		return
	end

	local lines = { "package " .. package .. ";", "" }

	if kind == "interface" then
		table.insert(lines, "public interface " .. class_name .. " {")
		table.insert(lines, "    // TODO: define methods")
	elseif kind == "abstract" then
		table.insert(lines, "public abstract class " .. class_name .. " {")
		table.insert(lines, "    // TODO: implement")
	elseif kind == "enum" then
		table.insert(lines, "public enum " .. class_name .. " {")
		table.insert(lines, "    VALUE1, VALUE2;")
	else
		table.insert(lines, "public class " .. class_name .. " {")
		table.insert(lines, "    // TODO: implement")
	end

	table.insert(lines, "}")
	vim.fn.writefile(lines, full_file)
	-- print("Created Java " .. kind .. ": " .. full_file)
	vim.notify("Created Java " .. kind .. ":\n" .. full_file, vim.log.levels.INFO, { title = "Java Class" })
	vim.cmd("edit " .. full_file)
end, {
	nargs = "+",
	complete = function(arg_lead)
		return complete_java_packages(arg_lead)
	end,
	desc = "Create a new Java class/interface/abstract/enum in a package",
})

-- Create Java package
vim.api.nvim_create_user_command("CreateJavaPackage", function(opts)
	local package = opts.args
	if package == nil or package == "" then
		print("Usage: :CreateJavaPackage <package.name>")
		return
	end

	local package_path = package:gsub("%.", "/")
	local full_path = "src/main/java/" .. package_path

	vim.fn.mkdir(full_path, "p")
	-- print("Created package directory: " .. full_path)
	vim.notify("Created package directory:\n" .. full_path, vim.log.levels.INFO, { title = "Java Package" })
end, {
	nargs = 1,
	complete = function(arg_lead)
		return complete_java_packages(arg_lead)
	end,
	desc = "Create a new Java package directory",
})
