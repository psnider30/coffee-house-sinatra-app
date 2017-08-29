class CreateCoffeeHouseUsers < ActiveRecord::Migration[5.1]
  def change

    create_table :coffee_house_users do |t|
      t.integer :user_id
      t.integer :coffee_house_id
    end
  end
end
