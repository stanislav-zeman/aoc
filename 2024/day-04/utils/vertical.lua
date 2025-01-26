local function count_vertical_up(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if i < 1 then
			break
		end

		local char_token = Tokens[i][j]
		-- print("Char needle, char token:", char_needle, char_token)
		if char_needle ~= char_token then
			break
		end

		if char_no == string.len(Needle) then
			return 1
		end

		char_no = char_no + 1
		i = i - 1
	end

	return 0
end

local function count_vertical_down(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if i > #Tokens then
			break
		end

		local char_token = Tokens[i][j]
		-- print("Char needle, char token:", char_needle, char_token)
		if char_needle ~= char_token then
			break
		end

		if char_no == string.len(Needle) then
			return 1
		end

		char_no = char_no + 1
		i = i + 1
	end

	return 0
end

return {
	up = count_vertical_up,
	down = count_vertical_down,
}
