module Api::V1
  class Location
    KILOMETER_RANGE = 4

    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def nearby_driver_ids
      ::Location.near(latitude.to_f, longitude.to_f, KILOMETER_RANGE).pluck(:driver_id)
    end

    private

    attr_accessor :latitude, :longitude

  end
end
