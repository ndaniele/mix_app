# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
general_user = User.create(email: 'sampleuser@email.com', password: 'testtest')

Question.create(query: 'Have you ever seen a monkey', user_id: general_user.id )
Question.create(query: 'Do Badgers Scare You', user_id: general_user.id )
Question.create(query: 'Do You Get Nervous When Its Your Turn To Order Food At A Resraunt', user_id: general_user.id )
Question.create(query: 'Do you like cats', user_id: general_user.id )
Question.create(query: 'Would you ever like to go to Sweden', user_id: general_user.id )
Question.create(query: 'Do you like Korean Pop', user_id: general_user.id )