local function count_horizontal_right(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if j > #Tokens[i] then
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
		j = j + 1
	end

	return 0
end

local function count_horizontal_left(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if j < 1 then
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
		j = j - 1
	end

	return 0
end

return {
	right = count_horizontal_right,
	left = count_horizontal_left,
}
