require 'httparty'

class UnsplashService
  BASE_URL = 'https://api.unsplash.com'
  ACCESS_KEY = Rails.application.secrets.unsplash_access_key

  def self.get_city_image(city)
    url = "#{BASE_URL}/search/photos?query=#{URI.encode_www_form_component(city)}"

    response = HTTParty.get(url, headers: { 'Authorization' => "Client-ID #{ACCESS_KEY}" })

    if response.code == 200
      image = JSON.parse(response.body)['results'].first
      return image['urls']['regular'] if image
    end

    nil
  end
end
