class MileageCalculation
  attr_accessor :start_location, :end_location

  def initialize(start_location, end_location)
    @start_location = start_location
    @end_location = end_location
  end

  def calculate_mileage
    distance = rand(5..20)
    puts "Calculated distance: #{distance} miles"
    distance
  end
end
