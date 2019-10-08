class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid? # Since our 'sender' and 'receiver' attributes are Class instances of 'BankAccount' class, we can use the 'valid?' method on them.
    @sender.valid? && @receiver.valid? ? true : false # We compare to see if both are true.
  end

  def execute_transaction
    if @sender.balance > @amount && @status == 'pending'
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

  end

end
