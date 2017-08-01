class Calculator
  def initialize number1, number2, operation
    @number1 = number1.to_f
    @number2 = number2.to_f
    @operation = operation
  end

  # Метод определяет есть ли числа после запятой так же относится ли к бескончности.
  def have_an_remainder? number
    # почему-то условие "или" покрывает все значение
    # от минус бесконечности до плюс,
    # потому условие пришлось разделить
    return true if number == Float::INFINITY
    return true if number ==  -Float::INFINITY

    if number.to_i != 0
      number.to_f % number.to_i != 0
    else
      true
    end
  end

  def sum
    @number1 + @number2
  end

  def subtraction
    @number1 - @number2
  end

  def multiplication
    @number1 * @number2
  end

  def division
    @number1 / @number2
  end

  def operation
    case @operation
      when '+' then sum
      when '-' then subtraction
      when '*' then multiplication
      when '/' then division
    end
  end

  def answer
    if have_an_remainder? operation
      operation.to_f
    else
      operation.to_i
    end
  end
end