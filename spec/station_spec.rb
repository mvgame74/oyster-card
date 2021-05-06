require 'station'

describe Station do
    subject {described_class.new(name: "Victoria", zone: 1)}

    it 'identifies the station as Victoria' do
        expect(subject.name).to eq("Victoria")
    end

    it 'identifies the zone of Victoria as 1' do
        expect(subject.zone).to eq(1)
    end

end