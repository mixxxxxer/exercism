class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    begin
      raise ArgumentError if !first_operand.kind_of?(Integer) || !second_operand.kind_of?(Integer)
      answer = "#{first_operand} #{operation} #{second_operand} = "
      case operation
      when "+" then return answer + add(first_operand, second_operand).to_s
      when "*" then return answer + mult(first_operand, second_operand).to_s
      when "/" then return answer + divide(first_operand, second_operand).to_s
      else raise SimpleCalculator::UnsupportedOperation
      end
    rescue ZeroDivisionError
      return "Division by zero is not allowed."
    end
  end

  private

  def self.add(num1, num2)
    num1 + num2
  end

  def self.mult(num1, num2)
    num1 * num2
  end

  def self.divide(num1, num2)
    num1 / num2
  end
end