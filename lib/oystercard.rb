class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  BALANCE_LIMIT = 1
  MINIMUM_FARE = 5
  
  def initialize
    @balance = 0
    @status = false
    @entry_station
  end

  def top_up(amount)
    fail "limit exceeded of #{Oystercard::MAXIMUM_BALANCE}" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail 'Not enough funds' if @balance < BALANCE_LIMIT
    @entry_station = "Holborn"
    @status = true
  end

  def in_journey?
    @status
  end

  def touch_out
    deduct
    @status = false
  end

  private

  def deduct(amount=MINIMUM_FARE)
    # fail "Failed Operation: Cannot go below 0" if balance - amount < 0
    @balance -= amount
  end
end
