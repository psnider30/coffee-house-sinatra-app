class CreateUsers < ActiveRecord::Migration[5.1]
  def change

    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :coffee_house_id
    end
  end
end
