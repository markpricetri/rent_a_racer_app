class BikesController < ApplicationController
  def index
    @bikes = Bike.all

    # the `geocoded` scope filters only bikes with coordinates (latitude & longitude)
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end
end
