class Song
	def initialize(num, duration, songs)
		@num = num #number of song
		@duration = duration
		@songs = songs
		@name = @songs.keys[num-1]
	end

	def play
		min = @duration.div 60
		sec = @duration.remainder 60
		puts "Now playing:"
		while true do
			if sec >= 10
			  print "#{@name}  0#{min}:#{sec}\r"
      else
      	print "#{@name}  0#{min}:0#{sec}\r"
      end
			sleep 1
			if sec == 0
				if min == 0
					break
				end
			  min -= 1
				sec = 60
			end
			sec -= 1
		end

	end

end
songs = {'Hollywood Undead – Undead (Out The Way)' => 276, 'Indila – Derniere danse' => 283, 'Coldplay – Paradise' => 276, 'Selena Gomez – Same Old Love' => 228}
puts
puts "Songs list:"
puts
i = 1 
songs.each do |key, value|
	puts "#{i}. " + "#{key}" + "  #{value.div(60)}:#{value.remainder(60)}".rjust((songs.keys.max_by(&:length).length - key.length + 6))
	i += 1
end
puts
puts "Enter number of song: "
num = gets.to_i
puts
duration = songs[songs.keys[num-1]]
song = Song.new(num, duration, songs)
song.play
