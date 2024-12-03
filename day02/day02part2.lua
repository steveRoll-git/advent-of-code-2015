local total = 0

for line in io.lines("input") do
  local lengths = { line:match("(%d+)x(%d+)x(%d+)") }
  for i, n in ipairs(lengths) do
    lengths[i] = tonumber(n)
  end
  table.sort(lengths)
  total = total + lengths[1] * 2 + lengths[2] * 2
  total = total + lengths[1] * lengths[2] * lengths[3]
end

print(total)
