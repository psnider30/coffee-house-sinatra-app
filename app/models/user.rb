class User < ActiveRecord::Base

  has_many :coffee_house_users
  has_many :coffe_houses, through: :coffee_house_users

end
