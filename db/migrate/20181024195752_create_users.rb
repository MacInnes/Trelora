class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :HTTP_AUTH_TOKEN

      t.timestamps
    end
  end
end
