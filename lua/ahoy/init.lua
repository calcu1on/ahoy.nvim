-- Cuz you gotta have a utils.
local utils = require "ahoy.utils"

local M = {}

local config = {
  dest_dir = '~/Notes/',
}

-- Maybe at some point can use this to self render.
-- M.buffer_to_string = function()
--     local buf_content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
--     for k, line in pairs(buf_content) do
--       print(k, line)
--     end
--     -- P(content)
--     -- return table.concat(content, "\n")
-- end

-- Check if the file is markdown or not.
M.save_file = function()
  local path = vim.api.nvim_buf_get_name(0)
  local type = vim.bo.filetype 
  if (type ~= 'markdown')
  then
    error("File is not a markdown file.")
  else
    local filename = utils.get_file_name(path)
    local dest_filename = string.gsub(filename, ".md", ".pdf")
    local destination = config.dest_dir .. dest_filename
    -- using pandoc for a start, eventually would like custom renderers
    local command = "pandoc -i " .. path .. " -o " .. destination
    os.execute(command)
    print("File saved to " .. destination)
  end
end

-- M.setup = function(opts)
--   if (opts.dest_dir) then
--     M.config.dest_dir = opts.dest_dir
--   end
-- end

return M

