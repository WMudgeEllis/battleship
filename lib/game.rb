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
    if input = 'y'
      setup
    elsif input = 'n'
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

  # player_place_count = 0
      # while x < 2
      #   @player_ships.each do |ship|
      #     place_ship(ship)
      #   end
      # end

    place_ships(@user_ships[0])
    place_ships(@user_ships[1])

    #run the next method (while loop)
  end


  def place_ships(ship)
    puts "Enter the squares for the #{ship} (#{ship.length}):" #need to figure out a retry
    print '>'
    user_input = gets.chomp
    user_input = user_input.split(', ')

    place_user_ships(ship, user_input)
    puts @user_board.render(true)
  end


  def place_user_ships(ship, array)
    @user_board.place(ship, array)
  end















end
