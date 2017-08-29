class CoffeeHouseUsers < ActiveRecord::Base

  belongs_to :users
  belongs_to :coffe_houses

end
