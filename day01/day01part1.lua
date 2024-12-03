local total = 0

for c in io.open("input"):read("*a"):gmatch(".") do
  if c == "(" then
    total = total + 1
  else
    total = total - 1
  end
end

print(total)
