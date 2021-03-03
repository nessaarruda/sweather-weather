require 'rails_helper'

describe RoadTrip do
  describe 'happy path' do
    xit 'exists and has attributes' do
      start_city = "New York, NY"
      end_city = "Los Angeles, CA"

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
          :formattedTime=>"01:44:22",
          :sessionId=>"6007b385-018a-5f21-02b4-3300-0a10803a4a73",
          :hasAccessRestriction=>false,
          :realTime=>6648,
          :hasSeasonalClosure=>false,
          :hasCountryCross=>false,
          :fuelUsed=>5.5}
      }
      weather_data = {
        :dt=>1611122400,
        :temp=>26.11,
        :feels_like=>20.52,
        :pressure=>1029,
        :humidity=>90,
        :dew_point=>23.88,
        :uvi=>0,
        :clouds=>0,
        :visibility=>10000,
        :wind_speed=>1.7,
        :wind_deg=>210,
        :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
        :pop=>0
      }


      road_trip = RoadTrip.new( data, start_city, end_city, weather_data)
      require "pry"; binding.pry
      expect(road_trip).to be_a(RoadTrip)
      expect(road_trip.start_city).to eq(start_city.sub(",", ", ").titleize)
      expect(road_trip.end_city).to eq(end_city.sub(",", ", ").titleize)
      expect(road_trip.travel_time).to eq(data[:route][:formattedTime])

      expect(road_trip.start_city).to eq('New York, NY')
      expect(road_trip.end_city).to eq('Los Angeles, CA')
      #travel time is wrong here, should be 40 hours
      expect(road_trip.travel_time).to eq(expected)
      expect(road_trip.weather_at_eta).to eq(expected)
    end
  end
  describe 'sad path' do
    xit '' do
    end
  end
end
