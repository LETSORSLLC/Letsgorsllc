require_relative 'model/real_time_camera'

# Initialize the RealTimeCamera with sample ride_id and driver_id
camera = RealTimeCamera.new(1, 101)

# Start the camera
camera.start_camera

# Allow the camera to run for a specified duration (e.g., 10 seconds)
sleep(10)

# Stop the camera
camera.stop_camera
