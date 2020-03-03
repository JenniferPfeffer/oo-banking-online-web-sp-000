class Transfer
  attr_accessor :transfer, :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount) 
    @transfer = transfer 
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = 'pending' 
  end 
  def valid? 
    @sender.valid? && @receiver.valid? ? true:false 
  end 
  def execute_transaction 
    if @sender.balance > @amount && @status == 'pending' && valid? == true
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer 
    if @status = 'complete' && valid? == true
    @receiver.balance -= @amount 
    @sender.balance += @amount 
    @status = 'reversed'
    end 
  end
    
    
end
