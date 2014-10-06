class Cell
	attr_accessor :status, :neighbours
	def initialize
		@status = :dead
		@neighbours = []
	end

	def status_next_generation cell

		case cell.neighbours.select{|neigbour| neighbour.status == :alive}.count

			when 0,1
				return :dead
			when 2 
				if @status == :alive 
				 return :alive 
				else
				 return :dead
				end			
			when 3
				return :alive
			when 4..8
				return :dead
		end
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
				neighbours.push @cells[row][col] unless (row == cell_row && col == cell_column)
			end
		end
		return neighbours	
	end

	def next_generation
		next_cells = []
		max_index = @cells.count -1 # there is a problem here!
		max_index = 9		# temporary fix!
		puts "max index #{max_index}"
		(0..max_index).each do |row|
			next_row = []
			(0..max_index).each do |col|
				new_cell = Cell.new
				new_cell.status = status_next_generation @cells[row][col] #rescue new_cell.status = :alive
				next_row.push new_cell
			end
			next_cells.push next_row
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
		@generations = []
		@generations.push @current_generation = Board.new
		@current_generation.show
	end

	def create_next_generation
		new_generation = Board.new
		new_generation.cells = @current_generation.next_generation
		@generations.push @current_generation = new_generation
		@current_generation.show
	end
end

my_game = Game.new
loop do
	wait = gets 
	my_game.create_next_generation
end

