while puzzle = gets

  def check(puzzle, size, x, c)
    ![row(puzzle, size, x), column(puzzle, size, x), block(puzzle, size, x)].join.include?(c)
  end

  def row(puzzle, size, x)
    puzzle.slice(x/size*size, size)
  end

  def column(puzzle, size, x)
    (0...size).map {|i| puzzle[i*size+x%size]}
  end

  def block(puzzle, size, x)
    s = Math.sqrt(size).to_i
    (0..2).map {|i| puzzle.slice((i*size)+(x/(size*s)*(size*s))+(x%size/s*s), s)}.join
  end

  def solve(puzzle, size)
    if x = puzzle =~ /0/
      (1..size).each do |i|
        c = i.to_s(16).upcase
        if check(puzzle, size, x, c)
          puzzle[x] = c
          # puts "#{puzzle}:#{x}:#{c}"
          return puzzle if solve(puzzle, size)
        end
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