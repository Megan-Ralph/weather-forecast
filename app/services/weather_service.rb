require 'httparty'

class WeatherService
  include HTTParty
  base_uri WeatherAPI::BASE_URL

  def initialize(api_key)
    @options = { query: { key: api_key } }
  end

  def get_weather(location)
    @options[:query][:q] = location
    response = self.class.get('/current.json', @options)
    response['current']
  end
end
