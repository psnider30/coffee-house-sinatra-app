class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffee_house

  def slug
    self.coffee_house.name.downcase.gsub(' ','-') + '-' +
    self.coffee_house.location.downcase.gsub(' ','-') + '-' + self.user.username.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    Review.all.find { |review| review.slug == slug }
  end
end
