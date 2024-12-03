local totalOriginal = 0
local totalEscaped = 0

for l in io.lines("input") do
  totalOriginal = totalOriginal + #l
  totalEscaped = totalEscaped + #("%q"):format(l)
end

print(totalEscaped - totalOriginal)
