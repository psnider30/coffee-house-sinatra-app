class CoffeeHouse < ActiveRecord::Base

  has_many :coffee_house_users
  has_many :users, through: :coffee_house_users

  def slug
    name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    CoffeeHouse.all.find { |coffee_house| coffee_house.slug == slug }
  end

end
