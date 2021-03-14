class BikesController < ApplicationController
  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)

    # the `geocoded` scope filters only bikes with coordinates (latitude & longitude)
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  # GET /bikes/new
  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
  end
  
  private

  # Callback for methods that share setup or constraints
  def set_bikes
    @bike = Bike.find(params[:id])
    authorize @bike
  end
  

  def bike_params
    params.require(:bike).permit(:make, :model, :price_per_day, :photo)
  end
end
