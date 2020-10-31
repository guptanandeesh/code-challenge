module Api::V1
  class Passenger

    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def nearby_available_cabs
      nearby_driver_ids = Api::V1::Location.new(latitude, longitude).nearby_driver_ids
      Driver.where(id: nearby_driver_ids.uniq).map do |hash|
        { name: hash[:name], car_number: hash[:car_number], phone_number: hash[:phone_number] }
      end
    end

    private

    attr_accessor :latitude, :longitude

  end
end
