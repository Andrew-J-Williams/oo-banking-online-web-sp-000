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

    if account_one.valid? == true && account_two.valid? == true
      true
    else
      false
  end

end
