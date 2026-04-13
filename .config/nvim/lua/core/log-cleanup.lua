-- Limit log file size to prevent runaway growth
local home = os.getenv("HOME")
local log_path = home .. "/.local/state/nvim/nvim.log"
local MAX_LOG_SIZE_MB = 1024 -- 1GB in MB
local MAX_LOG_SIZE_BYTES = MAX_LOG_SIZE_MB * 1024 * 1024

if vim.fn.filereadable(log_path) == 1 then
	local size = vim.fn.getfsize(log_path)
	if size > MAX_LOG_SIZE_BYTES then
		vim.fn.delete(log_path)
	end
end
