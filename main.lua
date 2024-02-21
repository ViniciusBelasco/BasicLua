local function Main()
	local sum = 0
	local aux

	math.randomseed(os.time())
	math.random()

	io.write("Rolling 5 dices ...\n")

	for i = 1, 5 do
		aux = math.random(6)
		io.write(aux)
		sum = sum + aux
	end

	io.write("\n")
	io.write("The sum of the dice is " .. sum .. "\n")

	io.write("Lightning Bolt from a level 10 wizard dealt ", LightningBolt(10), " damage. \n")
	io.write("Lightning Bolt from a level 20 wizard dealt ", LightningBolt(20), " damage. \n")
end

function LightningBolt(level)
	local damage = 0

	for i = 1, level do
		local aux = math.random(6)
		damage = damage + aux
	end

	return damage
end

Main()
