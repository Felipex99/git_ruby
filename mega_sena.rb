time_stamp = Time.now.strftime("%d/%m/%Y %H:%M:%S")
if File.exist?("jogos.txt")
    arquivo = File.write("jogos.txt","DATA: #{time_stamp}\n--------------------------")

else
    arquivo = File.write("jogos.txt","DATA: #{time_stamp}\n")
    puts "Arquivo inexistente"
end





class MegaSena
  attr_accessor :numbers

  def initialize(numbers = (1..60).to_a)
    @numbers = numbers
  end

  def play(quantity_of_ten = 6, games = 1)
    games.times do
      puts @numbers.sample(quantity_of_ten)
                   .sort
                   .map { |n| n < 10 ? "0#{n}" : n.to_s }
                   .join(' - ')
    end
    total(games)
  end

  def total(games)
    value = (games * 5)
    puts '========================================='
    puts "TOTAL A PAGAR: R$ #{value},00"
    puts '========================================='
  end
end

game = MegaSena.new
game.play(6, 3)