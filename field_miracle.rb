require_relative 'game.rb'
require_relative 'result_printer.rb'
require_relative 'word_reader.rb'


printer = ResultPrinter.new

reader = WordReader.new
words_file_name = File.dirname(__FILE__) + '/data/words.txt'
game = Game.new(reader.read_from_file(words_file_name))

while game.status == 0 do
	printer.print_status(game)
	game.ask_next_letter
end 

printer.print_status(game)