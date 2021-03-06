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
		@max_index = size - 1
		#populate empty cells
		(0..@max_index).each do |row|
			row = []
			(0..@max_index).each {row.push Cell.new}
			@cells.push row
		end
		#populate cell neighbours
		@cells.each_with_index do |row,x|
			row.each_with_index {|cell,y| cell.neighbours = get_neighbours(x,y)}
		end

		#setup content - add from file later perhaps
		@cells [1][1].status = :alive
		@cells [2][2].status = :alive
		@cells [2][3].status = :alive
		@cells [3][1].status = :alive
		@cells [3][2].status = :alive

	end

	def get_neighbours cell_row, cell_column
		# returns neighbours of a cell 
		neighbours = []
		size = @max_index + 1
		(cell_row-1..cell_row+1).each do |row|
			row = row < 0 ? row + size : row > @max_index ? row - size : row  # wrap if end of column
			(cell_column-1..cell_column+1).each do |col|
				col = col < 0 ? col + size : col > @max_index ? col - size : col  # wrap if end of column
				neighbours.push @cells[row][col] unless (row == cell_row && col == cell_column) # cell itself not included
			end
		end
		return neighbours	
	end

	def next_generation
		next_cells = [] 
		@cells.each do |row|
			next_row = []
			row.each do |cell|
				new_cell = Cell.new
				case 	cell.neighbours.count {|neighbour| neighbour.status == :alive} 
				when 3
					new_cell.status = :alive
				when 2
					new_cell.status = cell.status 
				else
					new_cell.status = :dead
				end
				next_row.push new_cell
			end
			next_cells.push next_row
		end

		#by copying values into cells, don't need to recreate neighbour relationships
		(0..@max_index).each do |row|
			(0..@max_index).each {|col| @cells[row][col].status = next_cells[row][col].status}
		end
		return next_cells
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

class Game
	def initialize
		@current_generation = Board.new(15)
		@current_generation.show
	end

	def create_next_generation	
		@current_generation.next_generation
		@current_generation.show
	end
end

####################main loop#########################################

my_game = Game.new

loop do
	gets
	my_game.create_next_generation
end

