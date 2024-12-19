require 'httparty'
require 'dotenv/load'

class AccurateApiService
  include HTTParty
  base_uri 'https://api.accuratebackground.com'

  def initialize
    @api_key = ENV['ACCURATE_API_KEY']
  end

  def run_background_check(driver_id, driver_info)
    options = {
      headers: { 'Authorization' => "Bearer #{@api_key}", 'Content-Type' => 'application/json' },
      body: driver_info.to_json
    }
    self.class.post("/v3/background-checks", options)
  end
end
