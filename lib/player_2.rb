class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol_validation(symbol)
    @move_history = []
  end

  def make_move
    position = nil
    until valid_position?(position)
      puts "#{name}, please enter a position (1-9)"
      position = gets.chomp.to_i
      puts "Invalid position! Please choose 1-9" unless valid_position?(position)
    end
  position
  end

  def record_move(position)
    @move_history.push(position)
  end

  def move_history
    @move_history
  end

  private

  def symbol_validation(symbol)
    allowed_symbols = ['X', 'x', 'o', 'O']

    if allowed_symbols.include?(symbol)
      symbol.upcase
    else
      raise ArgumentError, "Symbol must be 'X' or 'O'"
    end
  end

  def valid_position?(position)
    position.to_i.between?(1,9)
  end
end