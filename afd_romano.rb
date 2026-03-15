class AFD_Romano
  def initialize(cadeia)
    @cadeia = cadeia.upcase
    @indice = 0
    @max = cadeia.size
    @total = 0
  end

  def proximo
    return "" if @indice == @max
    @cadeia[@indice]
  end

  def iniciar
    estado = "q0"
    puts "Estado inicial: #{estado}"

    loop do
      simbolo = proximo

      case [estado, simbolo]

      # ---------- INÍCIO ----------
      in ["q0", "I"]
        @total += 1
        estado = "qI"

      in ["q0", "V"]
        @total += 5
        estado = "qV"

      in ["q0", "X"]
        @total += 10
        estado = "qX"

      in ["q0", "L"]
        @total += 50
        estado = "qL"

      in ["q0", "C"]
        @total += 100
        estado = "qC"

      in ["q0", "D"]
        @total += 500
        estado = "qD"

      in ["q0", "M"]
        @total += 1000
        estado = "qM"

      # ---------- I ----------
      in ["qI", "I"]
        @total += 1
        estado = "qI"

      in ["qI", "V"]
        @total += 3
        estado = "qV"

      in ["qI", "X"]
        @total += 8
        estado = "qX"

      # ---------- X ----------
      in ["qX", "X"]
        @total += 10
        estado = "qX"

      in ["qX", "L"]
        @total += 30
        estado = "qL"

      in ["qX", "C"]
        @total += 80
        estado = "qC"

      in ["qX", "I"]          
        @total += 1
        estado = "qI"

      # ---------- C ----------
      in ["qC", "C"]
        @total += 100
        estado = "qC"

      in ["qC", "D"]
        @total += 300
        estado = "qD"

      in ["qC", "M"]
        @total += 800
        estado = "qM"

      # ---------- V, L, D ----------
      in ["qV", "I"]
        @total += 1
        estado = "qI"

      in ["qL", "X"]
        @total += 10
        estado = "qX"

      in ["qD", "C"]
        @total += 100
        estado = "qC"

      # ---------- M ----------
      in ["qM", "M"]
        @total += 1000
        estado = "qM"

      in ["qM", "C"]
        @total += 100
        estado = "qC"

      in ["qM", "X"]
        @total += 10
        estado = "qX"

      in ["qM", "I"]
        @total += 1
        estado = "qI"

      # ---------- FIM ----------
      in [_, ""]
        if @total <= 3999
          puts "Aceito ✅"
          puts "Valor decimal: #{@total}"
        else
          puts "Erro: valor maior que 3999"
        end
        break

      else
        puts "Rejeitado ❌ (entrada inválida)"
        break
      end

      @indice += 1
      puts "Estado atual: #{estado} | Total: #{@total}"
    end
  end
end

puts "Digite um número romano:"
entrada = gets.chomp

adf = AFD_Romano.new(entrada)
adf.iniciar