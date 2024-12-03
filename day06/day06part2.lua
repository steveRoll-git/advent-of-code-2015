local width = 1000

local grid = {}

for x = 0, width - 1 do
  for y = 0, width - 1 do
    grid[y * width + x] = 0
  end
end

local operations = {
  ["turn on"] = function(light)
    return light + 1
  end,
  ["turn off"] = function(light)
    return math.max(light - 1, 0)
  end,
  ["toggle"] = function(light)
    return light + 2
  end
}

for l in io.lines("input") do
  local op, x1, y1, x2, y2 = l:match("(.-) (%d+),(%d+) through (%d+),(%d+)")
  x1 = tonumber(x1)
  x2 = tonumber(x2)
  y1 = tonumber(y1)
  y2 = tonumber(y2)
  if x1 > x2 then
    x2, x1 = x1, x2
  end
  if y1 > y2 then
    y2, y1 = y1, y2
  end
  local f = operations[op]
  for x = x1, x2 do
    for y = y1, y2 do
      local prev = grid[y * width + x]
      grid[y * width + x] = f(prev)
    end
  end
end

local total = 0

for x = 0, width - 1 do
  for y = 0, width - 1 do
    total = total + grid[y * width + x]
  end
end

print(total)
