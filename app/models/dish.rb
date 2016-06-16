class Dish < ActiveRecord::Base

  has_many :likes
  has_many :comments

  def counter
    likes.count
  end
end
