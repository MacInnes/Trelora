class User < ApplicationRecord
  validates_presence_of :email, :password

  has_secure_password
end
