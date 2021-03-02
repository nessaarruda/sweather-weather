class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil } #defaults id to nil

  attributes :image_url, :location, :credit 
end
