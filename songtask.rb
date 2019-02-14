class Artist
	attr_reader :name, :albums
	def initialize name
		@name = name
		@albums = []
	end
	def add_album album
		@albums << album
	end
end

class Album
	attr_reader :name, :songs
	def initialize name
		@name = name
		@songs = []
	end
	def add_song song
		@songs << song
	end
end

class Song
	attr_reader :name, :duration
	def initialize name, duration
		@name = name
		@duration = duration
	end
end
album = Album.new 'Meteora'

song1 = Song.new 'Don\'t Stay', 6
song2 = Song.new 'Lying from you', 4
song3 = Song.new 'Faint', 5

artist = Artist.new 'Linkin Park'
artist.add_album album
puts artist.name
puts artist.albums[0].name
album.add_song song1
album.add_song song2
album.add_song song3

puts album.songs[0].name
 