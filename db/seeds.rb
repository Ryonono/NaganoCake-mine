# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#!をつけると、うまくいかかった時にエラーを吐いてくれる

Admin.create!(email: 'a@a', encrypted_password: 'aaaaaa', password: 'aaaaaa')
Admin.create!(email: "b@b", encrypted_password: "bbbbbb", password: "bbbbbb")
Admin.create!(email: "h@h", password: "hhhhhh")