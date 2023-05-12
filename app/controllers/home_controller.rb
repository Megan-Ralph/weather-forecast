class HomeController < ApplicationController
  def index

  end

  def weather
    location = params[:location]
    render 'weather/show', locals: { location: location }
  end
end