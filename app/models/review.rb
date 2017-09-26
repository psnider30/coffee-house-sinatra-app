class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffee_house

  validates_presence_of :content, :user_id, :coffee_house_id
  validates :content, uniqueness: { scope: [:user_id, :coffee_house_id]}

  def slug
    coffee_house.name.downcase.gsub(' ','-') + '-' +
    coffee_house.location.downcase.gsub(' ','-') + '-' + user.username.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    Review.all.find { |review| review.slug == slug }
  end
end
