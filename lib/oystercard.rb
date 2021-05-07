class Oystercard
  attr_reader :balance, :journeys, :journey

  MAXIMUM_BALANCE = 90
  BALANCE_LIMIT = 1
  MINIMUM_FARE = 1
  
  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "limit exceeded of #{Oystercard::MAXIMUM_BALANCE}" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Not enough funds' if @balance < BALANCE_LIMIT
    @journey = Journey.new(station)
  end

  def in_journey?
    @journey == nil || @journey.complete? ? false : true
  end

  def touch_out(station)
    @journey.finish(station)
    deduct(@journey.fare)
    @journeys << {entry: @journey.entry_station, exit: @journey.exit_station}
    @journey = nil
  end

  private

  def deduct(amount=MINIMUM_FARE)
    @balance -= amount
  end
end
