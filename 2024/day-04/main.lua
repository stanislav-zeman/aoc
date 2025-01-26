local inspect = require("inspect")

io.input("input.text")

Tokens = {}

for line in io.lines() do
	local line_tokens = {}
	for c in string.gmatch(line, ".") do
		table.insert(line_tokens, c)
	end

	table.insert(Tokens, line_tokens)
end

Needle = "XMAS"

local function count_horizontal(i, j)
	local hz = require("utils.horizontal")
	return hz.left(i, j) + hz.right(i, j)
end

local function count_vertical(i, j)
	local vt = require("utils.vertical")
	return vt.up(i, j) + vt.down(i, j)
end

local function count_diagonal(i, j)
	local dg = require("utils.diagonal")
	return dg.left_up(i, j) + dg.right_up(i, j) + dg.left_down(i, j) + dg.right_down(i, j)
end

local count = 0
for i = 1, #Tokens do
	local line = Tokens[i]
	for j = 1, #line do
		local token = line[j]
		if token == string.sub(Needle, 1, 1) then
			local hz = count_horizontal(i, j)
			local vt = count_vertical(i, j)
			local dg = count_diagonal(i, j)
			count = count + hz + vt + dg
		end
	end
end

print(count)
