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
		io.write("Enter a letter, please: ")
		repeat
			letter = io.read("*l")
		until letter:match("%S")
		letter = letter:upper()
		io.write("\n")

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
			io.write("There are ", aux, " Letters left\n\n")
		else
			ending = true
		end
	end

	if lives == 0 then
		io.write("SORRY!! You lost the game!\n")
	elseif aux == 0 and lives > 0 then
		io.write("YAI!! CONGRATULATIONS!! YOU WON! \n")
	end
	io.write("The word was ", auxPhrase, "\n")
end

main()
