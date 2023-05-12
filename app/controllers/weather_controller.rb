class WeatherController < ApplicationController
  def show
    location = params[:location]
    weather_data = WeatherService.new(WeatherAPI::API_KEY).get_weather(location)
    @temperature = weather_data['temp_c']
    @description = weather_data['condition']['text']
    @location_image = UnsplashService.get_city_image(location)
  end
end
