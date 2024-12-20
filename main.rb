require_relative 'lib/player'
require_relative 'lib/board'

# Create a board
board = Board.new

# Create two players
player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

# Simple game loop
current_player = player1

until board.game_over?
  # Clear the screen (optional)
  system('clear') || system('cls')

  # Show the board
  board.display

  # Get the player's move
  position = current_player.make_move

  # Try to place the symbol
  if board.place_symbol(position, current_player.symbol)
    # Record the move
    current_player.record_move(position)
    # Switch players
    current_player = (current_player == player1 ? player2 : player1)
  else
    puts "That position is already taken! Try again."
  end
end

# Show final board
board.display

# Show winner
if board.winner?
  # Switch back to the winner
  current_player = (current_player == player1 ? player2 : player1)
  puts "#{current_player.name} wins!"
else
  puts "It's a draw!"
end