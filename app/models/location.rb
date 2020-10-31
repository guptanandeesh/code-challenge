class Location < ApplicationRecord
 include Localizable

  belongs_to :driver

  validates_presence_of :latitude, :longitude

  validates_uniqueness_of :time, scope: :driver_id

end
