class Driver < ApplicationRecord

  VALID_PHONE_NUMBER = Regexp.new('\A(?=(.*\d){8})(?!(.*\d){14})[\d()\s+-]{8,}\z')
  VALID_EMAIL= Regexp.new('\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z')
  EMAIL_MAX_LENGTH = 100
  PHONE_NUMBER_MAX_LENGTH = 10

  enum status: {
      active: 'active',
      inactive: 'inactive'
  }

  has_one :location
  has_many :locations_metadata

  validates_presence_of :name, :email, :phone_number, :license_number, :car_number

  validates :email, length: { maximum: EMAIL_MAX_LENGTH }, format: { with: VALID_EMAIL }
  validates :phone_number, length: { maximum: PHONE_NUMBER_MAX_LENGTH }, format: { with: VALID_PHONE_NUMBER }

  validates_uniqueness_of :email, :phone_number, :license_number, :car_number

  before_validation :init

  def init
    self.status ||= :active
  end

end
