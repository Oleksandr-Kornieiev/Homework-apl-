# Інтерфейс для роботи з платіжними системами
module PaymentProcessor
  def initialize
    raise NotImplementedError,'Метод initialize повинен бути визначений у класі'
  end

  def process_payment
    raise NotImplementedError, 'Метод process_payment повинен бути визначений у класі'
  end
end

# Клас для системи PayPal для адаптації
class PayPal
  def initialize(api_key)
    @api_key = api_key
  end

  def make_payment(amount)
    puts "Payment of $#{amount} processed via PayPal."
  end
end

# Клас для системи Payoneer для адаптації
class Payoneer
  def initialize(username, password)
    @username = username
    @password = password
  end

  def send_payment(amount)
    puts "Payment of $#{amount} initiated via Payoneer."
  end
end

# Клас для системи Wise для адаптації
class Wise
  def initialize(api_token)
    @api_token = api_token
  end

  def transfer_funds(amount, recipient)
    puts "Sent $#{amount} to #{recipient} via Wise."
  end
end

# Адаптер об'єктів для обробки платежів через різні системи
class PaymentProcessorAdapter
  include PaymentProcessor
  def initialize(payment_gateway)
    @payment_gateway = payment_gateway
  end

  def process_payment(amount,recipient)
    case @payment_gateway
    when PayPal
      @payment_gateway.make_payment(amount)
    when Payoneer
      @payment_gateway.send_payment(amount)
    when Wise
      @payment_gateway.transfer_funds(amount, recipient)
    else
      raise "Unsupported payment gateway"
    end
  end
end

# Клієнтський код
order_amount = 200
recipient = "Alex"

paypal = PayPal.new('paypal_api_key')
payoneer = Payoneer.new('payoneer_username', 'payoneer_password')
wise = Wise.new('wise_api_token')

paypal_processor = PaymentProcessorAdapter.new(paypal)
payoneer_processor = PaymentProcessorAdapter.new(payoneer)
wise_processor = PaymentProcessorAdapter.new(wise)

paypal_processor.process_payment(order_amount, "")
payoneer_processor.process_payment(order_amount, "")
wise_processor.process_payment(order_amount, recipient)