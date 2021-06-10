class User < ApplicationRecord
  acts_as_token_authenticatable

  # Note: you can include any module you want. If available,
  # token authentication will be performed before any other
  # Devise authentication method.
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def generate_new_authentication_token
    token = User.generate_unique_secure_token
      update_attributes authentication_token: token
  end
end

