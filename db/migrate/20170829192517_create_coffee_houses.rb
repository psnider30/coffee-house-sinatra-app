class CreateCoffeeHouses < ActiveRecord::Migration[5.1]
  def change

    create_table :coffee_houses do |t|
      t.string :name
      t.string :location
      t.string :review
      t.integer :user_id
    end
  end
end