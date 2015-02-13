require 'builder'

describe WordsearchBuilder do

  let(:builder) { WordsearchBuilder.new }

  it 'builds a 2-D array with default dimensions of 20x20' do
    expect(builder.grid.count).to eq 20
    expect(builder.grid.flatten.count).to eq 400
  end

  it 'prevents non-alphabetical characters' do
    expect(builder.check_chars("kittens")).to eq true
    expect(builder.check_chars("k1tt3n$")).to eq false
  end

  it 'checks the length of its longest side' do
    b = WordsearchBuilder.new(30, 36)
    expect(b.longest_side).to eq 36
  end

  it 'prevents a word longer than the length of the longest side to be submitted' do
    expect{ builder.check_length("thisisaveryveryveryverylongword") }.to raise_error "Word is too long"
  end

  it 'plots the word "battleship" over 10 horizontal consecutive spaces beginning from top left' do
    builder.plot_horizontal("battleship")
    expect(builder.grid[0].compact.join).to eq "battleship"
  end

  it 'plots the word "development" horizontally beginning at space 3,3' do
    builder.plot_horizontal("development", 3, 3)
    expect(builder.grid[3][3]).to eq "d"
  end

  it 'plots the word "octocat" over 7 vertical consecutive spaces beginning from top left' do
    builder.plot_vertical("octocat")
    expect(builder.grid[0][0]).to eq "o"
  end

  it 'plots the word "spaghetti" vertically beginning at space 5,8' do
    builder.plot_vertical("spaghetti", 5, 8)
    expect(builder.grid[5][8]).to eq "s"
  end

  it 'plots the word "dragonfly" diagonally beginning at space 0,0' do
    builder.plot_diagonal("dragonfly")
    expect(builder.grid[0][0]).to eq "d"
  end

  it 'plots the word "butterfly" diagonally beginning at space 3,4' do
    builder.plot_diagonal("butterfly", 3, 4)
    expect(builder.grid[3][4]).to eq "b"
    expect(builder.grid[4][5]).to eq "u"
  end

  it 'raises an error when two words are attempted to be placed horizontally over the same square' do
    builder.plot_horizontal("hello")
    expect{ builder.plot_horizontal("goodbye", 0, 0)}.to raise_error "Letter already here"
  end

end
