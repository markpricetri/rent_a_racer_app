class Bike < ApplicationRecord
  has_many :bookings

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
