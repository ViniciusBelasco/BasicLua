function main()
  local valueX, valueY, correct = 0, 0, false
  local win1 = false
  local win2 = false
  local left = false
  local finale = false
  local turn = 1
  local board = {}
  local auxBoard = {}

  io.write("\n")
  io.write("\n")

  IniciateBoard(board, auxBoard)

  io.write("WELCOME! This is the Tic Tac Toe game.\n")
  io.write("To place your move you must enter X and Y coordenates (the lines have their spot in even positions).\n")
  io.write("The player 1 in the O (one) and player 2 id the T (Two).\n")
  io.write("\n")
  io.write("Let's get started!!\n\n\n")

  WriteBoardGame(board)

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
        if ValidCoordenate(valueX, valueY, auxBoard) then
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
      finale = EndGameControl(auxBoard, left)

      -- Player 1 won
      win1 = ValidateWinningContition(board, "O")
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
        if ValidCoordenate(valueX, valueY, auxBoard) then
          io.write("ERROR!! Can't place your move there. Player 2, please enter coordenates for X: ")
          valueX = io.read("*n")
          io.read("*l")
          io.write("Player 2, please enter coordenates for Y: ")
          valueY = io.read("*n")
          io.read("*l")
          io.write("\n")
        else
          correct = true
          auxBoard[valueX][valueY] = "F"
          board[valueX][valueY] = "T"
          turn = 1
        end

        --end control
        finale = EndGameControl(auxBoard, left)
        -- player 2 won

        win2 = ValidateWinningContition(board, "T")
      end

      -- show board game
      WriteBoardGame(board)
    end
  end
  ReturnWinningMessage(finale, win1, win2)
end

function ReturnWinningMessage(finale, win1, win2)
  if not finale then
    if win1 then
      return io.write("\nPlayer 1 won!!!\n")
    end

    if win2 then
      return io.write("\nPlayer 2 won!!!\n")
    end
  end
  return io.write("\nIt's a draw!!\n")
end

function WriteBoardGame(board)
  for i = 1, 5 do
    for j = 1, 5 do
      io.write(board[i][j])
    end
    io.write("\n")
  end
end

function IniciateBoard(board, auxBoard)
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
end

function ValidCoordenate(valueX, valueY, auxBoard)
  return (valueX == 2 or valueX == 4) and (valueY == 2 or valueY == 4)
      or valueX > 5
      or valueX < 0
      or valueY > 5
      or valueY < 0
      or auxBoard[valueX][valueY] == "F"
end

function EndGameControl(auxBoard, left)

  local finale
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

  return finale
end

function ValidateWinningContition(board, playerToken)
  local win

  if board[1][1] == playerToken then
    if board[1][3] == playerToken and board[1][5] == playerToken then
      win = true
    end
    if board[3][1] == playerToken and board[5][1] == playerToken then
      win = true
    end
    if board[3][3] == playerToken and board[5][5] == playerToken then
      win = true
    end
  end

  if board[1][3] == playerToken and board[3][3] == playerToken and board[5][3] == playerToken then
    win = true
  end

  if board[3][1] == playerToken and board[3][3] == playerToken and board[3][5] == playerToken then
    win = true
  end

  if board[5][1] == playerToken and board[5][3] == playerToken and board[5][5] == playerToken then
    win = true
  end

  if board[5][1] == playerToken then
    if board[3][3] == playerToken and board[1][5] == playerToken then
      win = true
    end

    if board[5][3] == playerToken and board[5][5] == playerToken then
      win = true
    end
  end

  return win
end

main()
