class User < ApplicationRecord
  after_create :set_api_key

  has_secure_password

  validates :email, presence: true, uniqueness: true,
  format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'invalid' }

  validates :password, presence: true
  validates :password_confirmation, presence: true

  private

  def set_api_key
    update(api_key: SecureRandom.uuid)
  end
end
