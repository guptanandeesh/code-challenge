class LocationsMetadata < ApplicationRecord

  belongs_to :driver

  validates_presence_of :latitude, :longitude, :time

  validates_uniqueness_of :time, scope: :driver_id

end
