class User < ApplicationRecord
  validates_presence_of :name, :email, :auth_token
  validates_uniqueness_of :email, :auth_token
end
