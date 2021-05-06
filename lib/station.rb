class Station

    attr_reader :name, :zone, :stations

    def initialize(station)
        @stations = []
        @name = station[:name]
        @zone = station[:zone]
        add_station
    end

    def add_station
        @stations << {name: @name, zone: @zone}
    end

end