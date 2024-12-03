local totalCode = 0
local totalMemory = 0

for l in io.lines("input") do
  totalCode = totalCode + #l
  totalMemory = totalMemory + #loadstring("return " .. l)()
end

print(totalCode - totalMemory)
