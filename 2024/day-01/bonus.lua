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

	local right_token = tokens[2]
	local right_value = right[right_token]

	if right_value == nil then
		right[right_token] = 1
	else
		right[right_token] = right_value + 1
	end
end

local similarity = 0

for _, v in pairs(left) do
	local occurances = right[v]
	if occurances == nil then
		occurances = 0
	end

	similarity = similarity + v * occurances
end

print(similarity)
