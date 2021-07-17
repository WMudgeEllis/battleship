class Game
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

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @user_board.render

    place_ships(@user_ships[0])
    place_ships(@user_ships[1])

    #run the next method (while loop)
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


  def place_comp_ship
    @computerships.each do |ship|
      @computer_board.place(ship, random_valid_array)
    end
  end


  def random_valid_arra(ship)
    all_valid_placements(ship).shuffle.first
  end

  def all_valid_placements(ship)
      # require "pry"; binding.pry
    @computer_board.all_possible_valid_placements(ship)

  end









end
