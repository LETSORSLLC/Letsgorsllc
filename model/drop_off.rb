class DropOff
  attr_accessor :ride_id, :dropped_off_at

  def initialize(ride_id)
    raise ArgumentError, 'ride_id cannot be nil' if ride_id.nil?

    @ride_id = ride_id
    @dropped_off_at = Time.now
  end

  def complete_ride
    begin
      log_completion
      # Add database update logic here if needed
    rescue => e
      # Handle errors appropriately
      puts "An error occurred: #{e.message}"
    end
  end

  private

  def log_completion
    # Replace with actual logging mechanism
    puts "Ride #{ride_id} completed at #{dropped_off_at}"
  end
end