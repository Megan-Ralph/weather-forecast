require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe "GET #show" do
    it 'returns the weather information for the specified location' do
      weather_service = instance_double('WeatherService')
      allow(WeatherService).to receive(:new).and_return(weather_service)

      location = 'London'
      temperature = 20.5
      description = 'Sunny'

      allow(weather_service).to receive(:get_weather).with(location).and_return({
        'temp_c' => temperature,
        'condition' => { 'text' => description }
      })

      get :show, params: { location: location }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)

      expect(assigns(:temperature)).to eq(temperature)
      expect(assigns(:description)).to eq(description)
    end
  end
end
