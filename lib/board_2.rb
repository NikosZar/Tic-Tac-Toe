class Board

  WINNING_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # diagonal
    [2, 4, 6]  # diagonal
  ]

  def winner?
    WINNING_COMBINATIONS.any? do |combo|
      values = combo.map { |index| @cells[index] }
      values.uniq.length == 1 && !values[0].nil?
    end
  end

  def draw?
    !winner? && @cells.none?(nil)
  end

  def game_over?
    winner? || draw?
  end

  def initialize
    @cells = Array.new(9, nil)
  end

  # Place symbol on the location
  def place_symbol(position, symbol)
    index = position - 1
    if position_available?(position)
      @cells[index] = symbol
      true
    else
      false
    end
  end

  # Check if position is available -> boolean
  def position_available?(position)
    index = position - 1
    @cells[index].nil? && position.between?(1,9)
  end

  def display
    puts " #{cell_value(0)} | #{cell_value(1)} | #{cell_value(2)} "
    puts "---+---+---"
    puts " #{cell_value(3)} | #{cell_value(4)} | #{cell_value(5)} "
    puts "---+---+---"
    puts " #{cell_value(6)} | #{cell_value(7)} | #{cell_value(8)} "
  end

  private

  def cell_value(index)
    @cells[index] || (index + 1).to_s
  end
end