class ForecastServicer
  def self.forecast(lat, lng)
    require 'pry'
    Forecast.new(ForecastClient.get_forecast(lat, lng))
  end
end
