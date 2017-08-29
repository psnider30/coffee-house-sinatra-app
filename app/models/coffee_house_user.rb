class CoffeeHouseUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :coffee_house

end
