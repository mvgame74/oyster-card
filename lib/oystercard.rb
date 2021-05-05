class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  BALANCE_LIMIT = 1
  MINIMUM_FARE = 5
  
  def initialize
    @balance = 0
    @entry_station
  end

  def top_up(amount)
    fail "limit exceeded of #{Oystercard::MAXIMUM_BALANCE}" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Not enough funds' if @balance < BALANCE_LIMIT
    @entry_station = station
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_out
    deduct
    @entry_station = nil
  end

  private

  def deduct(amount=MINIMUM_FARE)
    @balance -= amount
  end
end
