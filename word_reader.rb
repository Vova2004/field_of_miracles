class WordReader

def read_from_file(file_name)
	begin 
		f = File.new(file_name, "r:UTF-8")
		lines = f.readlines
		f.close
		return lines.sample.chomp
	rescue SystemCallError
		puts "Файл с словарем не доступен. Игра невозможна!!!"
		abort
	end
end

end