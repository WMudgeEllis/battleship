
class Game < Turn
  attr_reader :computer_board, :user_board, :user_ships, :computer_ships
  def initialize
    @computer_board = Board.new
    @user_board = Board.new
    @user_ships = [user_cruiser = Ship.new('cruiser', 3), user_submarine = Ship.new('submarine', 2)]
    @computer_ships = [computer_cruiser = Ship.new('cruiser', 3), computer_submarine = Ship.new('submarine', 2)]
    @computer_board.cell_generator
    @user_board.cell_generator
  end

  def start
    puts "Welcome to BATTLESHIP \n would you like to play a game? \n y/n?"
    print '>'
    input = gets.chomp
    if input == 'y'
      setup
    elsif input == 'n'
      puts "See you next time!"
    else
      'INVALID INPUT, PLEASE RERUN PROGRAM'
    end
  end

  def setup
    #method to place computer ships
    @computer_board.place_comp_ships
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @user_board.render

    place_ships(@user_ships[0])
    place_ships(@user_ships[1])


    #run the next method (while loop)
  end

  def gameplay
    @computer_board.render
    @user_board.render(true)
    input = gets.chomp
    user_fire(input)
    #feedback
    computer_fire
    #feedback
    #check if all of one players ships are sunk
    #loop if above false

  end

  def user_input
    gets.chomp
  end

  def place_ships(ship)
    puts "Enter the squares for the #{ship.name} it is (#{ship.length}) long:" #need to figure out a retry
    print '>'
    user_arr = user_input.split(', ')

    if @user_board.valid_placement?(ship, user_arr)
      place_user_ships(ship, user_arr)
    else
      while place_user_ships(ship, user_arr) == false
        puts "Try again, incorrect or invalid coordinates."
        print '>'
        user_arr = user_input.split(', ')
        place_user_ships(ship, user_arr)
        break if !place_user_ships(ship, user_arr)
          place_user_ships(ship, user_arr)
      end
    end
    puts @user_board.render(true)
  end


  def place_user_ships(ship, array)
    @user_board.place(ship, array)
  end


  def place_comp_ships
    @computer_ships.each do |ship|
      @computer_board.place(ship, random_valid_array(ship))
    end
  end


  def random_valid_array(ship)
    @computer_board.all_valid_placements(ship).shuffle.first
  end

  def fire(board, coordinate)
    board.cells[coordinate.to_sym].fire_upon
    if board.valid_coordinate?(coordinate)
      record_shot(board.cells[coordinate])
    end
  end

  def user_fire(coordinate)
    if @computer_board.valid_coordinate?(coordinate)
      fire(@computer_board, coordinate)
    else
      while @computer_board.valid_coordinate?(coordinate) != true
        puts "INVALID COORDINATE"
        puts "Try agian"
        print ">"
        coordinate = user_input
        fire(@computer_board, coordinate)
        break if @computer_board.valid_coordinate?(coordinate)
          fire(@computer_board, coordinate)
      end
    end
  end

  def computer_fire
    array = @user_board.get_cells_not_fired_upon
    fire(@user_board, array.shuffle.first)
  end



end
