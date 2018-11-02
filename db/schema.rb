ActiveRecord::Schema.define(version: 2018_10_24_195752) do
  enable_extension 'plpgsql'

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'HTTP_AUTH_TOKEN'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
