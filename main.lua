function LightningBolt(level)
	local damage = 0

	for i = 1, level do
		local aux = math.random(6)
		damage = damage + aux
	end

	return damage
end

function Experience(name, level)
	local xp = level * 50
	io.write("A level ", level, " ", name, " would reward ", xp, " experience points!\n")

	return xp
end

function SumTotalExp(actualexp, earnexp)
	return actualexp + earnexp
end

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

	--ex calculator
	local totalxp = 0
	io.write("My total xp is", totalxp, " \n")

	local enemy = Experience("Evil wookie", 50)
	totalxp = SumTotalExp(totalxp, enemy)
	io.write("My total xp is", totalxp, " \n\n")

	enemy = Experience("Serpia maligna", 35)
	totalxp = SumTotalExp(totalxp, enemy)
	io.write("My total xp is", totalxp, " \n\n")

	enemy = Experience("Serpia maligna", 35)
	totalxp = SumTotalExp(totalxp, enemy)
	io.write("My total xp is", totalxp, " \n\n")
end

Main()
