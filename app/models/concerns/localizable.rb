module Localizable
  extend ActiveSupport::Concern

  included do
    scope :near, -> lat, lng, radius {
      d =-> b { destination_point(lat, lng, b, radius) }
      where(["latitude BETWEEN ? AND ? AND longitude BETWEEN ? AND ?", d[180][:lat], d[0][:lat], d[270][:lng], d[90][:lng]])
          .where(["COALESCE(distance(?, ?, latitude, longitude), 0) < ?", lat, lng, radius])
    }
  end

  module ClassMethods

    # Return destination point given distance and bearing from start point
    def destination_point(lat, lng, initial_bearing, distance)
      d2r =-> x { x * Math::PI / 180 }
      r2d =-> x { x * 180 / Math::PI }
      angular_distance = distance / 6371.0
      lat1, lng1, bearing = d2r.(lat), d2r.(lng), d2r.(initial_bearing)
      lat2 = Math.asin(Math.sin(lat1) * Math.cos(angular_distance) + Math.cos(lat1) * Math.sin(angular_distance) * Math.cos(bearing))
      lng2 = lng1 + Math.atan2(Math.sin(bearing) * Math.sin(angular_distance) * Math.cos(lat1), Math.cos(angular_distance) - Math.sin(lat1) * Math.sin(lat2))
      { :lat => r2d.(lat2).round(7), :lng => r2d.(lng2).round(7) }
    end

  end
end