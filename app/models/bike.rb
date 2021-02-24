class Bike < ApplicationRecord
  has_many :bookings

  # geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
