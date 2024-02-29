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
end

main()
