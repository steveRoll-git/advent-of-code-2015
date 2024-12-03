---@param str string
local function isNice(str)
  local found2Pair = false
  local foundRepeatBetween = false
  for i = 1, #str do
    if i > 1 and i < #str then
      if not found2Pair then
        if select(2, str:sub(1, i - 1):gsub(str:sub(i, i + 1), "")) >= 1 then
          found2Pair = true
        end
      end
      if not foundRepeatBetween then
        if str:sub(i - 1, i - 1) == str:sub(i + 1, i + 1) then
          foundRepeatBetween = true
        end
      end
    end
    if found2Pair and foundRepeatBetween then
      return true
    end
  end
  return false
end

local count = 0

for l in io.lines("input") do
  if isNice(l) then
    count = count + 1
  end
end

print(count)
