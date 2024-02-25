function main()
	math.randomseed(os.time())
	math.random()

	local player = {}

	local check = LoadGame()

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

main()
