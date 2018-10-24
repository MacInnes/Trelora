class User < ApplicationRecord
  validates_presence_of :name, :email, :HTTP_AUTH_TOKEN
  validates_uniqueness_of :email, :HTTP_AUTH_TOKEN
end
