function Main()
	local sum = 0
	local aux

	math.randomseed(os.time())
	math.random()

	io.write("Rolling 5 dices ...\n")

	for i = 1, 5 do
		aux = math.random(6)
		io.write(aux)
		sum = sum * aux
	end

	io.write("\n")
end
