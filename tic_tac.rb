def output_matrix
	puts
	puts "    Y"
	print '   '
	print "_1__2__3__4__5__6_"
	puts
	print 'X 1'

	@matrix[0].each_value do |item|
		print item
	end
	print "\n"
	@matrix[1..5].each_with_index do |item,i|
		print "  #{i+2}"
		item.each_value do |elem|
			print elem
		end
		print "\n"
	end
end

def input_turn
	while 1 do
	  print "Input your turn X: "
	  @turn_x = gets.to_i
	  if @turn_x < 1 || @turn_x > 7
	  	puts "Wrong number! You need to input 1..6. Repeat"
	  else break
	  end
	end

	while 1 do
	  print "Input your turn Y: "
	  @turn_y = gets.to_i
	  if @turn_y < 1 || @turn_y > 7
	  	puts "Wrong number! You need to input 1..6. Repeat"
	  else break
	  end
	end

	@user_turn = @turn_x*10 + @turn_y  # turn for access to hash in matrix (11 or 34 or 53 etc.)
end

def skolko_x
	@k = 0
	@matrix[@all_user_turnes.last[0] - 1].each_value do |j|
		if j.include? "_#{@choise}"
			@k += 1
		end

	end
	return @k
end

def skolko_y
	@l = 0
	@matrix.each_with_index do |m,n|
		if m[(n+1)*10 + @all_user_turnes.last[1]].include? "_#{@choise}"
			@l += 1
		end

	end
	return @l
end

def empty_x
	@pole = []
	0.upto(5) do |item|
		  @sovp = 0
	   		matrix[item].each_value do |elem|
	   			if elem.include? "#{comp_choise}"
	   				@sovp += 1
	   			elsif elem.include? "#{@choise}"
	   				@sovp = -100
	   			end
	   		end
	   	if @sovp < 0
	   		@pole << -1
	   	else
	   		@pole << @sovp
	   	end
  end
  @hod_po_x = @pole.index(@pole.max)
  @skolko_po_x = @pole.max
end

def empty_y
	@pole_y = []
	1.upto(6) do |stolbec|
		@sovp_y = 0
		1.upto(6) do |elem|
			if @matrix[elem - 1][elem*10 + stolbec].include? "#{comp_choise}"
				@sovp_y += 1
				elsif @matrix[elem - 1][elem*10 + stolbec].include? "#{@choise}"
	   				@sovp_y = -100
	   	end
		end
		  if @sovp_y < 0
	   	  @pole_y << -1
	   	else
	   		@pole_y << @sovp_y
	   	end
	end
	@hod_po_y = @pole_y.index(@pole_y.max)
	@skolko_po_y = @pole_y.max
end

h1 = {11 => '|__', 12 => '|__', 13 => '|__', 14 => '|__', 15 => '|__', 16 => '|__|'}
h2 = {21 => '|__', 22 => '|__', 23 => '|__', 24 => '|__', 25 => '|__', 26 => '|__|'}
h3 = {31 => '|__', 32 => '|__', 33 => '|__', 34 => '|__', 35 => '|__', 36 => '|__|'}
h4 = {41 => '|__', 42 => '|__', 43 => '|__', 44 => '|__', 45 => '|__', 46 => '|__|'}
h5 = {51 => '|__', 52 => '|__', 53 => '|__', 54 => '|__', 55 => '|__', 56 => '|__|'}
h6 = {61 => '|__', 62 => '|__', 63 => '|__', 64 => '|__', 65 => '|__', 66 => '|__|'}

@matrix = [h1, h2, h3, h4, h5, h6] # empty matrix

puts
puts "WellCome to Tic-Tac-Toe Game!"
puts
output_matrix # output empty matrix
puts
while 1 do
  print "Input your choise (X or O): "    #choose symbol for Game
  @choise = gets.strip.capitalize!
  if @choise == "X"
  	 comp_choise = "O"
  	 break
  elsif @choise == "O"
  	comp_choise = "X"
  	break
  else puts "You've intered wrong char! Repeat"
  end
end

all_turnes = []
@all_user_turnes = [] # remember all turnes
diag = [61, 52, 43, 34, 25, 16]

loop do
	input_turn
	if all_turnes.include?(@user_turn)
		puts "This field is filled. Repeat"
		next
	end
	
	if @turn_y == 6
		@matrix[@turn_x - 1][@user_turn] = "|_#{@choise}|"
	else @matrix[@turn_x - 1][@user_turn] = "|_#{@choise}"
	end

	if diag.include?(@user_turn)
		diag_right = 1
	end
	#turnes = [[@turn_x - 1, @turn_y], [@turn_x - 1, @turn_y - 1], [@turn_x - 1, @turn_y + 1], [@turn_x + 1, @turn_y], [@turn_x + 1, @turn_y - 1], [@turn_x + 1, @turn_y + 1],
	# [@turn_x, @turn_y - 1], [@turn_x, @turn_y + 1]] 

	if @all_user_turnes.empty? # first turn
		user_turnes = []
		user_turnes << @turn_x
		user_turnes << @turn_y
		@all_user_turnes << user_turnes
		all_turnes << @user_turn
		unless @user_turn == 33
			comp_turn = 33
			@matrix[2][comp_turn] = "|_#{comp_choise}"
			all_turnes << comp_turn
		else comp_turn = 43
			@matrix[3][comp_turn] = "|_#{comp_choise}"
			all_turnes << comp_turn
			diag_left = 1
		end
		sleep 0.5
    system("cls")
    output_matrix
		next
	end
  
  user_turnes = []
	user_turnes << @turn_x
	user_turnes << @turn_y
	@all_user_turnes << user_turnes
	all_turnes << @user_turn
	if (@turn_x - @turn_y == 0)
		diag_left = 1
	end

	unless ((diag_right || diag_left) || (diag_left && !diag_right))
	  unless all_turnes.include?(@all_user_turnes.last[0]*10 + @all_user_turnes.last[0])
	    comp_turn =  @all_user_turnes.last[0]*10 + @all_user_turnes.last[0]
	    @matrix[@all_user_turnes.last[0] - 1][comp_turn] = "|_#{comp_choise}"
	    all_turnes << comp_turn
    else 
    	c = 0
      comp_turn = @all_user_turnes.last[0]*10 + @all_user_turnes.last[0] + 11
      c += 1
      while all_turnes.include?(comp_turn) do
      	unless comp_turn == 66
      		comp_turn += 11
      	  c += 1
      	 else
      	 	comp_turn = 11
      	 	c = 0
      	 end
      end
      @matrix[@all_user_turnes.last[0] - 1 + c][comp_turn] = "|_#{comp_choise}"
      all_turnes << comp_turn
    end
	end

	if (diag_left && !diag_right)
		if skolko_x >= skolko_y
			comp_turn = diag[-@turn_x]
			@matrix[@turn_x - 1][comp_turn] = "|_#{comp_choise}"
      all_turnes << comp_turn
     else skolko_x < skolko_y
     	comp_turn = diag[@turn_x - 1]
     	@matrix[-@turn_x][comp_turn] = "|_#{comp_choise}"
     	all_turnes << comp_turn
    end
   elsif (diag_left && diag_right)
   	empty_x
   	empty_y
   	if skolko_po_x >= skolko_po_y
   		
   	end
	end
  	

    
    
    sleep 3
    system("cls")
    output_matrix
end

