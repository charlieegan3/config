local function command_exists(cmd)
  local handle = io.popen("command -v " .. cmd .. " 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result ~= ""
end

local function is_dark_mode()
  if not command_exists("/usr/bin/defaults") then
    print("Debug message: 'defaults' command not found")
    return false
  end

  local handle = io.popen('/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null')
  local result = handle:read("*a")
  handle:close()
  return result:match('Dark') ~= nil
end

if is_dark_mode() then
  vim.o.background = 'dark'
else
  vim.o.background = 'light'
  vim.cmd('colorscheme delek')
end
