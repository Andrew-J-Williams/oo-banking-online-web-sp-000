class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    account_one = BankAccount.new(@sender)
    account_two = BankAccount.new(@receiver)
  end

end
