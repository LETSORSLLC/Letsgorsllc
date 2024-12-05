class RideAcceptance
  attr_accessor :ride_id, :driver_id, :accepted_at

  def initialize(ride_id, driver_id)
    raise ArgumentError, 'ride_id cannot be nil' if ride_id.nil?
    raise ArgumentError, 'driver_id cannot be nil' if driver_id.nil?

    @ride_id = ride_id
    @driver_id = driver_id
    @accepted_at = Time.now
  end

  def accept_ride
    begin
      log_acceptance
      # Add database update logic here if needed
    rescue => e
      # Handle errors appropriately
      puts "An error occurred: #{e.message}"
    end
  end

  private

  def log_acceptance
    # Replace with actual logging mechanism
    puts "Ride #{ride_id} accepted by driver #{driver_id} at #{accepted_at}"
  end
end
