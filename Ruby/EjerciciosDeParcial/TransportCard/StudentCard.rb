#StudentCard.rb
require './Card.rb'

class StudentCard < Card

	def travel(date, desc, price)
		travels = movements.select { | x | x.date == date }.length
		if travels < 2
			super(date, desc, price*0.2)
		else
			super(date, desc, price)
		end

	end

end