class Weather
  attr_reader :temperature,
              :conditions

  def initialize(forecast)
    @temperature = forecast[:current][:temp]
    @conditions = forecast[:current][:weather][0][:description]
  end
end
