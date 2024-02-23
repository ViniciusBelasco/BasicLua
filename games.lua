local function Main()
	local whichgame = 0

	io.write("Pick a game \n")
	io.write("1) Guess game \n")
	io.write("2) Improved Guess Game \n")
	io.write("")

	whichgame = io.read("*n")

	if whichgame == 1 then
		--guess the number
		math.randomseed(os.time())
		math.random()

		local number = math.random(100)
		local count = 0
		local guess

		io.write("Guess my number (1=100): ")
		guess = io.read("*n")
		count = count + 1

		while guess ~= number do
			if guess > number then
				io.write(guess, " is too high.")
			elseif guess < number then
				io.write(guess, "is too low.")
			end

			io.write("Guess again: ")
			guess = io.read("*n")
			count = count + 1
		end
	elseif whichgame == 2 then
		--improved guess
		local guess1 = math.random(100)
		local guess2
		local count = 0
		local number

		io.write("Enter a number for me to guess (1-100): ")
		number = io.read("*n")
		io.write("I guess ", guess1, "\n")
		count = count + 1

		while guess1 ~= number do
			if guess1 < number then
				io.write("That's not right. ")
				guess2 = math.random(guess1, 100)
				while guess2 <= guess1 do
					guess2 = math.random(guess2, 100)
				end
				io.write("I guess ", guess2, "\n")
				count = count + 1
			elseif guess1 > number then
				io.write("That's not right. ")
				guess2 = math.random(guess1)
				while guess2 >= guess1 do
					guess2 = math.random(guess2)
				end
				io.write("I guess ", guess2, "\n")
				count = count + 1
			end

			guess1 = guess2
		end

		io.write("You got it right after ", count, "tries! \n\n")
	elseif whichgame == 3 then
		-- Rock-Paper-Scissors

		local computer = math.random(1, 3)
		local player
		local move = {}

		move[1] = "Rock"
		move[2] = "Paper"
		move[3] = "Scissors"

		io.write("Rock Paper Scissors Time! \n")
		io.write("1) Rock \n")
		io.write("2) Paper \n")
		io.write("3) Scissors \n")
		io.write("Enter your choice: ")

		player = io.read("*n")

		io.write("Player chose ", move[player], "\n")
		io.write("Computer chose ", move[computer], "\n")
	end
end

Main()
