local function increment(s)
  if s:sub(#s) == "z" then
    if #s == 1 then
      return "aa"
    else
      return increment(s:sub(1, #s - 1)) .. "a"
    end
  else
    return s:sub(1, #s - 1) .. string.char(s:sub(#s):byte() + 1)
  end
end

local function isValid(s)
  local foundStraight = false
  local foundPairs = 0
  for i = 1, #s do
    local c = s:sub(i, i)
    local p = s:sub(i - 1, i - 1)
    local pp = s:sub(i - 2, i - 2)
    if c:find("[iol]") then
      return false
    end
    if not foundStraight and i >= 3 and p:byte() == c:byte() - 1 and pp:byte() == c:byte() - 2 then
      foundStraight = true
    end
    if i > 1 and p == c and pp ~= c then
      foundPairs = foundPairs + 1
    end
  end
  return foundStraight and foundPairs >= 2
end

local str = io.open("input"):read("*a")

while not isValid(str) do
  str = increment(str)
end

print(str)
