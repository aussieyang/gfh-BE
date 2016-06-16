# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Like.delete_all
Dish.delete_all

food = ['Cake','Pudding','Nuts','Candy','Muffin','Burger']

27.times do |count|

  name = Faker::Commerce.product_name.split(' ')
  name[-1] = food.sample

  options = {
    name: name.join(' '),
    image_url: 'http://s3.amazonaws.com/foodspotting-ec2/reviews/5729827/thumb_600.jpg'
  }

  Dish.create(options)

end
