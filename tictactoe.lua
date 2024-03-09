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

	while not (win1 or win2) and not finale do
		io.write("\n")
		if turn == 1 then
			correct = false
			io.write("Player 1, please enter coordenates for X: ")
			valueX = io.read("*n")
			io.write("Player 1, please enter coordenates for Y: ")
			valueY = io.read("*n")
			io.write("\n")

			while not correct do
				if
					(valueX == 2 or valueX == 4) and (valueY == 2 or valueY == 4)
					or valueX > 5
					or valueX < 0
					or valueY > 5
					or valueY < 0
					or auxBoard[valueX][valueY] == "F"
				then
					io.write("ERROR!! Can't place your move there. player 1, please enter coordenates for X: ")
					valueX = io.read("*n")
					io.read("*l")
					io.write("Player 1, please enter coordenates for Y: ")
					valueY = io.read("*n")
					io.read("*l")
					io.write("\n")
				else
					correct = true
					auxBoard[valueX][valueY] = "F"
					board[valueX][valueY] = "O"
					turn = 2
				end
			end

			--Control end game
			for i = 1, 5 do
				for j = 1, 5 do
					if auxBoard[i][j] == "T" then
						left = true
					end
					if i == 5 and j == 5 and not left then
						finale = true
					end
				end
			end

			left = false

			-- player 1 won
			if board[1][1] == "O" and board[1][3] == "O" and board[1][5] == "O" then
				win1 = true
			end
			if board[3][1] == "O" and board[3][3] == "O" and board[3][5] == "O" then
				win1 = true
			end
			if board[5][1] == "O" and board[5][3] == "O" and board[5][5] == "O" then
				win1 = true
			end

			if board[1][1] == "O" and board[3][1] == "O" and board[5][1] == "O" then
				win1 = true
			end
			if board[1][3] == "O" and board[3][3] == "O" and board[5][3] == "O" then
				win1 = true
			end
			if board[1][5] == "O" and board[3][5] == "O" and board[5][5] == "O" then
				win1 = true
			end

			if board[1][1] == "O" and board[3][3] == "O" and board[5][5] == "O" then
				win1 = true
			end
			if board[1][5] == "O" and board[3][3] == "O" and board[5][1] == "O" then
				win1 = true
			end
		else
			correct = false

			io.write("Player 2, please enter coordenates for X: ")
			valueX = io.read("*n")
			io.read("*l")
			io.write("Player 2, please enter coordenates for Y: ")
			valueY = io.read("*n")
			io.read("*l")
			io.write("\n")

			while not correct do
			end
		end
	end
end

main()
