class Jogo
    attr_accessor :numbers

    def initialize(numbers = (0..99).to_a)
        @numbers = numbers
    end

    def play(quantity_of_ten, games = 1)
        jogo = ""
        buffer = ""
        games.times do
            case quantity_of_ten
            when 20
                @numbers = (0..99).to_a
                jogo += @numbers.sample(quantity_of_ten).sort.join(" - ")
            when 5
                @numbers = (1..80).to_a
                jogo += @numbers.sample(quantity_of_ten).sort.join(" - ")
            when 6
                @numbers = (1..60).to_a
                jogo += @numbers.sample(quantity_of_ten).sort.join(" - ")
            when 15
                @numbers = (1..25).to_a
                jogo += @numbers.sample(quantity_of_ten).sort.join(" - ")
            end
            jogo.concat("\n")
        end
        File.exist?("nota_fiscal.txt") ? buffer = File.read("nota_fiscal.txt") : File.write("nota_fiscal.txt","")
        registro = nota_fiscal(quantity_of_ten, games)
        File.write("nota_fiscal.txt", "#{buffer}\n#{registro}\n#{jogo}")
    end

    def nota_fiscal(quantity_of_ten, games)
        data = Time.now.strftime("%d/%m/%Y %H:%M:%S")
        tipo_jogo = ""
        case quantity_of_ten
        when 20
            valor = games*3
            tipo_jogo="LOTOMANIA"
        when 5
            valor = games*2.50
            tipo_jogo="QUINA"
        when 6
            valor = games*5
            tipo_jogo="MEGA-SENA"
        when 15
            valor = games*3
            tipo_jogo="LOTOFÁCIL"
        end
        @nota = "==============================================\nDATA #{data}\nVALOR: R$#{valor}\nTIPO DO JOGO: #{tipo_jogo}\n==============================================\n"
    end
end

jogo = Jogo.new
jogo.play(15,3)