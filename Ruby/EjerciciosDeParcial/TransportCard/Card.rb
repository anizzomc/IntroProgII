#Card.rb
require './Record.rb'

class UnsuficientFunds < ArgumentError
end

class Card 

	@@limit = -10

	def initialize(serial, balance = 0)
		@serial = serial
		@balance = 0
		@movements = Array.new
	end

	def charge(amount)
		if amount < 0
			raise ArgumentError.new("Amount must be a positive number!")
		end
		@balance += amount
	end

	def travel(date, desc, price) 
		record = Record.new(date, desc, price)

		if price < 0
			raise ArgumentError.new("Price mus be a positive value!")
		end

		if @balance - price < @@limit
			raise UnsuficientFunds.new("Not enogth funds")
		end

		@balance -= price
		@movements.unshift(record)
	end

	def movements
		ret = []
		count = 0
		for r in @movements
			ret.push(r)
			count += 1

			if count == 5
				break
			end

		end
		ret
	end

	def serial
		@serial
	end

	def balance
		@balance
	end

end
