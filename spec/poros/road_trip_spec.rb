 require 'rails_helper'

describe RoadTrip do
  describe 'happy path' do
    xit 'exists and has attributes' do
      start_city = "new york,ny"
      end_city = "los angeles,ca"

      data = {
        :route=>
          {:hasTollRoad=>false,
          :hasBridge=>true,
          :boundingBox=>{:lr=>{:lng=>-104.605087, :lat=>38.265427}, :ul=>{:lng=>-104.98761, :lat=>39.738453}},
          :distance=>111.38,
          :hasTimedRestriction=>false,
          :hasTunnel=>false,
          :hasHighway=>true,
          :computedWaypoints=>[],
          :routeError=>{:errorCode=>-400, :message=>""},
          :formattedTime=>"40:34:31",
          :sessionId=>"6007b385-018a-5f21-02b4-3300-0a10803a4a73",
          :hasAccessRestriction=>false,
          :realTime=>6648,
          :hasSeasonalClosure=>false,
          :hasCountryCross=>false,
          :fuelUsed=>5.5}
      }
      weather_data = {:hourly=>
                      {:dt=>1614974400,
                        :temp=>72.59,
                        :feels_like=>66.25,
                        :pressure=>1019,
                        :humidity=>18,
                        :dew_point=>27.32,
                        :uvi=>6.2,
                        :clouds=>1,
                        :visibility=>10000,
                        :wind_speed=>3.65,
                        :wind_deg=>206,
                        :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]
                        }}

      road_trip = RoadTrip.new(data, start_city, end_city, weather_data)
      require "pry"; binding.pry

      expect(road_trip).to be_a(RoadTrip)
      expect(road_trip.start_city).to eq(start_city.sub(",", ", ").titleize)
      expect(road_trip.end_city).to eq(end_city.sub(",", ", ").titleize)
      expect(road_trip.travel_time).to eq(data[:route][:formattedTime])

      expect(road_trip.start_city).to eq('New York, NY')
      expect(road_trip.end_city).to eq('Los Angeles, CA')
      expect(road_trip.travel_time).to eq(expected)
      expect(road_trip.weather_at_eta).to eq(expected)
    end
  end
end
