local directions = {
  [">"] = { x = 1, y = 0 },
  ["<"] = { x = -1, y = 0 },
  ["v"] = { x = 0, y = 1 },
  ["^"] = { x = 0, y = -1 },
}

local uniqueVisited = 1
local visitedMap = {
  ["0 0"] = true
}
local cursor1 = { x = 0, y = 0 }
local cursor2 = { x = 0, y = 0 }
local index = 0

for c in io.open("input"):read("*a"):gmatch(".") do
  local dir = directions[c]
  local cursor = index % 2 == 0 and cursor1 or cursor2
  cursor.x = cursor.x + dir.x
  cursor.y = cursor.y + dir.y
  local id = ("%d %d"):format(cursor.x, cursor.y)
  if not visitedMap[id] then
    visitedMap[id] = true
    uniqueVisited = uniqueVisited + 1
  end
  index = index + 1
end

print(uniqueVisited)
