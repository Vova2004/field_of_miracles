class Game

	def initialize(slovo)
		@letters = get_letters(slovo)
		@errors = 0
		@bad_letters = []
		@good_letters = []
		@status = 0
	end

	def get_letters(slovo)
    	if slovo == nil || slovo == ''
      		abort 'Загадано пустое слово, нечего отгадывать. Закрываемся'
   		end
    	return slovo.encode('UTF-8').split('')
  	end

	def next_step(bukva)
			if @status == -1 || @status == 1
				return
			end

			if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
				return
			end
			
			if @letters.include?(bukva)|| 
					(bukva == 'е' && @letters.include?('ё')) || 
					(bukva == 'ё' && @letters.include?('е')) || 
					(bukva == 'и' && @letters.include?('й')) || 
					(bukva == 'й' && @letters.include?('и'))
	    		@good_letters << bukva
   				if bukva == 'е'
      				@good_letters << 'ё'
    			end
   				if bukva == 'ё'
   					@good_letters << 'е'
   				end

   				if bukva == 'и'
   					@good_letters << 'й'
   				end

   				if bukva == 'й'
   					@good_letters << 'и'
   				end
			
				if (@letters - @good_letters).empty?
					@status =1
				end
			else
				@bad_letters<<bukva
				@errors+=1
				if @errors >= 7
					@status =-1
				end
			end
		end

	
#1. Спросить букву с консоли
#2. Проверить результат
	def ask_next_letter
		puts "\n Введите следующую букву: "
		letter = ""
		while letter == "" do
			letter = STDIN.gets.encode("UTF-8").chomp.downcase
			if letter.size > 1
				letter = ""
				puts "Назовите одну букву, а не буквосочетание, пожалуйста..." 
			end
		end
		next_step(letter)
	end


	def letters
		return @letters
	end

	def good_letters
		return @good_letters
	end

	def bad_letters
		return @bad_letters
	end

	def status
		return @status
	end

	def errors
		return @errors
	end
end