require 'rails_helper'

describe Food do
  describe 'happy path' do
    it 'exists and has attributes' do
      food_data = {"businesses":
              [
                {
                  "id": "8wGSggWsopmqoCyd9bY-dw",
                  "alias": "bingo-burger-pueblo-4",
                  "name": "Bingo Burger",
                  "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/KyMKYZ2W8nyjocqzkrrEog/o.jpg",
                  "is_closed": false,
                  "url": "https://www.yelp.com/biz/bingo-burger-pueblo-4?adjust_creative=9U3EVc18DSzKxi0a8SZPOg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=9U3EVc18DSzKxi0a8SZPOg",
                  "review_count": 406,
                  "categories": [
                      {
                          "alias": "burgers",
                          "title": "Burgers"
                      }
                                ],
                  "rating": 4.0,
                  "coordinates": {
                      "latitude": 38.268043,
                      "longitude": -104.609794
                                  },
                  "transactions": [
                      "delivery",
                      "pickup"
                  ],
                  "price": "$$",
                  "location": {
                      "address1": "101 Central Plz",
                      "address2": "",
                      "address3": "",
                      "city": "Pueblo",
                      "zip_code": "81003",
                      "country": "US",
                      "state": "CO",
                      "display_address": [
                          "101 Central Plz",
                          "Pueblo, CO 81003"
                        ]
                      }
                    }
                  ]
                }

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

      weather = {:weather=>{:temperature=>65, :conditions=>"clear"}}

      destination_city = 'puelo, co'
      travel_time = '2:40:00'
      forecast = 78
      food_data = 'Burger Place'

      food = Food.new(food_data, trip_data)
      require "pry"; binding.pry
    end
  end
end
