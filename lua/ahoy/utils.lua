local utils = {}

utils.get_file_name = function(path)
  local t = {}
  local sep = '/'
  for i in string.gmatch(path, "([^"..sep.."]+)") do
    table.insert(t, i)
  end
  return t[#t]
end

return utils
