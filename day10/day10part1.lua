local function lookAndSay(str)
  local result = ""
  local last = str:sub(1, 1)
  local count = 1
  for i = 2, #str do
    if str:sub(i, i) ~= last then
      result = result .. count .. last
      count = 0
    end
    last = str:sub(i, i)
    count = count + 1
  end
  result = result .. count .. last
  return result
end

local str = io.open("input"):read("*a")

for _ = 1, 40 do
  str = lookAndSay(str)
end

print(#str)
