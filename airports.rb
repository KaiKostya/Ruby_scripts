class Country
	attr_reader :name
	attr_reader :airports
	def initialize(name)
		@name = name
		@airports = []
	end
	def add_airport airport
		@airports << airport
	end


end

class Airport
	attr_accessor :name
	attr_accessor :planes
	def initialize(name)
    @name = name
    @planes = []
	end

	def add_plane plane
		@planes << plane
	end
end

class Airplane
	attr_accessor :model
	attr_accessor :speed
	attr_accessor :altitude
	def initialize(model)
    @model = model
    @speed = 0
    @altitude = 0
	end
  def fly
 	@speed = rand(500..800)
 	@altitude = rand(7000..10000)
 end

  def land
  	@speed = 0
  	@altitude = 0
  end

end

models = ['Boeing-777', 'Airbus-320', 'IL-76']
puts 'Enter Airport name'
name = gets.strip.downcase.capitalize
airport = Airport.new(name)
3.times do
	plane = Airplane.new(models[rand(0..2)])
	airport.add_plane(plane)
end
puts
puts 'Enter Airport 2 name'
name2 = gets.strip.downcase.capitalize
airport2 = Airport.new(name2)
3.times do
	plane = Airplane.new(models[rand(0..2)])
	airport2.add_plane(plane)
end
puts
airports = [airport, airport2]
airports.each do |ad|
	puts "Name: #{ad.name}"
	puts "Planes: "
	airport.planes.each do |plane|
		puts "#{plane.model}"
	end
	puts
	cnt = Country.new 'Russia'
	cnt.add_airport airport
end
