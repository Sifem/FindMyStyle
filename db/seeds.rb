# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

UserSilhouette.destroy_all
Recommendation.destroy_all
Silhouette.destroy_all
User.destroy_all

# User_shiloutte.destroy_all
# Recomendation.destroy_all

puts "All the database destroyed"
puts "Generating database"



#users

lee = User.create!(email: 'lee@gmail.com', password: '123456', full_name: 'lee', payment: false)
irene = User.create!(email: 'irene@gmail.com', password: '123456', full_name: 'irene', payment: false)
sifem = User.create!(email: 'sifem@gmail.com', password: '123456', full_name: 'sifem', payment: true)
sylvia = User.create!(email: 'sylvia@gmail.com', password: '123456', full_name: 'sylvia', payment: true)


#silhouettes

rectangle = Silhouette.create!(neutral_silhouette: "rectangle",
                               combined_silhouette: nil,
                               description:
                              "<p>Your waist is as wide as or just slightly narrower than your shoulders and hipps/thights.
                                  <br>
                                  This body shape dictates that garment pieces have straight vertical side seams or give the impression of one continuous vertical seam line from shoulder to hem.
                                  </p>

                                <ul>
                                  <li><i class='fa-brands fa-square-instagram'></i>The shoulders are never optically diminished.</li>
                                  <li>The shoulders never extend beyond the hips.</li>
                                  <li>Skirts do not taper or flare out at the bottom.</li>
                                  <li>Any other straight vertical lines within the garment will add to
                                  the rectangular quality of this silhouette</li>
                                </ul>",
                               category: "The Wide-Waisted Silhouette")

hourglass= Silhouette.create!(neutral_silhouette: "hourglass",
                              combined_silhouette: nil,
                              description:
                              "<ul>
                                <li>Your shoulders are square and are relatively as wide as your hips/thighs.</li>
                                <li>And your waist is distinctly narrower than your shoulders and hips/thighs.</li>
                              </ul>",
                              category: "The Narrow-Waisted Silhouette")

figure_eight = Silhouette.create!(neutral_silhouette: "eight",
                           combined_silhouette: nil,
                           description:
                           "<ul>
                            <li>Your shoulders are curved and are relatively as wide as your hips/thighs.</li>
                            <li>Your waist is distictly narrower than your shoulders and hips/thighs.</li>
                           </ul>",
                           category: "The Narrow-Waisted Silhouette")

inverted_triangle = Silhouette.create!(neutral_silhouette: "inverted triangle",
                                       combined_silhouette: nil,
                                       description:
                                       "<ul>
                                          <li>Your shoulders are wider than your waist and hips/thighs.</li>
                                       </ul>",
                                       category: "The Wide-Waisted Silhouette")

triangle = Silhouette.create!(neutral_silhouette: "triangle",
                              combined_silhouette: nil,
                              description:
                              "<ul>
                                <li>Your shoulders and waist are narrower than your hips.</li>
                              </ul>",
                              category: "The Wide or Narrow-Waisted Silhouette")

oval = Silhouette.create!(neutral_silhouette: "oval",
                          combined_silhouette: nil,
                          description:
                          "<ul>
                            <li>Your shoulders are narrower or as wide as your hips/thighs.</li>
                            <li>From the front view, your waist appears the same with as,
                            or slightly wider than, or noticeably wider than your shoulders and/or hips.</li>
                            <li>From the side view, your waist does not indent but seems to extend out in front and sometimes in back,
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

                        Recommendation.create!(
                          description: "A side-seamed jacket tailored to contour the oval silhouette's wide waist.",
                          body_part: "Waist",
                          function: "Contour",
                          item: "Side-Seamed Jacket",
                          silhouette_id: oval.id
                        )
                        Recommendation.create!(
                          description: "A belted dress that emphasizes the waist and follows the body's natural curves.",
                          body_part: "Waist",
                          function: "Emphasize",
                          item: "Belted Dress",
                          silhouette_id: figure_eight.id
                        )
                        Recommendation.create!(
                          description: "A flared peplum jacket that enhances the hourglass silhouette by emphasizing the waist.",
                          body_part: "Waist",
                          function: "Highlight",
                          item: "Flared Peplum Jacket",
                          silhouette_id: hourglass.id
                        )
                        Recommendation.create!(
                          description: "A full skirt to balance the narrower upper body of the triangle silhouette.",
                          body_part: "Hips",
                          function: "Balance",
                          item: "Full Skirt",
                          silhouette_id: triangle.id
                        )
                        Recommendation.create!(
                          description: "A peplum top to add volume to the hips and balance the broader shoulders of the inverted triangle silhouette.",
                          body_part: "Hips",
                          function: "Widen",
                          item: "Peplum Top",
                          silhouette_id: inverted_triangle.id
                        )
                        # Create Recommendations for Rectangle Silhouette
                        Recommendation.create!(
                          description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
                          body_part: "Core",
                          function: "Enhance Shape",
                          item: "Belted Coat",
                          silhouette_id: rectangle.id
                        )
                        Recommendation.create!(
                          description: "Emphasize your waist with a stylish high-waisted skirt. The raised waistline draws the eye upward, creating the appearance of a narrower waist and providing a flattering division between your upper and lower body. Choose a skirt with subtle pleating or a flare to add volume and balance to your rectangle silhouette.",
                          body_part: "Waist",
                          function: "Accentuate",
                          item: "High-waisted Skirt",
                          silhouette_id: rectangle.id
                        )
                        Recommendation.create!(
                          description: "Enhance your rectangle silhouette by adding some volume to your hips with a peplum top. The flared ruffle at the waist creates a more pronounced hip area, balancing your silhouette and giving the illusion of curves. This top is particularly effective for creating a more feminine shape, ideal for those with a more linear body type like the rectangle silhouette.",
                          body_part: "Hips",
                          function: "Add Volume",
                          item: "Peplum Top",
                          silhouette_id: rectangle.id
                        )
                        puts "Recommendations for Rectangle Silhouette added successfully!"
