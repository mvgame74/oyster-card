class Oystercard
  attr_reader :balance 
  MAXIMUM_BALANCE = 90
  
  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "limit exceeded of #{Oystercard::MAXIMUM_BALANCE}" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end
end