extends Node

var score := 0
# total score currently in the player's jar
var score_to_collect := 0

# total number of cookies currently in the jar
var cookie_amt := 0.0
# maximum amount of cookies that can be in the jar
var max_fill := 20.0


# used to add commas to a number for formatting purposes)
# https://forum.godotengine.org/t/how-to-add-commas-to-an-integer-or-float-in-gdscript/29138/4
func add_commas_to_num(number) -> String:
	# turn the number into a string for modification
	var string = str(number)
	# get the amount of commas needed
	var mod = string.length() % 3
	# will store the resulting string with commas
	var res = ""
	
	# loop over every character in the string
	for i in range(0, string.length()):
		# add commas in the correct spot
		if i != 0 && i % 3 == mod:
			res += ","
		# add the character from the string to the result
		res += string[i]
	
	# return the resulting string with commas
	return res
