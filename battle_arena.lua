function main()
	math.randomseed(os.time())
	math.random()

	local player = {}

	local check = LoadGame(player)

	if not check then
		GenerateStats(player)
	end

	VisitArena(player)

	SaveGame(player)
end

function Battle(player, enemy)
	local round = 0
	local maxhp = player.hp

	while player.hp > 0 and enemy.hp > 0 do
		round = round + 1

		io.write("\n))) Round ", round, "!! (((\n")
		Attack(player, enemy)
		Attack(enemy, player)

		ShowStats(player)
		ShowStats(enemy)

		io.write("Press <Enter> to continue ... \n")
		io.read()
	end

	if player.hp > 0 then
		player.hp = maxhp
		return player
	else
		return enemy
	end
end

function LevelUp(player)
	io.write("You Leveled!!\n")

	player.hp = player.hp + 10
	player.atk = player.atk + 0.5
	player.def = player.def + 0.5
	player.level = player.level + 1

	io.write("1) Hit Points\n")
	io.write("2) Attack\n")
	io.write("3) Defense\n")

	local choice = Ask("What stat would you like to increase? ", 3)
	if choice == 1 then
		player.hp = player.hp + 10
	elseif choice == 2 then
		player.atk = player.atk + 1
	else
		player.def = player.def + 1
	end
end

function Ask(prompt, maxval)
	local input
	while true do
		io.write(prompt)

		input = io.read("*n")
		io.read("*l")

		if input ~= nil and input >= 1 and input <= maxval then
			return input
		end
		io.write("Invalid!!")
	end
end

function GenerateStats(person)
	io.write("Welcome to the Arena!\n")
	io.write("What is your name? ")
	io.write("\n")

	person.name = io.read("*l")
	person.hp = 100
	person.atk = 2
	person.def = 10
	person.level = 1
	person.gold = 5
end

function LoadGame(player)
	local fileIn = io.open("arena.txt", "r")

	if fileIn ~= nil then
		player.name = fileIn:read("*l")
		player.hp = fileIn:read("*n")
		player.def = fileIn:read("*n")
		player.level = fileIn:read("*n")
		player.gold = fileIn:read("*n")
		io.close(fileIn)
		return true
	else
		io.close(fileIn)
		return false
	end
end

function SaveGame(player)
	local fileArena = io.open("arena.txt", "w")

	if fileArena ~= nil then
		fileArena:write(player.name, "\n")
		fileArena:write(player.hp, "\n")
		fileArena:write(player.atk, "\n")
		fileArena:write(player.def, "\n")
		fileArena:write(player.level, "\n")
		fileArena:write(player.gold, "\n")
	end

	io.close(fileArena)
end

function ShowStats(structure)
	io.write("\nName: ", structure.name, "\n")
	if structure.level ~= nil then
		io.write("Level: ", structure.level, "\n")
	end
	io.write("HP: ", structure.hp, "\n")
	io.write("Attack: ", structure.atk, "\n")
	io.write("Defense: ", structure.def, "\n")

	if structure.gold ~= nil then
		io.write("Gold: ", structure.gold, "\n")
	end
	io.write("\n")
end

main()
