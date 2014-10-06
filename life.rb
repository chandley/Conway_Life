class Cell
	attr_accessor :status, :neigbours
	def initialize
		@status = :dead
		@neigbours = []
	end
end

class Board
	attr_accessor :cells
	def initialize (size = 20)
		@cells = []
		(0..size-1).each do |row|
			row = []
			(0..size-1).each {row.push Cell.new}
			@cells.push row
		end
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
	puts '-'*cells.count+1
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
