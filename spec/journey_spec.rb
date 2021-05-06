require 'journey'
require 'oystercard'

describe Journey do
  describe 'it saves the journeys from the Oystercard' do
    describe 'validation for touch in or out' do
      let(:entry_station) {:entry_station} 
      let(:exit_station) {:exit_station}

      before do 
        #subject.top_up(20)
        subject.touch_in(entry_station)
      end

      it 'should keep the information of the entry_station' do
        #station = double("Holborn")
        expect(subject.entry_station).to eq(entry_station)
      end
  
      it 'should return false after touching out' do
        subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq(false)
      end
      
      it 'should record the information of both entry & exit station' do
        subject.touch_out(exit_station)
        #expect(subject.exit_station).to eq(exit_station)
          expect(subject.journeys).to eq([{entry: entry_station, exit: exit_station}])
      end

      it 'forget the entry station on touch out' do
        subject.touch_out(exit_station)
        expect(subject.entry_station).to eq(nil)
        expect(subject.exit_station).to eq(nil)
      end

    end
  end
end