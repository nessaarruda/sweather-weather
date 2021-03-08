require 'rails_helper'

describe Background do
  describe 'happy path' do
    # not sure how to test this
    it 'exists and has attributes' do
      data = {
        "total": 1648,
        "total_pages": 165,
        "results": [
            {
                "id": "d2-g9HxYQFQ",
                "created_at": "2021-01-11T20:39:58-05:00",
                "updated_at": "2021-03-05T08:25:43-05:00",
                "width": 4928,
                "height": 3264,
                "color": "#404040",
                "blur_hash": "L76RM*xa9ZRj?bIUIUof_4t7M{WB",
                "description": "INSTAGRAM: SARRAMPHOTOGRAPHY",
                "alt_description": "black flat screen tv turned off",
                "urls": {
                    "raw": "https://images.unsplash.com/photo-1610415100206-4f4982ab1330?ixid=MXwyMTAxODl8MHwxfHNlYXJjaHwxfHwnRGVudmVyLCUyMENvJ3xlbnwwfDB8fA&ixlib=rb-1.2.1",
                    "full": "https://images.unsplash.com/photo-1610415100206-4f4982ab1330?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMTAxODl8MHwxfHNlYXJjaHwxfHwnRGVudmVyLCUyMENvJ3xlbnwwfDB8fA&ixlib=rb-1.2.1&q=85",
                    "regular": "https://images.unsplash.com/photo-1610415100206-4f4982ab1330?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMTAxODl8MHwxfHNlYXJjaHwxfHwnRGVudmVyLCUyMENvJ3xlbnwwfDB8fA&ixlib=rb-1.2.1&q=80&w=1080",
                    "small": "https://images.unsplash.com/photo-1610415100206-4f4982ab1330?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMTAxODl8MHwxfHNlYXJjaHwxfHwnRGVudmVyLCUyMENvJ3xlbnwwfDB8fA&ixlib=rb-1.2.1&q=80&w=400",
                    "thumb": "https://images.unsplash.com/photo-1610415100206-4f4982ab1330?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMTAxODl8MHwxfHNlYXJjaHwxfHwnRGVudmVyLCUyMENvJ3xlbnwwfDB8fA&ixlib=rb-1.2.1&q=80&w=200"
                },
                "links": {
                    "self": "https://api.unsplash.com/photos/d2-g9HxYQFQ",
                    "html": "https://unsplash.com/photos/d2-g9HxYQFQ",
                    "download": "https://unsplash.com/photos/d2-g9HxYQFQ/download",
                    "download_location": "https://api.unsplash.com/photos/d2-g9HxYQFQ/download"
                },
                "categories": [],
                "likes": 7,
                "liked_by_user": false,
                "current_user_collections": [],
                "user": {
                    "id": "7vaZ99fSB5o",
                    "updated_at": "2021-03-04T11:44:45-05:00",
                    "username": "nima_sarram",
                    "name": "Nima Sarram",
                    "first_name": "Nima",
                    "last_name": "Sarram",
                    "bio": "INSTAGRAM: SARRAMPHOTOGRAPHY\r\nBased out of Denver Colorado, 17 years old.",
                    "location": "Denver, Co",
                    "links": {
                        "self": "https://api.unsplash.com/users/nima_sarram",
                        "html": "https://unsplash.com/@nima_sarram",
                        "photos": "https://api.unsplash.com/users/nima_sarram/photos",
                        "likes": "https://api.unsplash.com/users/nima_sarram/likes",
                        "portfolio": "https://api.unsplash.com/users/nima_sarram/portfolio",
                        "following": "https://api.unsplash.com/users/nima_sarram/following",
                        "followers": "https://api.unsplash.com/users/nima_sarram/followers"
                    }
                  }
            }
        ]
      }

      background = Background.new(data)

      expect(background).to be_a(Background)
      expect(background.image_url).to eq(data[:results][0][:urls][:regular])
      expect(background.location).to eq(data[:results][0][:user][:location])
      expect(background.credit).to eq(data[:results][0][:user][:name])
    end
  end
  describe 'sad path' do
    xit '' do
    end
  end
end
