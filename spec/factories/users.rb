FactoryBot.define do
  factory :user do
    name { 'steven' }
    email { 'steven@trel.co' }
    HTTP_AUTH_TOKEN { 'this_is_a_very_simple_auth_token_string' }
  end
end
