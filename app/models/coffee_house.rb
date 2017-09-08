class CoffeeHouse < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews

  def slug
    name.downcase.gsub(' ','-') + '-' + location.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    CoffeeHouse.all.find { |coffee_house| coffee_house.slug == slug }
  end

end
