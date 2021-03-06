class Transfer

	attr_reader :sender, :receiver, :amount
	attr_accessor :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@status = "pending"
		@amount = amount
	end

	def execute_transaction
		if self.valid? and @status == "pending"
			@receiver.balance += @amount
			@sender.balance -= @amount
			@status = "complete"
		else
			@status = "rejected"
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
 		if @status == "complete"
			@receiver.balance -= @amount
			@sender.balance += @amount
			@status = 'reversed'
		end
	end

  def valid?
    @sender.valid? and @receiver.valid? and @sender.balance > @amount
  end

end
