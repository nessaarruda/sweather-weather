class BackgroundService
  def self.get_image(location)
    response = conn.get do |req|
      req.params[:query] = location
      req.params[:orientation] = 'landscape'
    end
    parse(response)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/search/photos?') do |req|
      req.params[:client_id] = ENV['BACKGROUND_API_KEY']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
