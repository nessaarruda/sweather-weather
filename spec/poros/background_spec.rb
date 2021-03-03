require 'rails_helper'

describe Background do
  describe 'happy path' do
    # wrong structure is being sent to this poro
    xit 'exists and has attributes' do
      data = {
        :id=>"hdzGZRCYMSU",
        :created_at=>"2020-09-13T19:54:14-04:00",
        :updated_at=>"2021-03-03T11:49:15-05:00",
        :promoted_at=>nil,
        :width=>3888,
        :height=>5184,
        :color=>"#d9f3f3",
        :blur_hash=>"LsG,S1WCtRkC02axWBays:adV@js",
        :description=>nil,
        :alt_description=>"man in blue jacket and black pants riding on snowboard during daytime",
        :urls=>
          {"raw"=>
            "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?ixid=MXwxOTY1NTZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit",
          "full"=>
            "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?crop=entropy&cs=srgb&fm=jpg&ixid=MXwxOTY1NTZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=85&utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit",
          "regular"=>
            "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTY1NTZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit",
          "small"=>
            "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTY1NTZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=400&utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit",
          "thumb"=>
            "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTY1NTZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=200&utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit"},
        :links=>
          {"self"=>"https://api.unsplash.com/photos/hdzGZRCYMSU?utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit",
          "html"=>"https://unsplash.com/photos/hdzGZRCYMSU?utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit",
          "download"=>"https://unsplash.com/photos/hdzGZRCYMSU/download?utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit",
          "download_location"=>"https://api.unsplash.com/photos/hdzGZRCYMSU/download?utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit"},
        :categories=>[],
        :likes=>1,
        :liked_by_user=>false,
        :current_user_collections=>[],
        :sponsorship=>nil,
        :user=>{
          "id"=>"uMT_KSln-6U",
          "updated_at"=>"2021-01-18T05:51:50-05:00",
          "username"=>"mikekilcoyne",
          "name"=>"Michael Kilcoyne",
          "first_name"=>"Michael",
          "last_name"=>"Kilcoyne",
          "twitter_username"=>"mikekilcoyne",
          "portfolio_url"=>"http://mikekilcoyne.com",
          "bio"=>"I love capturing people, animal, places, and things in their element. ",
          "location"=>"Istanbul, Turkey",
          "links"=>
            {"self"=>"https://api.unsplash.com/users/mikekilcoyne",
            "html"=>"https://unsplash.com/@mikekilcoyne",
            "photos"=>"https://api.unsplash.com/users/mikekilcoyne/photos",
            "likes"=>"https://api.unsplash.com/users/mikekilcoyne/likes",
            "portfolio"=>"https://api.unsplash.com/users/mikekilcoyne/portfolio",
            "following"=>"https://api.unsplash.com/users/mikekilcoyne/following",
            "followers"=>"https://api.unsplash.com/users/mikekilcoyne/followers"},
          "profile_image"=>
            {"small"=>"https://images.unsplash.com/profile-1598778372638-601d72333823image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
            "medium"=>"https://images.unsplash.com/profile-1598778372638-601d72333823image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
            "large"=>"https://images.unsplash.com/profile-1598778372638-601d72333823image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
          "instagram_username"=>"itsmemikekilcoyne",
          "total_collections"=>1,
          "total_likes"=>3,
          "total_photos"=>78,
          "accepted_tos"=>true
        }
      }

      background = Background.new(data)
      require "pry"; binding.pry
      expect(background).to be_a(Background)
      expect(background.image_url).to eq(background_background[:urls]['full'])
      expect(background.location).to eq(city)

      expected = {
                  author: background_background[:user]['username'],
                  author_url: background_background[:user]['links']['self'],
                  source: 'unsplash.com'
                }
      expect(background.credit).to eq(expected)
    end
  end
  describe 'sad path' do
    xit '' do
    end
  end
end
