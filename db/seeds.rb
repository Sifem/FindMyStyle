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
Transition.destroy_all
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

file = File.open("app/assets/images/singl_rect_over.png")
rectangle = Silhouette.new(neutral_silhouette: "rectangle",
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
rectangle.photo.attach(io: file, filename: "a", content_type: "image/png")
rectangle.save

file = File.open("app/assets/images/singl_hour_over.png")
hourglass = Silhouette.new(neutral_silhouette: "hourglass",
                              combined_silhouette: nil,
                              description:
                              "<ul>
                                <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders are square and are relatively as wide as your hips/thighs.</li>
                                <br>
                                <li><i class='fa-solid fa-wand-magic-sparkles'></i>And your waist is distinctly narrower than your shoulders and hips/thighs.</li>
                              </ul>",
                              category: "The Narrow-Waisted Silhouette")
hourglass.photo.attach(io: file, filename: "b", content_type: "image/png")
hourglass.save


file = File.open("app/assets/images/singl_eight_over.png")
eight = Silhouette.new(neutral_silhouette: "eight",
                           combined_silhouette: nil,
                           description:
                           "<ul>
                            <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders are curved and are relatively as wide as your hips/thighs.</li>
                            <br>
                            <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your waist is distictly narrower than your shoulders and hips/thighs.</li>
                           </ul>",
                           category: "The Narrow-Waisted Silhouette")
eight.photo.attach(io: file, filename: "c", content_type: "image/png")
eight.save

file = File.open("app/assets/images/single_reverse_over.png")
inverted_triangle = Silhouette.new(neutral_silhouette: "inverted triangle",
                                       combined_silhouette: nil,
                                       description:
                                       "<ul>
                                        <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders are wider than your waist and hips/thighs.</li>
                                       </ul>",
                                       category: "The Wide-Waisted Silhouette")
inverted_triangle.photo.attach(io: file, filename: "d", content_type: "image/png")
inverted_triangle.save

file = File.open("app/assets/images/singl_triang_over.png")
triangle = Silhouette.new(neutral_silhouette: "triangle",
                              combined_silhouette: nil,
                              description:
                              "<ul>
                                <li><i class='fa-solid fa-wand-magic-sparkles'></i>Your shoulders and waist are narrower than your hips.</li>
                              </ul>",
                              category: "The Wide or Narrow-Waisted Silhouette")
triangle.photo.attach(io: file, filename: "e", content_type: "image/png")
triangle.save

file = File.open("app/assets/images/singl_circle_over.png")
oval = Silhouette.new(neutral_silhouette: "oval",
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
oval.photo.attach(io: file, filename: "f", content_type: "image/png")
oval.save

#

rectangletriangle = Silhouette.create!(neutral_silhouette: "rectangle", combined_silhouette: "hourglass")
eightrectangle = Silhouette.create!(neutral_silhouette: "eight", combined_silhouette: "rectangle")
ovalinverted = Silhouette.create!(neutral_silhouette: "oval", combined_silhouette: "inverted triangle")
iventertedtrianglehour = Silhouette.create!(neutral_silhouette: "inverted_triangle", combined_silhouette: "hourglass")
invertedtriangleeight = Silhouette.create!(neutral_silhouette: "inverted_triangle", combined_silhouette: "eight")

#user_Silhouettes

irenesshape = UserSilhouette.create!(user_id: irene.id, silhouette_id: hourglass.id)
leesshape = UserSilhouette.create!(user_id: lee.id, silhouette_id: ovalinverted.id)
sifemsshape = UserSilhouette.create!(user_id: sifem.id, silhouette_id: rectangle.id)
sylviashape = UserSilhouette.create!(user_id: sylvia.id, silhouette_id: eightrectangle.id)

#recomendations

# Recommendation.create!(silhouette_id: rectangle.id,
#                       description: "Go to the gym",
#                       body_part: "waist",
#                       function: "narrow waist",
#                       item: "belt")
# Recommendation.create!(silhouette_id: invertedtriangleeight.id,
#                       description: "A nice thing is a jackey",
#                       body_part: "torse",
#                       function: "upper volume",
#                       item: "jacket")

# Recommendation.create!(silhouette_id: iventertedtrianglehour.id,
#                         description: "A nice thing is a jackey",
#                         body_part: "torse",
#                         function: "upper volume",
#                         item: "jacket")

Recommendation.create!(description: "A side-seamed jacket tailored to contour the oval silhouette's wide waist.",
                       body_part: "Waist",
                       function: "Contour",
                       item: "Side-Seamed Jacket",
                       exchangeable: oval
                      )
Recommendation.create!(description: "A belted dress that emphasizes the waist and follows the body's natural curves.",
                       body_part: "Waist",
                       function: "Emphasize",
                       item: "Belted Dress",
                       exchangeable: eight
                      )
Recommendation.create!(description: "A flared peplum jacket that enhances the hourglass silhouette by emphasizing the waist.",
                       body_part: "Waist",
                       function: "Highlight",
                       item: "Flared Peplum Jacket",
                       exchangeable: hourglass
                      )
Recommendation.create!(description: "A full skirt to balance the narrower upper body of the triangle silhouette.",
                       body_part: "Hips",
                       function: "Balance",
                       item: "Full Skirt",
                       exchangeable: triangle
                      )
Recommendation.create!(description: "A peplum top to add volume to the hips and balance the broader shoulders of the inverted triangle silhouette.",
                       body_part: "Hips",
                       function: "Widen",
                       item: "Peplum Top",
                       exchangeable: inverted_triangle
                      )

                        # Create Recommendations for Rectangle Silhouette

Recommendation.create!(description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
                       body_part: "Core",
                       function: "Enhance Shape",
                       item: "Belted Coat",
                       exchangeable: rectangle
                      )
Recommendation.create!(description: "Emphasize your waist with a stylish high-waisted skirt. The raised waistline draws the eye upward, creating the appearance of a narrower waist and providing a flattering division between your upper and lower body. Choose a skirt with subtle pleating or a flare to add volume and balance to your rectangle silhouette.",
                       body_part: "Waist",
                       function: "Accentuate",
                       item: "High-waisted Skirt",
                       exchangeable: rectangle
                      )

Recommendation.create!(description: "Enhance your rectangle silhouette by adding some volume to your hips with a peplum top. The flared ruffle at the waist creates a more pronounced hip area, balancing your silhouette and giving the illusion of curves. This top is particularly effective for creating a more feminine shape, ideal for those with a more linear body type like the rectangle silhouette.",
                       body_part: "Hips",
                       function: "Add Volume",
                       item: "Peplum Top",
                       exchangeable: rectangle
                      )
                        # Recommendations to transition silhouette


# Transitions

trans1 = Transition.create!(silhouette_id: rectangle.id, goal: "oval")
trans2 = Transition.create!(silhouette_id: rectangle.id, goal: "eight")
trans3 = Transition.create!(silhouette_id: rectangle.id, goal: "hourglass")
Transition.create!(silhouette_id: rectangle.id, goal: "triangle")
Transition.create!(silhouette_id: rectangle.id, goal: "inverted triangle")

Transition.create!(silhouette_id: oval.id, goal: "rectangle")
Transition.create!(silhouette_id: oval.id, goal: "hourglass")
Transition.create!(silhouette_id: oval.id, goal: "triangle")
Transition.create!(silhouette_id: oval.id, goal: "inverted triangle")

Transition.create!(silhouette_id: eight.id, goal: "rectangle")
Transition.create!(silhouette_id: eight.id, goal: "oval")
Transition.create!(silhouette_id: eight.id, goal: "hourglass")
Transition.create!(silhouette_id: eight.id, goal: "triangle")
Transition.create!(silhouette_id: eight.id, goal: "inverted triangle")

Transition.create!(silhouette_id: hourglass.id, goal: "rectangle")
Transition.create!(silhouette_id: hourglass.id, goal: "oval")
Transition.create!(silhouette_id: hourglass.id, goal: "eight")
Transition.create!(silhouette_id: hourglass.id, goal: "triangle")
Transition.create!(silhouette_id: hourglass.id, goal: "inverted triangle")

Transition.create!(silhouette_id: triangle.id, goal: "rectangle")
Transition.create!(silhouette_id: triangle.id, goal: "oval")
Transition.create!(silhouette_id: triangle.id, goal: "eight")
Transition.create!(silhouette_id: triangle.id, goal: "hourglass")

Transition.create!(silhouette_id: inverted_triangle.id, goal: "rectangle")
Transition.create!(silhouette_id: inverted_triangle.id, goal: "oval")
Transition.create!(silhouette_id: inverted_triangle.id, goal: "eight")
Transition.create!(silhouette_id: inverted_triangle.id, goal: "hourglass")
Transition.create!(silhouette_id: inverted_triangle.id, goal: "triangle")



Recommendation.create!(
  description: "Round the shoulders in a chemise-style dress",
  body_part: "Shoulders",
  function: "Ovalize",
  item: "Chemise-style dress",
  exchangeable: trans1
)

Recommendation.create!(
  description: "second",
  body_part: "Shoulders",
  function: "Ovalize",
  item: "Chemise-style dress",
  exchangeable: trans2
)

Recommendation.create!(
  description: "Drop straigth seams from the shoulders to the hem. Don't accent waist",
  body_part: "Waist",
  function: "Add volume",
  item: "Dress",
  exchangeable: trans3
)

puts "Database updated successfully!"
