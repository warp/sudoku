require 'set'

while puzzle = gets

  def options(puzzle, size, x)
    symbols(size) -
      row(puzzle, size, x) -
      column(puzzle, size, x) -
      block(puzzle, size, x)
  end

  def symbols(size)
    Set.new((1..size).map {|i| i.to_s(16).upcase})
  end

  def row(puzzle, size, x)
    Set.new(puzzle[x/size*size, size].chars)
  end

  def column(puzzle, size, x)
    Set.new((0...size).map {|i| puzzle[i*size+x%size]})
  end

  def block(puzzle, size, x)
    s = Math.sqrt(size).to_i
    Set.new((0...s).map {|i| puzzle[(i*size)+(x/(size*s)*(size*s))+(x%size/s*s), s]}.join.chars)
  end

  def solve(puzzle, size)
    if x = puzzle =~ /0/
      options(puzzle, size, x).each do |i|
        puzzle[x] = i
        # puts "#{puzzle}:#{x}:#{i}"
        return puzzle if solve(puzzle, size)
      end
      puzzle[x] = "0"
      false
    else
      puzzle
    end
  end

  size = Math.sqrt(puzzle.length).to_i
  puts solve(puzzle, size)
end