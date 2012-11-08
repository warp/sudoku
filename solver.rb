while true
  gets.split("\n").each do |puzzle|
    puzzle = puzzle.chars.map(&:to_i)

    def check(puzzle, x, d)
      ![row(puzzle, x), column(puzzle, x), block(puzzle, x)].flatten.include?(d)
    end

    def row(puzzle, x)
      puzzle.slice(x/9*9, 9)
    end

    def column(puzzle, x)
      (0..8).map {|i| puzzle[i*9+x%9]}
    end

    def block(puzzle, x)
      (0..2).map {|i| puzzle.slice((i*9)+(x/27*27)+(x%9/3*3), 3)}.flatten
    end

    def solve(solution)
      if x = solution.find_index(0)
        (1..9).each do |d|
          if check(solution, x, d)
            solution[x] = d
            # puts "#{solution.join}:#{x}:#{d}"
            return solution if solve(solution)
          end
        end
        solution[x] = 0
        false
      else
        solution
      end
    end

    puts solve(puzzle).join
  end
end