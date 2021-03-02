require 'rails_helper'

describe User do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:password_confirmation)}
  end

  it 'generates api_key when user is created' do
    user = create(:user)
    expect(user.api_key).to_not be_nil
    expect(user.api_key).to be_a(String)
  end
end
