local vowels = "[aeiou]"

local lettersTwice = {}
for i = ("a"):byte(), ("z"):byte() do
  table.insert(lettersTwice, string.char(i, i))
end

local forbiddenStrings = { "ab", "cd", "pq", "xy" }

---@param str string
local function containsLetterTwice(str)
  for _, t in ipairs(lettersTwice) do
    if str:find(t) then
      return true
    end
  end
  return false
end

---@param str string
local function containsForbidden(str)
  for _, t in ipairs(forbiddenStrings) do
    if str:find(t) then
      return true
    end
  end
  return false
end

---@param str string
local function isNice(str)
  local _, vowelCount = str:gsub(vowels, "")
  if vowelCount < 3 then
    return false
  end
  if not containsLetterTwice(str) then
    return false
  end
  if containsForbidden(str) then
    return false
  end
  return true
end

local count = 0

for l in io.lines("input") do
  if isNice(l) then
    count = count + 1
  end
end

print(count)
