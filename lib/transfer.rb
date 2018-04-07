class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status == "pending"
      sender.balance = sender.balance - 50
      receiver.balance = receiver.balance + 50
      self.status = "complete"
    else
      return self.status = "complete"
    end
    if sender.valid? == false
      return "Transaction rejected. Please check your account balance."
    else
      execute_transaction
    end
  end

  def reverse_transfer
    sender.balance = sender.balance + 50
    receiver.balance = receiver.balance - 50
    self.status = "reversed"
  end

  

end
