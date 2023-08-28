# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 if Rails.env.development?
 	admin_user = AdminUser.first_or_initialize(email: 'admin@example.com')
    admin_user.password = 'password'
    admin_user.password_confirmation = 'password'
    admin_user.save!
  end
PrivacyPolicy.create(discription: 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is ') if PrivacyPolicy.count.zero?
About.create(discription: 'About us discription ') if About.count.zero?