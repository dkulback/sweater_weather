class RoadTrip
  attr_reader :travel_time, :real_time, :start, :end

  def initialize(data)
    if data[:routeError][:errorCode] == 2
      @travel_time = 'Impossible'
    else
      @travel_time = data[:formattedTime]
      @real_time = data[:realTime]
    end
    if data[:locations].present?
      @start = data[:locations][0][:adminArea5] + ',' + data[:locations][0][:adminArea3]
      @end = data[:locations][1][:adminArea5] + ',' + data[:locations][1][:adminArea3]
    end
  end

  def format_time_hour
    (real_time / 3600.to_f).round
  end

  def to_days
    (format_time_hour / 24.to_f).round
  end

  def forecast
    if @travel_time == 'Impossible'
      nil
    else
      coordinates = GeocoderServicer.convert_location(@end)
      ForecastServicer.forecast(coordinates[:lat], coordinates[:lng])
    end
  end

  def weather_eta
    current_forecast = forecast
    if current_forecast
      if format_time_hour >= 8 && to_days <= 5
        weather = current_forecast.daily[to_days - 1]
        { temperature: weather[:max_temp], conditions: weather[:condtitions] }
      elsif format_time_hour <= 8
        weather = current_forecast.hourly[format_time_hour - 1]
        { temperature: weather[:temperature], conditions: weather[:conditions] }
      else
        {}
      end
    end
  end
end
