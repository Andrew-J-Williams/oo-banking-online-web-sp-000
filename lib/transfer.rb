class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    account_one = BankAccount.name(@sender)
    account_two = BankAccount.name(@receiver)

    if sender.valid? == true && receiver.valid?
      true
    else
      false
    end

  end

end
