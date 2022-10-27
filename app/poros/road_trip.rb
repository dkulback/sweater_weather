class RoadTrip
  attr_reader :travel_time, :start, :end, :data

  def initialize(data)
    @data = data
  end

  def travel_time
    if data[:formattedTime].present?
      data[:formattedTime]
    else
      'Impossible'
    end
  end

  def real_time
    data[:time]
  end

  def start
    if data[:locations].present?
      data[:locations][0][:adminArea5] + ',' + data[:locations][0][:adminArea3]
    else
      ''
    end
  end

  def end_point
    if data[:locations].present?
      data[:locations][1][:adminArea5] + ',' + data[:locations][1][:adminArea3]
    else
      ''
    end
  end

  def format_time_hour
    (real_time / 3600.to_f).round if real_time
  end

  def to_days
    (format_time_hour / 24.to_f).round
  end

  def forecast
    if travel_time == 'Impossible'
      nil
    else
      coordinates = GeocoderServicer.convert_location(end_point)
      ForecastServicer.forecast(coordinates[:lat], coordinates[:lng])
    end
  end

  def weather_eta
    current_forecast = forecast
    if current_forecast
      if format_time_hour >= 8 && to_days <= 5
        weather = current_forecast.daily[to_days - 1]
        { temperature: weather[:max_temp], conditions: weather[:conditions] }
      elsif format_time_hour <= 8
        weather = current_forecast.hourly[format_time_hour - 1]
        { temperature: weather[:temperature], conditions: weather[:conditions] }
      else
        {}
      end
    end
  end
end
