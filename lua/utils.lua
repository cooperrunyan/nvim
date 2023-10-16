local M = {}

M.trim = function(s)
  return s:match("^%s*(.-)%s*$")
end

M.raw_clock_speed = function()
  return vim.loop.cpu_info()[1].speed
end

M.fmt_fixed = function(v)
  return string.format("%.2f", v)
end

M.clock_speed = function()
  local speed = M.raw_clock_speed()
  if speed > 1000 then
    speed = speed / 1000
    return M.fmt_fixed(speed) .. "Ghz"
  else
    return string.format("%i", speed) .. "Mhz"
  end
end

M.fmt_mem = function(bytes)
  if bytes < 1024 then
    return string.format("%i", bytes) .. "b"
  end
  local kb = bytes / 1024
  if kb < 1024 then
    return M.fmt_fixed(kb) .. "Kb"
  end
  local mb = kb / 1024
  if mb < 1024 then
    return M.fmt_fixed(mb) .. "Mb"
  end
  local gb = mb / 1024
  return M.fmt_fixed(gb) .. "Gb"
end

M.total_ram = function()
  return M.fmt_mem(vim.loop.get_total_memory())
end

M.avail_ram = function()
  return M.fmt_mem(vim.loop.get_free_memory())
end

M.user = function()
  return vim.loop.os_get_passwd().username
end

M.host = function()
  return vim.loop.os_gethostname()
end

M.uptime = function()
  local uptime = vim.loop.uptime()
  local days = math.floor(uptime / 86400)
  local hours = math.floor((uptime % 86400) / 3600)
  local min = math.floor((uptime % 3600) / 60)

  local s = ""
  if days > 0 then
    s = s .. days .. "d"
  end

  if hours > 0 then
    s = s .. " " .. hours .. "hr"
  end

  if min > 0 then
    s = s .. " " .. min .. "min"
  end

  return s
end

M.line = function(l, len, r)
  local left = M.trim(l)
  local right = M.trim(r)
  local left_len = string.len(left)
  local right_len = string.len(right)
  local pad = string.rep(" ", len - (left_len + right_len))
  return left .. pad .. right
end

M.pad_line = function(s, len)
  local str = M.trim(s)
  local strlen = string.len(str)
  local pad = string.rep(" ", len - strlen)
  return str .. pad
end

M.msg = function(s)
  local sep = "\n"
  local t = {}
  for str in string.gmatch(s, "([^" .. sep .. "]+)") do
    table.insert(t, M.pad_line(str, 88))
  end
  return t
end

M.map = function(tbl)
  local t = {}
  for _, s in ipairs(tbl) do
    table.insert(t, M.msg(s))
  end
  return t
end

M.isin = function(it, tbl)
  for _, i in ipairs(tbl) do
    if i == it then
      return true
    end
  end
  return false
end

return M
