-- Function to set the PYTHONPATH based on the project location
local function set_python_path()
	-- Get the current working directory i.e project root
	local project_root = vim.fn.getcwd()

	-- Define the path for virtual environment's site-packages directory
	-- local venv_path = project_root .. "/.venv/lib/python3.12/site-packages/"

	-- List of all the possible site-packages to check
	local possible_paths = {
		project_root .. "/.venv/lib/python3.10/site-packages/",
		project_root .. "/.venv/lib/python3.11/site-packages/",
		project_root .. "/.venv/lib/python3.12/site-packages/",
		project_root .. "/.venv/lib/python3.13/site-packages/",
		project_root .. "/.venv/lib/python3.14/site-packages/",
	}

	-- Iterate over the paths and set PYTHONPATH to the first valid path
	for _, path in ipairs(possible_paths) do
		-- Check if virtual environment directory exists
		if vim.fn.isdirectory(path) == 1 then
			-- Set the PYTHONPATH environment variable to the virtualenv site-packages
			vim.env.PYTHONPATH = path
			return -- Stop checking after setting the first valid path
		end
	end

	vim.env.PYTHONPATH = nil -- Optionally clear PYTHONPATH if no path found
end

set_python_path()
