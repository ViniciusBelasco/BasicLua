function main()
	local phrase, lives, aux
	local ending = false
	local fin = false
	local auxPhrase
	local said = ""

	io.write("enter a word or phrase to begin (this game is not key sensitive): ")
	phrase = io.read("*l")
	auxPhrase = phrase:upper()
	io.write("Enter maximum lives: ")
	lives = io.read("*n")
	io.read("*l")

	aux = phrase:len()

	local k
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
	local i, j

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
end

main()
