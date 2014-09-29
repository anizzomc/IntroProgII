#Main.rb
require './Card.rb'
require './RetirementCard.rb'
require './StudentCard.rb'

#card = RetirementCard.new
#card = Card.new
card = StudentCard.new("StudentCard")

card.charge(20)
puts "El saldo es: " + card.balance.to_s
card.travel("20140927", "59B hacia Capital, 2 Secciones", 3.5)
puts "El saldo es: " + card.balance.to_s
card.travel("20140927", "Subte D, Congreso de Tucuman", 4.5)
puts "El saldo es: " + card.balance.to_s
card.travel("20140927", "Subte D, Catedral", 4.5)
puts "El saldo es: " + card.balance.to_s


begin
	card.travel("20140927", "La Costera a La Plata", 30)
rescue UnsuficientFunds => e
	puts "No hay fondos para la tarjeta: " + card.serial
	puts e.message
end

card.movements.each do | x |
	puts "#{x.date} - #{x.desc} - #{x.price}"
end
