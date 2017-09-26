class CoffeeHouse < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews

  validates_presence_of :name, :location


  def slug
    name.downcase.gsub(' ','-') + '-' + location.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    CoffeeHouse.all.find { |coffee_house| coffee_house.slug == slug }
  end

end
