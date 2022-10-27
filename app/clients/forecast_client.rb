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
<<<<<<< HEAD
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_forecast(lat, lng)
    get_url('/data/2.5/onecall', lat, lng)
=======
  end

  def self.get_forecast(lat, lng)
    response = get_url('/data/2.5/onecall', lat, lng)
    JSON.parse(response.body, symbolize_names: true)
>>>>>>> 7b76e35f2193825ceefd4dc789efc50c7e595494
  end
end
