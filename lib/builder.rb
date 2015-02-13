class WordsearchBuilder
  attr_accessor :grid
  attr_reader :rows, :columns

  # for interface:
  # - reverse words randomly
  # - upcase all inputs

  def initialize(height = 20, width = 20)
    @rows, @columns = Array.new(width), Array.new(height)
    @grid = rows.map{|row| columns.map {|column| nil }}
  end

  def longest_side
    [@rows, @columns].max.length
  end

  def check_alpha(word)
    word.chars.all?{|char| char =~ /[A-Za-z]/}
  end

  def check_length(word)
    raise "Word is too long" if word.length > longest_side
  end

  def grid_nil?(x, y)
    @grid[x][y] == nil
  end

  def plot_horizontal(word, x = 0, y = 0)
    word.chars.each_with_index do |letter, index|
      raise "Letter already here" unless grid_nil?(x, index+y)
      @grid[x][index + y] = letter
    end
  end

  def plot_vertical(word, x = 0, y = 0)
    word.chars.each_with_index do |letter, index|
      raise "Letter already here" unless grid_nil?(x+index, y)
      @grid[index + x][y] = letter
    end
  end

  def plot_diagonal(word, x = 0, y = 0)
    word.chars.each_with_index do |letter, index|
      raise "Letter already here" unless grid_nil?(index+x, index+y)
      @grid[index + x][index + y] = letter
    end
  end

  def fill_nil_square(x, y)
    @grid[x][y] = _generate_letter
  end

  private

  def _plot(word)
    # refactor the plotting methods
  end

  def _generate_letter
    [ "A", "A", "A", "A", "A", "A", "A", "A",
      "B", "C", "C", "C", "D", "D", "D", "D",
      "E", "E", "E", "E", "E", "E", "E", "E",
      "E", "E", "E", "E", "E", "F", "F", "G",
      "G", "H", "H", "H", "H", "H", "H", "I",
      "I", "I", "I", "I", "I", "I", "J", "K",
      "L", "L", "L", "L", "M", "M", "N", "N",
      "N", "N", "N", "N", "N", "O", "O", "O",
      "O", "O", "O", "O", "P", "P", "Q", "R",
      "R", "R", "R", "R", "R", "S", "S", "S",
      "S", "S", "S", "T", "T", "T", "T", "T",
      "T", "T", "T", "T", "U", "U", "U", "V",
      "W", "W", "X", "Y", "Y", "Z"].sample
  end

end
