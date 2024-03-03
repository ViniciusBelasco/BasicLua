function main()
	local phrase, lives, aux
	local ending = false
	local auxPhrase
	local said = ""

	io.write("enter a word or phrase to begin (this game is not key sensitive): ")
	phrase = io.read("*l")
	auxPhrase = phrase:upper()
	io.write("Enter maximum lives: ")
	lives = io.read("*n")

	aux = phrase:len()

	for k = 1, phrase:len() do
		local x = phrase:sub(k, k)
		if x == " " or x == "'" then
			aux = aux - 1
		end
	end

	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")
	io.write("\n")

	io.write("This is hangman game. You have to figure out the word by typing letters.\n")
	io.write("You have a maximum of ", lives, " lives to solve the word and winning the game.\n")
	io.write("Let's get started!!\n\n")
	io.write("the word has ", aux, " letters.\n\n")

	local letter

	local build = { phrase:len() }

	for i = 1, phrase:len() do
		local x = phrase:sub(i, i)

		if x == " " then
			build[i] = " "
		elseif x == "'" then
			build[i] = "'"
		else
			build[i] = "_"
		end
	end

	for i = 1, phrase:len() do
		io.write(build[i])
		if i == phrase:len() then
			io.write("\n")
			io.write("\n")
		end
	end

	while not ending do
		local fin = false
		io.write("Enter a letter, please: ")
		letter = io.read("*l")
		letter = letter:upper()

		if aux == 0 then
			ending = true
		end

		while true do
			while letter:len() ~= 1 or letter == " " do -- this control single letter input
				io.write("Please enter just 1 letter and no white spaces: ")
				letter = io.read("*l")
				letter = letter:upper()
			end

			if letter:len() == 1 then
				break
			end
		end

		local j = 0

		for i = 1, phrase:len() do
			local c = auxPhrase:sub(i, i)

			if c == letter then
				said = said .. letter
				build[i] = letter
				aux = aux - 1
				j = j + 1
			end
		end

		for i = 1, phrase:len() do
			io.write(build[i])
		end

		--while not fin do
		--	if said:len() ~= 0 then
		--		for i = 1, said:len() do
		--			local s = said:sub(i, i)

		--			s = s:upper()

		--			print(i)
		--			print(said:len())
		--			if s == letter then
		--				io.write("Please Enter words with more than one letter or no blank spaces: ")
		--				letter = io.read("*l")
		--				letter = letter:upper()
		--				break
		--			elseif i == said:len() then
		--				fin = true
		--			end
		--		end
		--	else
		--		print("saiu")
		--		fin = true
		--	end
		--end

		--if fin then
		--	break
		--end

		io.write("\n")
		io.write("\n\n")

		if j == 0 then
			lives = lives - 1
			io.write("There is no ", letter, " in the word. You lost one live!\n")
			io.write(lives, " live(s) left\n\n")

			if lives == 0 then
				ending = true
			end
		end

		if aux > 0 then
			io.write("There are ", aux, "L Letters left\n\n")
		else
			ending = true
		end
	end

	--
	-- 	if lives == 0 then
	-- 		io.write("SORRY!! You lost the game!\n")
	-- 	else
	-- 		io.write("YAI!! CONGRATULATIONS!! YOU WON! \n")
	-- 		io.write("YAI!! CONGRATULATIONS!! YOU WON! \n")
	-- 		io.write("YAI!! CONGRATULATIONS!! YOU WON! \n")
	-- 	end
	-- 	io.write("The word was ", auxPhrase, "\n")
	-- end
end

main()
