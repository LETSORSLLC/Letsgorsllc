require 'opencv'
include OpenCV

class RealTimeCamera
  attr_accessor :ride_id, :driver_id, :camera_status, :capture

  def initialize(ride_id, driver_id)
    @ride_id = ride_id
    @driver_id = driver_id
    @camera_status = "off"
    @capture = nil
  end

  def start_camera
    @camera_status = "on"
    @capture = CvCapture.open
    puts "Real-time camera started for ride #{ride_id} by driver #{driver_id}."
    Thread.new do
      while @camera_status == "on"
        frame = @capture.query
        # Process the frame (e.g., display it or send it to a server)
        # Example: Display the frame in a window
        GUI::Window.new('Real-Time Camera').show(frame)
        GUI::wait_key(10) # Wait for 10ms
      end
    end
  end

  def stop_camera
    @camera_status = "off"
    @capture&.close
    puts "Real-time camera stopped for ride #{ride_id} by driver #{driver_id}."
  end
end