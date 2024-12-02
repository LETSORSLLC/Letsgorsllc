class DropOff
  attr_accessor :ride_id, :dropped_off_at

  def initialize(ride_id)
    @ride_id = ride_id
    @dropped_off_at = Time.now
  end

  def complete_ride
    puts "Ride #{ride_id} completed at #{dropped_off_at}"
  end
end
