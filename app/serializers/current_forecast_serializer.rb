class CurrentForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  set_type :forecast

  attributes :sunrise,
             :sunset,
             :temperature,
             :feels_like,
             :humidity,
             :uvi,
             :visibility,
             :conditions,
             :icon
end
