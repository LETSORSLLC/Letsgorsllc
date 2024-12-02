class RideAcceptance
  attr_accessor :ride_id, :driver_id, :accepted_at

  def initialize(ride_id, driver_id)
    @ride_id = ride_id
    @driver_id = driver_id
    @accepted_at = Time.now
  end

  def accept_ride
    puts "Ride #{ride_id} accepted by driver #{driver_id} at #{accepted_at}"
  end
end
