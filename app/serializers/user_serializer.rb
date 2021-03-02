class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :password, :password_confirmation, :api_key
end
