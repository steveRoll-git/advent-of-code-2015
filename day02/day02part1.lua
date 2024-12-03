local total = 0

for line in io.lines("input") do
  local l, w, h = line:match("(%d+)x(%d+)x(%d+)")
  total = total + 2 * l * w + 2 * w * h + 2 * h * l
  total = total + math.min(l * w, w * h, l * h)
end

print(total)
