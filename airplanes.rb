class Airplane
	attr_reader :model
	attr_reader :altitude
	attr_accessor :speed

  def initialize(model)
  	@model = model
  	@speed = 0
  	@altitude = 0
  end

  def fly
  	@speed = rand(500..800)
  	@altitude = rand(8000..10000)
  end

  def land
  	@speed = 0
  	@altitude = 0
  end

  def moving?
  	@speed > 0
  end
end

models = ['Airbus-320', 'Boeing-777', 'IL-76', 'Boeing-767', 'Airbus-330']
planes = []

1000.times do |plane|
  plane = Airplane.new(models[rand(0..4)])
  if rand(0..1) == 1
    plane.fly
  end
  planes << plane
end