# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
silhouettes = Silhouette.where(combined_silhouette: nil)
silhouettes.each { |silhouette| silhouette.photo.purge }
Recommendation.destroy_all
UserSilhouette.destroy_all
Silhouette.destroy_all
User.destroy_all
# User_shiloutte.destroy_all

puts "All the database destroyed"
puts "Generating database"



#users

lee = User.create!(email: 'lee@gmail.com', password: '123456', full_name: 'lee', payment: false)
irene = User.create!(email: 'irene@gmail.com', password: '123456', full_name: 'irene', payment: false)
sifem = User.create!(email: 'sifem@gmail.com', password: '123456', full_name: 'sifem', payment: true)
sylvia = User.create!(email: 'sylvia@gmail.com', password: '123456', full_name: 'sylvia', payment: true)


#silhouettes
file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1711448749/pexels-yuri-manei-2235071_rmoew6.jpg?_s=public-apps")
rectangle = Silhouette.new(neutral_silhouette: "retangle", combined_silhouette: nil)
rectangle.photo.attach(io: file, filename: "a", content_type: "image/png")
rectangle.save!

hourglass = Silhouette.create!(neutral_silhouette: "hourglass", combined_silhouette: nil)
eight = Silhouette.create!(neutral_silhouette: "eight", combined_silhouette: nil)
inverted_triangle = Silhouette.create!(neutral_silhouette: "inverted_triangle", combined_silhouette: nil)
triangle = Silhouette.create!(neutral_silhouette: "triangle", combined_silhouette: nil)
oval = Silhouette.create!(neutral_silhouette: "oval", combined_silhouette: nil)

#

rectangletriangle = Silhouette.create!(neutral_silhouette: "rectangle", combined_silhouette: "hourglass")
eightrectangle = Silhouette.create!(neutral_silhouette: "eight", combined_silhouette: "rectangle")
ovalinverted = Silhouette.create!(neutral_silhouette: "oval", combined_silhouette: "inverted triangle")
iventertedtrianglehour = Silhouette.create!(neutral_silhouette: "inverted_triangle", combined_silhouette: "hourglass")
invertedtriangleeight = Silhouette.create!(neutral_silhouette: "inverted_triangle", combined_silhouette: "eight")

#user_Silhouettes

irenesshape = UserSilhouette.create!(user_id: irene.id, silhouette_id: hourglass.id)
leesshape = UserSilhouette.create!(user_id: lee.id, silhouette_id: ovalinverted.id)
sifemsshape = UserSilhouette.create!(user_id: sifem.id, silhouette_id: hourglass.id)
sylviashape = UserSilhouette.create!(user_id: sylvia.id, silhouette_id: eightrectangle.id)

#recomendations

Recommendation.create!(silhouette_id: rectangle.id,
                      description: "Go to the gym",
                      body_part: "waist",
                      function: "narrow waist",
                      item: "belt")
Recommendation.create!(silhouette_id: invertedtriangleeight.id,
                      description: "A nice thing is a jackey",
                      body_part: "torse",
                      function: "upper volume",
                      item: "jacket")

Recommendation.create!(silhouette_id: iventertedtrianglehour.id,
                        description: "A nice thing is a jackey",
                        body_part: "torse",
                        function: "upper volume",
                        item: "jacket")

puts "New database created"
