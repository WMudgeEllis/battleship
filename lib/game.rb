
class Game
  attr_reader :computer_board, :user_board, :user_ships, :computer_ships, :cells_shot
  def initialize
    @computer_board = Board.new
    @user_board = Board.new
    @user_ships = [user_cruiser = Ship.new('cruiser', 3), user_submarine = Ship.new('submarine', 2)]
    @computer_ships = [computer_cruiser = Ship.new('cruiser', 3), computer_submarine = Ship.new('submarine', 2)]
    @computer_board.cell_generator
    @user_board.cell_generator
    @cells_shot = []
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
    place_comp_ships
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @user_board.render

    place_ships(@user_ships[0])
    place_ships(@user_ships[1])

    gameplay
  end

  def gameplay
    puts "========== COMPUTER BOARD =========="
    puts @computer_board.render
    puts "========== COMPUTER BOARD =========="
    puts @user_board.render(true)
    puts "Please select a cell to fire upon"
    print '>'
    input = gets.chomp
    user_fire(input)
    computer_fire
    shots_feedback
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

  def record_shot(board, coordinate)
    @cells_shot << board.cells[coordinate.to_sym]

  end

  def feedback_tree(cell)
    if cell.render == 'M'
      "shot was a miss."
    elsif cell.render == 'H'
      "shot was a hit."
    elsif cell.render == 'X'
      "shot sunk a ship"
    end
  end

  def shots_feedback
    user_shot = @cells_shot.shift
    comp_shot = @cells_shot.shift
    puts "Your #{feedback_tree(user_shot)}"
    puts  "My #{feedback_tree(comp_shot)}"
  end

  def fire(board, coordinate)
    if board.valid_coordinate?(coordinate)
      record_shot(board, coordinate)
    end
    board.cells[coordinate.to_sym].fire_upon
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
