local allNodes = {}
local maxLocationLength = 0

local distMap = {}

for l in io.lines "input" do
  local from, to, distance = l:match("(%w+) to (%w+) = (%d+)")
  if not allNodes[from] then
    allNodes[from] = true
    maxLocationLength = maxLocationLength + #from
  end
  if not allNodes[to] then
    allNodes[to] = true
    maxLocationLength = maxLocationLength + #to
  end
  if not distMap[from] then
    distMap[from] = {}
  end
  if not distMap[to] then
    distMap[to] = {}
  end
  distMap[from][to] = tonumber(distance)
  distMap[to][from] = tonumber(distance)
end

local function getMinDistance(visited, current, total)
  if #visited >= maxLocationLength then
    return total
  end
  local best = 0
  for neighbor, d in pairs(distMap[current]) do
    if not visited:find(neighbor) then
      best = math.max(best, getMinDistance(visited .. neighbor, neighbor, total + d))
    end
  end
  return best
end

local best = 0

for location, _ in pairs(allNodes) do
  best = math.max(best, getMinDistance(location, location, 0))
end

print(best)
