function main()
	local valueX, valueY, correct = false
	local win1 = false
	local win2 = false
	local left = false
	local finale = false
	local turn = 1
	local board = {}
	local auxBoard = {}

	io.write("\n")
	io.write("\n")

	for i = 1, 5 do
		board[i] = {}
		auxBoard[i] = {}
		for j = 1, 5 do
			if i == 2 or i == 4 then
				board[i][j] = "_"
				auxBoard[i][j] = "F"
			elseif j == 2 or j == 4 then
				board[i][j] = "|"
				auxBoard[i][j] = "F"
			else
				board[i][j] = " "
				auxBoard[i][j] = "T"
			end
		end
	end

	io.write("WELCOME! This is the Tic Tac Toe game.\n")
	io.write("To place your move you must enter X and Y coordenates (the lines have their spot in even positions).\n")
	io.write("The player 1 in the O (one) and player 2 id the T (Two).\n")
	io.write("\n")
	io.write("Let's get started!!\n\n\n")

	for i = 1, 5 do
		for j = 1, 5 do
			io.write(board[i][j])
		end
		io.write("\n")
	end
end

main()
