require 'oystercard'

RSpec.describe Oystercard do
  describe "#balance" do
    it "should return the balance on the card" do
      expect(subject.balance).to eq (0)
    end
  end

  describe "#top_up" do
    it 'should add to the balance' do
      expect{ subject.top_up(50) }.to change{ subject.balance }.by (50)
    end
    it 'should error if maximum balace exceeded' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect { subject.top_up 1 }.to raise_error "limit exceeded of #{Oystercard::MAXIMUM_BALANCE}"
    end
  end
end