#RetirementCard.rb
require './Card.rb'

class RetirementCard < Card

	def travel(date, desc, price)
		super(date, desc, price * 0.8)
	end
end