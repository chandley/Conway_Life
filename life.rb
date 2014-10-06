class Cell
	attr_accessor :status, :neighbours
	def initialize
		@status = :dead
		@neighbours = []
	end
end

class Board
	attr_accessor :cells
	def initialize (size = 10)
		@cells = []
		#populate empty cells
		(0..size-1).each do |row|
			row = []
			(0..size-1).each {row.push Cell.new}
			@cells.push row
		end
		#populate cell neighbours
		(0..size-1).each do |row|
			(0..size-1).each {|col| cells[row][col].neighbours = get_neighbours(row,col)}
		end

		#setup content - add from file later
		@cells [1][1].status = :alive
		@cells [2][2].status = :alive
		@cells [2][3].status = :alive
		@cells [3][1].status = :alive
		@cells [3][2].status = :alive

		@cells [7][7].neighbours.each {|cell| cell.status = :alive}
	end

	def get_neighbours cell_row, cell_column
		neighbours = []
		(cell_row-1..cell_row+1).each do |row|
			row = row < 0 ? row + 10 : row > 9 ? row - 10 : row
			(cell_column-1..cell_column+1).each do |col|
				col = col < 0 ? col + 10 : col > 9 ? col - 10 : col
#				[row, col].each do |index| 	
#					index += @cells.count if index < 0
#					index -= @cells.count if index > @cells.count - 1
#					index += 10 if index < 0
#					index -= 10 if index > 9
#				end
				neighbours.push @cells[row][col] unless (row == cell_row && col == cell_column)
			end
		end
		return neighbours	
	end

	def show 
		cells.each do |row|
			puts '-'* (cells.count*2+1)
			print "|"
			row.each do |cell|
				case cell.status
				when :alive
					print '0'
				when :dead
					print '-'
				end
				print '|'
			end
			puts ''
		end
		puts '-'* (cells.count*2+1)

	end
end

class Generation
	#has Board
end

class Game
	#has generations
end

my_board = Board.new
my_board.show
