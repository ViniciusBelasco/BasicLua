local function Main()
	math.randomseed(os.time())
	math.random()

	local number = math.random(100)
	local count = 0
	local guess

	io.write("Guess my number (1=100): ")
	guess = io.read("*n")
  count = count + 1


end

Main()
