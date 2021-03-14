class Bike < ApplicationRecord
  has_many :bookings
  has_attachments :photos, :maximum => 5

  # validations
  validates :description, :length { minimum: 180, too_short: "%{count} characters is the minimum length for a description, please give more detail!" }

  # geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # finds a bike's unavailable dates, to send to the bike/booking form
  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
