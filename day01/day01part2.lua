local total = 0
local index = 1

for c in io.open("input"):read("*a"):gmatch(".") do
  if c == "(" then
    total = total + 1
  else
    total = total - 1
  end
  if total == -1 then
    print(index)
    return
  end
  index = index + 1
end
