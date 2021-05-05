class Oystercard
  attr_reader :balance 
  MAXIMUM_BALANCE = 90
  BALANCE_LIMIT = 1
  
  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    fail "limit exceeded of #{Oystercard::MAXIMUM_BALANCE}" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end
  
  def deduct(amount)
    fail "Failed Operation: Cannot go below 0" if balance - amount < 0
    @balance -= amount
  end

  def touch_in
    fail 'Not enough funds' if @balance < BALANCE_LIMIT
    @status = true
  end

  def in_journey?
    @status
  end

  def touch_out
    @status = false
  end
end