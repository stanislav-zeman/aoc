local function count_diagonal_left_up(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if j < 1 or i < 1 then
			break
		end

		local char_token = Tokens[i][j]
		if char_needle ~= char_token then
			break
		end

		if char_no == string.len(Needle) then
			return 1
		end

		char_no = char_no + 1
		j = j - 1
		i = i - 1
	end

	return 0
end

local function count_diagonal_right_up(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if i < 1 or j > #Tokens[i] then
			break
		end

		local char_token = Tokens[i][j]
		if char_needle ~= char_token then
			break
		end

		if char_no == string.len(Needle) then
			return 1
		end

		char_no = char_no + 1
		j = j + 1
		i = i - 1
	end

	return 0
end

local function count_diagonal_left_down(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if i > #Tokens or j < 1 then
			break
		end

		local char_token = Tokens[i][j]
		if char_needle ~= char_token then
			break
		end

		if char_no == string.len(Needle) then
			return 1
		end

		char_no = char_no + 1
		j = j - 1
		i = i + 1
	end

	return 0
end

local function count_diagonal_right_down(i, j)
	local char_no = 1
	for char_needle in string.gmatch(Needle, ".") do
		if i > #Tokens or j > #Tokens[i] then
			break
		end

		local char_token = Tokens[i][j]
		if char_needle ~= char_token then
			break
		end

		if char_no == string.len(Needle) then
			return 1
		end

		char_no = char_no + 1
		j = j + 1
		i = i + 1
	end

	return 0
end

return {
	right_up = count_diagonal_right_up,
	left_up = count_diagonal_left_up,
	right_down = count_diagonal_right_down,
	left_down = count_diagonal_left_down,
}
