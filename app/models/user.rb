class User < ApplicationRecord
  after_create :set_api_key

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  private

  def set_api_key
    update(api_key: SecureRandom.uuid) # https://ruby-doc.org/stdlib-2.5.1/libdoc/securerandom/rdoc/SecureRandom.html
  end
end
