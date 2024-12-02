class RealTimeCamera
  attr_accessor :ride_id, :driver_id, :camera_status

  def initialize(ride_id, driver_id)
    @ride_id = ride_id
    @driver_id = driver_id
    @camera_status = "off"
  end

  def start_camera
    @camera_status = "on"
    puts "Real-time camera started for ride #{ride_id} by driver #{driver_id}."
    # Add logic to start camera streaming
  end

  def stop_camera
    @camera_status = "off"
    puts "Real-time camera stopped for ride #{ride_id} by driver #{driver_id}."
    # Add logic to stop camera streaming
  end
end
