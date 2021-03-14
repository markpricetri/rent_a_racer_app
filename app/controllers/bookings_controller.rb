class BookingsController < 
  before_action :set_booking, only: [:show]

  def index
  @bookings = policy_scope(Booking).order(created_at: :desc)  
  end

  def show
  end
  
  # GET /bookings/new
  def new
    @booking = Booking.new
    authorize @booking
  end 

  def create
    @booking = Booking.new(booking_params)
  end
  
  private

  # Callback for methods that share setup or constraints
  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
  
  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
