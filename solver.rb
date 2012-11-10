while puzzle = gets

  def check(puzzle, x, c)
    ![row(puzzle, x), column(puzzle, x), block(puzzle, x)].join.include?(c)
  end

  def row(puzzle, x)
    puzzle.slice(x/9*9, 9)
  end

  def column(puzzle, x)
    (0..8).map {|i| puzzle[i*9+x%9]}
  end

  def block(puzzle, x)
    (0..2).map {|i| puzzle.slice((i*9)+(x/27*27)+(x%9/3*3), 3)}.join
  end

  def solve(puzzle)
    if x = puzzle =~ /0/
      ("1".."9").each do |c|
        if check(puzzle, x, c)
          puzzle[x] = c
          # puts "#{puzzle}:#{x}:#{c}"
          return puzzle if solve(puzzle)
        end
      end
      puzzle[x] = "0"
      false
    else
      puzzle
    end
  end

  puts solve(puzzle)
end