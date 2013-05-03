$hangman = [' 0', '|', '/', '\\', '/ ', '\\']
$score = [10,9,8,7,6,5,4]
$guessed_chars = []

def draw_hangman(i=0)
case i
  when 1
    puts $hangman[0]
  when 2
    puts $hangman[0]
    puts " #{$hangman[1]}" 
  when 3
    puts $hangman[0]
    puts "#{$hangman[2]}#{$hangman[1]}"
  when 4
    puts $hangman[0]
    puts "#{$hangman[2]}#{$hangman[1]}#{$hangman[3]}"
  when 5
    puts $hangman[0]
    puts "#{$hangman[2]}#{$hangman[1]}#{$hangman[3]}"
    puts "#{$hangman[4]}"
  when 6
    puts $hangman[0]
    puts "#{$hangman[2]}#{$hangman[1]}#{$hangman[3]}"
    puts "#{$hangman[4]}#{$hangman[5]}"
  end
end

def print_guessedchars(word)
  word.split('')[0..-2].each do |char|
    if $guessed_chars.include? char[0]
      print char[0]
      print ' '
    else
      print '_'
      print ' '
    end
  end
end

def run_main()
  while true do
    print "Enter a word::"
    word = gets
    word_list = word.split('')
    word_length = word.length - 1
    i = 0
    input_char_list = []
    $guessed_chars = []
    print "It is a #{word_length} character word\n"
    while i<6 do
      print "\nGuess a character::"
      input_char = gets
      if not word_list.include? input_char[0]
        i = i+1
	draw_hangman(i)
	print_guessedchars(word)
	next
      end
      if word_list.include? input_char[0] and not input_char_list.include? input_char[0] and word_length!=0
	$guessed_chars << input_char[0]
	input_char_list << input_char[0]
	print_guessedchars(word)
	word_length = word_length - word.count(input_char[0])
	if word_length == 0
	  break
	end
      end
    end
    print "\nYour Score is::"
    puts $score[i]
    print "Enter 0 to exit, any other key to play again:"
    choice = gets
    if choice[0] == '0'
      break
    end
  end
end
				
				
run_main
