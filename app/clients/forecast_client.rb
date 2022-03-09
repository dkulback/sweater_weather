class ForecastClient
  def self.get_url(url, lat, lng)
    conn = Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params[:appid] = ENV['weather_api_key']
      faraday.params[:units] = 'imperial'
      faraday.params[:lat] = lat
      faraday.params[:lon] = lng
      faraday.params[:exclude] = 'minutely'
    end
    response = conn.get(url)
  end

  def self.get_forecast(lat, lng)
    Rails.cache.fetch("forecast-#{lat}-#{lng}", expires_in: 3600) do
      response = get_url('/data/2.5/onecall', lat, lng)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
