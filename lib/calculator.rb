class Calculator
    def initialize(input_array)
        @input_array = []
    end
    
  def get_input
    puts "Please enter a valid mathematical equation with positive integers (i.e. 2 + 2):"
    input = gets.chomp
    
    fill_input_array(input)
  
    if valid_input?
      if calculate.to_s.include?(".0")
        puts "The answer is obviously #{calculate.to_i}!"
        puts "Learn math dummy."
        get_input
      else
        puts "The answer is obviously #{calculate}!"
        puts "Learn math dummy."
        get_input
      end
    else
      puts "You did it wrong. Try again."
      get_input
    end
  end

  def fill_input_array(input)
    @input_array = []
    input.delete(" ").each_char do |i| 
        @input_array << i
    end
  end

  def calculate
    @input_array[0].to_f.send(@input_array[1], @input_array[2].to_f)
  end

  def valid_input?
    operand? && valid_ints? && length?
  end
  
  def operand?
    @input_array[1] == "+" || @input_array[1] == "-" || @input_array[1] == "*" || @input_array[1] == "/" || @input_array[1] == "%"
  end
  
  def valid_ints?
    @input_array[0].to_f > 0 && @input_array[2].to_f > 0
  end
  
  def length?
    @input_array.length == 3
  end
  
end