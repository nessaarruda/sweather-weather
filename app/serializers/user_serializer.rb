class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :users

  attributes :email,
             :api_key
end
