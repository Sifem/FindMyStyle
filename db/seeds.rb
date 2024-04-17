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



rectangle = Silhouette.create!(neutral_silhouette: "rectangle",
                               combined_silhouette: nil,
                               description:
                              "<p>Your waist is as wide as or just slightly narrower than your shoulders and hipps/thighs.
                                  <br>
                                  <br>

                                  This body shape dictates that garment pieces have straight vertical side seams or give the impression of one continuous vertical seam line from shoulder to hem.
                                  </p>
                                  <br>
                                <ul>
                                  <li><i class='fa-solid fa-wand-magic-sparkles'></i>The shoulders are never optically diminished.</li>
                                  <br>
                                  <li><i class='fa-solid fa-wand-magic-sparkles'></i>The shoulders never extend beyond the hips.</li>
                                  <br>
                                  <li><i class='fa-solid fa-wand-magic-sparkles'></i>Skirts do not taper or flare out at the bottom.</li>
                                  <br>
                                  <li><i class='fa-solid fa-wand-magic-sparkles'></i>Any other straight vertical lines within the garment will add to
                                  the rectangular quality of this silhouette</li>
                                </ul>",
                               category: "The Wide-Waisted Silhouette")

hourglass= Silhouette.create!(neutral_silhouette: "hourglass",
                              combined_silhouette: nil,
                              description:
                              "<ul>
                                <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders are square and are relatively as wide as your hips/thighs.</li>
                                <br>
                                <li><i class='fa-solid fa-wand-magic-sparkles'></i>And your waist is distinctly narrower than your shoulders and hips/thighs.</li>
                              </ul>",
                              category: "The Narrow-Waisted Silhouette")

eight = Silhouette.create!(neutral_silhouette: "eight",
                           combined_silhouette: nil,
                           description:
                           "<ul>
                            <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders are curved and are relatively as wide as your hips/thighs.</li>
                            <br>
                            <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your waist is distictly narrower than your shoulders and hips/thighs.</li>
                           </ul>",
                           category: "The Narrow-Waisted Silhouette")

inverted_triangle = Silhouette.create!(neutral_silhouette: "inverted triangle",
                                       combined_silhouette: nil,
                                       description:
                                       "<ul>
                                          <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders are wider than your waist and hips/thighs.</li>
                                       </ul>",
                                       category: "The Wide-Waisted Silhouette")

triangle = Silhouette.create!(neutral_silhouette: "triangle",
                              combined_silhouette: nil,
                              description:
                              "<ul>
                                <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders and waist are narrower than your hips.</li>
                              </ul>",
                              category: "The Wide or Narrow-Waisted Silhouette")

oval = Silhouette.create!(neutral_silhouette: "oval",
                          combined_silhouette: nil,
                          description:
                          "<ul>
                            <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders are narrower or as wide as your hips/thighs.</li>
                            <br>
                            <li><i class='fa-solid fa-wand-magic-sparkles'></i>From the front view, your waist appears the same with as,
                            or slightly wider than, or noticeably wider than your shoulders and/or hips.</li>
                            <br>
                            <li><i class='fa-solid fa-wand-magic-sparkles'></i>From the side view, your waist does not indent but seems to extend out in front and sometimes in back,
                            giving a barrel-like impression from your shoulders to your hips</li>
                           </ul>",
                          category: "The Wide-Waisted Silhouette")


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
