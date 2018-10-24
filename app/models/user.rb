class User < ApplicationRecord
  validates_presence_of :email, :name, :auth_token
end
