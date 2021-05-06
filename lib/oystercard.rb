class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAXIMUM_BALANCE = 90
  BALANCE_LIMIT = 1
  MINIMUM_FARE = 5
  
  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
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

  def touch_out(station)
    deduct
    @exit_station = station
    @journeys << {entry: entry_station, exit: exit_station}
    @entry_station = nil
    @exit_station = nil
  end

  private

  def deduct(amount=MINIMUM_FARE)
    @balance -= amount
  end
end
