require 'rails_helper'

describe 'Food' do
  describe 'happy path' do
    xit 'exists and has attributes' do
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

      #the trip data is a RoadTrip object, I'm not sure how to mock this type of data to be able to test this poro

      food = Food.new(food_data, trip_data)
    end
  end
end
