local str = io.open("input"):read("*a")

local total = 0

for n in str:gmatch("%-?%d+") do
  total = total + n
end

print(total)
