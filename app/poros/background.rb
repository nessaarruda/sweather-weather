class Background
  attr_reader :location,
              :image_url,
              :credit

  def initialize(data)
    @location = data[:results][0][:user][:location]
    @image_url = data[:results][0][:urls][:regular]
    @credit = data[:results][0][:user][:name]
  end
end
