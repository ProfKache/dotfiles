-- In init.lua
-- vim.lsp.config("djls", {
-- 	cmd = { "djls", "serve" },
-- 	filetypes = { "htmldjango", "html" },
-- 	root_markers = { "manage.py", "pyproject.toml", ".git" },
-- 	init_options = {
-- 		django_settings_module = "myproject.settings",
-- 		venv_path = "/path/to/venv",
-- 	},
-- })
--
-- vim.lsp.enable("djls")
local function get_project_root(fname)
	return vim.fs.root(fname, {
		"manage.py",
		"pyproject.toml",
		".git",
	})
end

local function find_venv(project_root)
	local possible_paths = {
		project_root .. "/.venv",
		project_root .. "/venv",
	}

	for _, path in ipairs(possible_paths) do
		if vim.fn.isdirectory(path) == 1 then
			return path
		end
	end

	return nil
end

local function find_django_settings_module(project_root)
	-- Find all settings.py files in the project
	local settings_files = vim.fs.find("settings.py", {
		path = project_root,
		type = "file",
		limit = 1,
	})

	if #settings_files == 0 then
		return nil
	end

	local settings_file = settings_files[1]

	-- Get directory containing settings.py
	local settings_dir = vim.fs.dirname(settings_file)

	-- Convert:
	-- /project/myproject/settings.py
	--
	-- into:
	-- myproject.settings

	local relative_path = vim.fs.relpath(project_root, settings_dir)

	if not relative_path then
		return nil
	end

	return relative_path:gsub("/", ".") .. ".settings"
end

vim.lsp.config("djls", {
	cmd = { "djls", "serve" },

	filetypes = {
		"htmldjango",
		"html",
	},

	root_markers = {
		"manage.py",
		"pyproject.toml",
		".git",
	},

	before_init = function(_, config)
		local root = config.root_dir

		if not root then
			root = get_project_root(vim.api.nvim_buf_get_name(0))
		end

		if not root then
			return
		end

		local venv_path = find_venv(root)
		local django_settings_module = find_django_settings_module(root)

		config.init_options = {
			django_settings_module = django_settings_module,
			venv_path = venv_path,
		}
	end,
})

vim.lsp.enable("djls")
