namespace :background_check do
  desc "Run background checks for all drivers"
  task run: :environment do
    service = AccurateApiService.new
    # Assuming you have a Driver model with necessary driver data
    Driver.find_each do |driver|
      response = service.run_background_check(driver.id, driver.info)
      # Handle response
    end
  end
end
