# ask user for two numbers
# ask user for operation to perform
# perform the operation
# output the result

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to the calculator Enter your name: ")

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt("Use a valid name please")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("hmm...that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("hmm...that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG # multi line print
    What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please choose 1,2,3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("the result is #{result}")

  prompt("Do you want to perfom another calculation? (Y to calculate again)")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator!")
