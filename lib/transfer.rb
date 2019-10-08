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

  def execute_transaction # We first use the method to check and see if our transfer is valid and has a status of 'pending'
    if valid? && @status == 'pending'
      if @sender.balance > amount # We then check to see if the amount the 'sender' is transferring is less than the amount in their balance.
        @sender.balance -= amount # If so, we execute a transfer, removing funds from the sender and giving them to the receiver.
        @receiver.balance += amount # We finish it off by changing our status to 'complete', as to avoid processing the transfer again.
        @status = 'complete'
      else
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end

end
