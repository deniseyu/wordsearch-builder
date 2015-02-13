class WordsearchBuilder
  attr_accessor :grid
  attr_reader :rows, :columns

  def initialize(height = 20, width = 20)
    @rows, @columns = Array.new(width), Array.new(height)
    @grid = rows.map{|row| columns.map {|column| nil }}
  end

  def longest_side
    [@rows, @columns].max.length
  end

  def check_chars(word)
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
      @grid[index + x][y] = letter
    end
  end

  def plot_diagonal(word, x = 0, y = 0)
    word.chars.each_with_index do |letter, index|
      @grid[index + x][index + y] = letter
    end
  end

  private

  def _plot(word)
    # refactor the plotting methods
  end

end
