require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :email}
  it {should validate_presence_of :auth_token}
  it {should validate_uniqueness_of :email}
  it {should validate_uniqueness_of :auth_token}
end
