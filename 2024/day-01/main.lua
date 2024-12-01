io.input("input.text")

local function split(str)
	local tokens = {}
	for v in string.gmatch(str, "%d+") do
		tokens[#tokens + 1] = v
	end

	return tokens
end

local left = {}
local right = {}

for line in io.lines() do
	local tokens = split(line)
	table.insert(left, tokens[1])
	table.insert(right, tokens[2])
end

table.sort(left)
table.sort(right)

local distances = {}

for i = 1, #left do
	local distance = math.abs(left[i] - right[i])
	table.insert(distances, distance)
end

local total = 0

for _, v in pairs(distances) do
	total = total + v
end

print(total)
