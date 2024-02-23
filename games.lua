local function Main()
	local whichgame = 0

	io.write("Pick a game \n")
	io.write("1) Guess game ")
	io.write("")
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
	elseif whichgame == 3 then
	end
end

Main()
