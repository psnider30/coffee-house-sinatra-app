class CoffeeHouse < ActiveRecord::Base

  has_many :coffee_house_users
  has_many :users, through: :coffee_house_users

end
