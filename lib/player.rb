class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol_validation(symbol)
    @move_history = []
  end

  def make_move(position)
    # move needs to be valid
  end

  #method to call move history
  def move_history
    @move_history
  end

  def record_move(position)
    @move_history.push(position)
  end

  # valid move means 2 things: position is between 1-9, and the move has not been made before

  private

  def symbol_validation?(symbol)
    allowed_symbols = ['X','x','o','O']

    if symbol.includes?(allowed_symbols)
      symbol.upcase
    else
      raise "Error, invalid symbol"
    end
  end

  def position_validation?(position)
    position.to_i.between?(1,9)
  end
end