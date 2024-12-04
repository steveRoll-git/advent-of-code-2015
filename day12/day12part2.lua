local function countObject(o)
  local total = 0
  if o[1] then
    for _, n in ipairs(o) do
      if type(n) == "number" then
        total = total + n
      elseif type(n) == "table" then
        total = total + countObject(n)
      end
    end
  else
    for _, n in pairs(o) do
      if n == "red" then
        return 0
      elseif type(n) == "number" then
        total = total + n
      elseif type(n) == "table" then
        total = total + countObject(n)
      end
    end
  end
  return total
end

---@type string
local str = io.open("input"):read("*a")

str = str:gsub('"(%a+)":', "%1=")
str = str:gsub("%[", "{")
str = str:gsub("%]", "}")

local object = loadstring("return " .. str)()

print(countObject(object))
