require 'rails_helper'
require 'httparty'

RSpec.describe UnsplashService, type: :service do
  describe '.get_city_option' do
    let(:city) { 'New York' }
    let(:access_key) { Rails.application.secrets.unsplash_access_key }
    
    it 'returns a valid image URL for a city' do
      stub_request(:get, "#{UnsplashService::BASE_URL}/search/photos?query=#{URI.encode_www_form_component(city)}")
        .with(headers: { 'Authorization' => "Client-ID #{access_key}" })
        .to_return(
          status: 200,
          body: { 'results' => [{ 'urls' => { 'regular' => 'https://example.come/image.jpg' } }] }.to_json
        )

      image_url = UnsplashService.get_city_image(city)

      expect(image_url).to be_present
    end
  end
end
