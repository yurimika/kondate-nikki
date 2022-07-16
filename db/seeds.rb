# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by(email: "kondatenikki@gmail.com") do |admin|
    admin.password = "kondatenikkiadmin"
   end

Tag.find_or_create_by(name: "洋食")
Tag.find_or_create_by(name: "和食")
Tag.find_or_create_by(name: "中華")
Tag.find_or_create_by(name: "肉料理")
Tag.find_or_create_by(name: "魚料理")
Tag.find_or_create_by(name: "野菜料理")
Tag.find_or_create_by(name: "卵料理")
Tag.find_or_create_by(name: "麵類")
