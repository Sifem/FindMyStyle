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
Message.destroy_all
Bookmark.destroy_all
Recommendation.destroy_all
UserSilhouette.destroy_all
Transition.destroy_all
Silhouette.destroy_all
User.destroy_all
Chatroom.destroy_all
# User_shiloutte.destroy_all
puts "Deleting all messages"
puts "All the database destroyed"
puts "Generating database"


Chatroom.create!(name: "AI Stylist")

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

                                <ul>
                                  <li><i class='fa-solid fa-wand-magic-sparkles'></i>The shoulders are never optically diminished.</li>
                                  <br>
                                  <li><i class='fa-solid fa-wand-magic-sparkles'></i>The shoulders never extend beyond the hips.</li>
                                  <br>
                                  <li><i class='fa-solid fa-wand-magic-sparkles'></i>Skirts do not taper or flare out at the bottom.</li>
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

file = File.open("app/assets/images/single_inverted_triangle.png")
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

                        # Create Recommendations for Rectangle Silhouette

file = URI.open("https://res.cloudinary.com/dgugr5vsw/image/upload/fl_preserve_transparency/v1714399794/Variety_Cosmic-Crisp-transparent-658x677_y9rjgg.jpg")
sifem  = Recommendation.new(description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
                       body_part: "Core",
                       function: "Enhance Shape",
                       item: "Belted Coat",
                       exchangeable: rectangle
                      )
                      sifem.photo.attach(io: file, filename: "h", content_type: "image/png")
                      sifem.save

                      file = URI.open("https://res.cloudinary.com/dgugr5vsw/image/upload/fl_preserve_transparency/v1714399794/Variety_Cosmic-Crisp-transparent-658x677_y9rjgg.jpg")
                      sifem  = Recommendation.new(description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
                                             body_part: "Core",
                                             function: "Enhance Shape",
                                             item: "Belted Coat",
                                             exchangeable: rectangle
                                            )
                                            sifem.photo.attach(io: file, filename: "h", content_type: "image/png")
                                            sifem.save


                                            file = URI.open("https://res.cloudinary.com/dgugr5vsw/image/upload/fl_preserve_transparency/v1714399794/Variety_Cosmic-Crisp-transparent-658x677_y9rjgg.jpg")
                                            sifem  = Recommendation.new(description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
                                                                   body_part: "Core",
                                                                   function: "Enhance Shape",
                                                                   item: "Belted Coat",
                                                                   exchangeable: rectangle
                                                                  )
                                                                  sifem.photo.attach(io: file, filename: "h", content_type: "image/png")
                                                                  sifem.save

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


# Recommendations

file = URI.open("https://media.istockphoto.com/id/1498996338/de/foto/ausgefallene-details-des-orangefarbenen-strukturierten-mantels-mit-braunem-lederg%C3%BCrtel.jpg?s=1024x1024&w=is&k=20&c=erbB6WF-4cpIf2j0aYCPZK-D0j9-RRWhJJAEPvHNON4=")
recommendation = Recommendation.new(
  description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
  body_part: "Core",
  function: "Enhance Shape",
  item: "Belted Coat",
  exchangeable: rectangle
)
recommendation.photo.attach(io: file, filename: "y", content_type: "image/png")
recommendation.save

file2 = URI.open("https://media.istockphoto.com/id/1178549488/de/foto/selbstbewusste-frau-mit-zu-sch%C3%BCchternem-l%C3%A4cheln-auf-der-stra%C3%9Fe-in-der-stadt-spazieren.jpg?s=1024x1024&w=is&k=20&c=sgZuAbpLZqJu7YEbS0-GxnuX9-ztHMaupxWjnlcHhXM=")
recommendation2 = Recommendation.new(
  description: "Flatter your triangle silhouette with this flowy midi skirt. Its A-line shape skims over your hips, creating a balanced look, while the high waistband accentuates your narrowest part for a flattering silhouette.",
  body_part: "Lower Body",
  function: "Balance Proportions",
  item: "Flowy Midi Skirt",
  exchangeable: triangle
)
recommendation2.photo.attach(io: file2, filename: "flowy_midi_skirt.jpg", content_type: "image/jpeg")
recommendation2.save

file3 = URI.open("https://media.istockphoto.com/id/2148284655/de/foto/serie-of-studio-photos-of-young-female-model-wearing-silk-satin-red-blouse-with-simple-beige.jpg?s=1024x1024&w=is&k=20&c=6qDabFQV3lTdxUaH8n887Z-xIn1Czk09C5PuNGwnr0s=")

recommendation3 = Recommendation.new(
  description: "Soft and feminine, this wrap blouse is perfect for softening the angular lines of your inverted triangle silhouette. The wrap design draws attention away from broad shoulders, while the V-neckline elongates the torso for a more balanced look.",
  body_part: "Upper Body",
  function: "Soften Shoulders",
  item: "Wrap Blouse",
  exchangeable: inverted_triangle
)
recommendation3.photo.attach(io: file3, filename: "wrap_blouse.jpg", content_type: "image/jpeg")
recommendation3.save


file4 = URI.open("https://media.istockphoto.com/id/811259140/de/foto/selbstvertrauen-ist-eine-super-leistung.jpg?s=1024x1024&w=is&k=20&c=PxO_mYx8NcTpzakea9jCLgIOb4D5MPMUrNHp9vM2Ix4=")

recommendation4 = Recommendation.new(
  description: "Accentuate your hourglass curves with this bodycon dress. Its form-fitting silhouette hugs your body in all the right places, highlighting your narrow waist and balanced proportions for a stunning look.",
  body_part: "Full Body",
  function: "Accentuate Curves",
  item: "Bodycon Dress",
  exchangeable: hourglass
)
recommendation4.photo.attach(io: file4, filename: "bodycon_dress.jpg", content_type: "image/jpeg")
recommendation4.save


file5 = URI.open("https://media.istockphoto.com/id/1793110555/de/foto/fr%C3%B6hliche-stilvoll-gekleidete-frau-in-t-shirt-und-blazer-posiert-vor-dunklem-hintergrund.jpg?s=1024x1024&w=is&k=20&c=gxHGU_3Zb-mQf5Vk8HOEVDIN5O9p0fdYttZyAqsgZfk=")

recommendation5 = Recommendation.new(
  description: "Elevate your figure-eight silhouette with this tailored blazer. Its structured shoulders and nipped-in waist define your curves, while the elongated silhouette creates a sleek and sophisticated look.",
  body_part: "Full Body",
  function: "Define Waist",
  item: "Tailored Blazer",
  exchangeable: eight
)
recommendation5.photo.attach(io: file5, filename: "tailored_blazer.jpg", content_type: "image/jpeg")
recommendation5.save


file6 = URI.open("https://media.istockphoto.com/id/1701783779/de/foto/weibliches-model-in-beigefarbener-smart-casual-hose-mit-hohem-bund-studioaufnahme.jpg?s=1024x1024&w=is&k=20&c=jZEquy4kBIj-oryVNMzfdtKyA1QYj-JSLoWj67YOC2w=")

recommendation6 = Recommendation.new(
  description: "Achieve a sleek and polished look with these high-waisted pants designed for oval silhouettes. The wide-leg design elongates your legs, while the high-rise waistband smooths and flatters your midsection for a flattering silhouette.",
  body_part: "Lower Body",
  function: "Elongate Legs",
  item: "High-Waisted Pants",
  exchangeable: oval
)
recommendation6.photo.attach(io: file6, filename: "high_waisted_pants.jpg", content_type: "image/jpeg")
recommendation6.save

file7 = URI.open("https://media.istockphoto.com/id/1403630633/de/foto/sch%C3%B6ne-frau-steht-in-turnschuhen-und-tailliertem-kornblumenblauem-kleid-mit-langen-%C3%A4rmeln.jpg?s=2048x2048&w=is&k=20&c=biLdL0w2GJn-XvhlV2EUDUhEHRe70nu3DHJTw5FkGRE=")

recommendation7 = Recommendation.new(
  description: "Add definition to your rectangle silhouette with this fitted sheath dress. Its tailored cut accentuates your waistline, creating curves and enhancing your overall shape for a polished and sophisticated look.",
  body_part: "Full Body",
  function: "Define Waist",
  item: "Fitted Sheath Dress",
  exchangeable: rectangle
)
recommendation7.photo.attach(io: file7, filename: "fitted_sheath_dress.jpg", content_type: "image/jpeg")
recommendation7.save

file8 = URI.open("https://media.istockphoto.com/id/619087752/de/foto/eleganz-volle-l%C3%A4nge-des-m%C3%A4dchens-mit-handtasche-und-kopierplatz.jpg?s=1024x1024&w=is&k=20&c=kWihoNUZAGhHr8VA1dmVcNecAN6Ii4pKDmUfxO-enDc=")

recommendation8 = Recommendation.new(
  description: "Create the illusion of curves with this peplum top designed for rectangle silhouettes. The flared hem adds volume to your hips, while the fitted bodice defines your waist, enhancing your natural shape.",
  body_part: "Upper Body",
  function: "Create Curves",
  item: "Peplum Top",
  exchangeable: rectangle
)
recommendation8.photo.attach(io: file8, filename: "peplum_top.jpg", content_type: "image/jpeg")
recommendation8.save

file9 = URI.open("https://media.istockphoto.com/id/1338834908/de/foto/faszinierende-frau-die-f%C3%BCr-ein-foto-in-einem-braunen-jumpsuit-posiert.jpg?s=1024x1024&w=is&k=20&c=EeM-oGqXLrPxkHjUdTgPTQE9fYlfkrmOEUsLGYBZuCQ=")

recommendation9 = Recommendation.new(
  description: "Opt for this belted jumpsuit to accentuate your rectangle silhouette. The cinched waist creates definition, while the wide-leg pants add volume to your lower body, balancing your proportions for a chic and stylish look.",
  body_part: "Full Body",
  function: "Accentuate Waist",
  item: "Belted Jumpsuit",
  exchangeable: rectangle
)
recommendation9.photo.attach(io: file9, filename: "belted_jumpsuit.jpg", content_type: "image/jpeg")
recommendation9.save

file10 = URI.open("https://plus.unsplash.com/premium_photo-1677553955468-80fb1beb2df1?q=80&w=2788&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

recommendation10 = Recommendation.new(
  description: "Achieve a sleek and sophisticated look with this tailored blazer. Its structured silhouette enhances your shoulders, while the single button closure cinches your waist, creating a defined and flattering shape.",
  body_part: "Upper Body",
  function: "Enhance Shoulders",
  item: "Blazer",
  exchangeable: rectangle
)
recommendation10.photo.attach(io: file10, filename: "tailored_blazer2.jpg", content_type: "image/jpeg")
recommendation10.save


file11 = URI.open("https://media.istockphoto.com/id/637625424/de/foto/junge-frau-in-einem-gestreiften-kleid-mit-einem-laptop.jpg?s=1024x1024&w=is&k=20&c=1OdU1mrbrFEHMg7yrtGJ4s8kFNvdnOqLB_va2cDNVSI=")

recommendation11 = Recommendation.new(
  description: "Elevate your casual look with this striped t-shirt dress. The vertical stripes create the illusion of length, while the cinched waist with a tie belt adds definition to your rectangle silhouette, enhancing your curves.",
  body_part: "Full Body",
  function: "Create Illusion of Curves",
  item: "Striped T-Shirt Dress",
  exchangeable: rectangle
)
recommendation11.photo.attach(io: file11, filename: "striped_tshirt_dress.jpg", content_type: "image/jpeg")
recommendation11.save

file12 = URI.open("https://images.pexels.com/photos/264172/pexels-photo-264172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

recommendation12 = Recommendation.new(
  description: "Opt for this fit-and-flare dress to add volume and shape to your rectangle silhouette. The fitted bodice accentuates your waist, while the flared skirt adds movement and creates a feminine and flattering look.",
  body_part: "Full Body",
  function: "Add Shape",
  item: "Fit-and-Flare Dress",
  exchangeable: rectangle
)
recommendation12.photo.attach(io: file12, filename: "fit_and_flare_dress.jpg", content_type: "image/jpeg")
recommendation12.save

file13 = URI.open("https://media.istockphoto.com/id/909016164/de/foto/reife-frau-im-trenchcoat.jpg?s=1024x1024&w=is&k=20&c=jOREw823-YBO4NPaQ1wWcp5CQ1yQnwR4bemlI3vgh-Q=")

recommendation13 = Recommendation.new(
  description: "Make a statement with this belted trench coat. The belted waist creates definition, while the structured silhouette adds polish to your overall look. Perfect for layering over your favorite outfits.",
  body_part: "Full Body",
  function: "Define Waist",
  item: "Belted Trench Coat",
  exchangeable: rectangle
)
recommendation13.photo.attach(io: file13, filename: "belted_trench_coat.jpg", content_type: "image/jpeg")
recommendation13.save

file14 = URI.open("https://images.pexels.com/photos/22039513/pexels-photo-22039513/free-photo-of-kent-sehir-kadin-model.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

recommendation14 = Recommendation.new(
  description: "Add a pop of color to your wardrobe with this tailored blazer. The structured shoulders and tapered waist create a flattering silhouette, while the vibrant hue adds personality to your ensemble.",
  body_part: "Upper Body",
  function: "Flatter Shape",
  item: "Velvet Blazer",
  exchangeable: rectangle
)
recommendation14.photo.attach(io: file14, filename: "colorful_blazer.jpg", content_type: "image/jpeg")
recommendation14.save

file15 = URI.open("https://images.pexels.com/photos/2701269/pexels-photo-2701269.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

recommendation15 = Recommendation.new(
  description: "Stay chic and comfortable in this wrap jumpsuit. The wrap design cinches at the waist, accentuating your curves, while the wide-leg pants elongate your legs for a flattering and effortless look.",
  body_part: "Full Body",
  function: "Accentuate Curves",
  item: "Wrap Jumpsuit",
  exchangeable: rectangle
)
recommendation15.photo.attach(io: file15, filename: "wrap_jumpsuit.jpg", content_type: "image/jpeg")
recommendation15.save

# file = URI.open("https://images.pexels.com/photos/3952091/pexels-photo-3952091.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

# recommendation = Recommendation.new(
#   description: "A side-seamed jacket tailored to contour the oval silhouette's wide waist.",
#   body_part: "Waist",
#   function: "Contour",
#   item: "Side-Seamed Jacket",
#   exchangeable: oval
# )
# recommendation.photo.attach(io: file15, filename: "wrap_jumpsuit.jpg", content_type: "image/jpeg")
# recommendation.save


# file = URI.open("https://images.pexels.com/photos/4424306/pexels-photo-4424306.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

# sifem = Recommendation.new(
#   description: "A belted dress that emphasizes the waist and follows the body's natural curves.",
#   body_part: "Waist",
#   function: "Emphasize",
#   item: "Belted Dress",
#   exchangeable: eight
# )
# sifem.photo.attach(io: file15, filename: "wrap_jumpsuit.jpg", content_type: "image/jpeg")
# sifem.save

# file18 = URI.open("https://images.unsplash.com/flagged/photo-1553802922-e345434156e6?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

# recommendation18 = Recommendation.new(description: "A flared peplum jacket that enhances the hourglass silhouette by emphasizing the waist.",
#   body_part: "Waist",
#   function: "Highlight",
#   item: "Flared Peplum Jacket",
#   exchangeable: hourglass
# )
# recommendation18.photo.attach(io: file15, filename: "wrap_jumpsuit.jpg", content_type: "image/jpeg")
# recommendation18.save

# file19 = URI.open("https://images.unsplash.com/photo-1639512846539-72c0a6e493d9?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

# recommendation19 = Recommendation.new(
#   description: "A full skirt to balance the narrower upper body of the triangle silhouette.",
#   body_part: "Hips",
#   function: "Balance",
#   item: "Full Skirt",
#   exchangeable: triangle
#   )
# recommendation19.photo.attach(io: file15, filename: "wrap_jumpsuit.jpg", content_type: "image/jpeg")
# recommendation19.save

# file20 = URI.open("https://media.istockphoto.com/id/484538320/de/foto/asiatische-frau-in-b-w-gestreiftes-sch%C3%B6%C3%9Fchen-top-oben-und-b%C3%A4lle.jpg?s=1024x1024&w=is&k=20&c=bikG6q1LHJnnlvLK7TsEp_kgw6oyULiomYs4LBn7LxQ=")

# recommendation20 = Recommendation.new(description: "A peplum top to add volume to the hips and balance the broader shoulders of the inverted triangle silhouette.",
#                        body_part: "Hips",
#                        function: "Widen",
#                        item: "Peplum Top",
#                        exchangeable: inverted_triangle
#                       )
# recommendation20.photo.attach(io: file15, filename: "wrap_jumpsuit.jpg", content_type: "image/jpeg")
# recommendation20.save

#                         # Create Recommendations for Rectangle Silhouette

# file21 = URI.open("https://media.istockphoto.com/id/175246718/de/foto/sch%C3%B6ne-frau-in-mantel.jpg?s=1024x1024&w=is&k=20&c=nksfkQ0bW8GnOv_9zBdwGg-lxX6F8EP4DMg63NU_YP4=")
# recommendation21  = Recommendation.new(
#   description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
#   body_part: "Core",
#   function: "Enhance Shape",
#   item: "Belted Coat",
#   exchangeable: trans1
#   )
# recommendation21.photo.attach(io: file, filename: "y", content_type: "image/png")
# recommendation21.save

# file22 = URI.open("https://media.istockphoto.com/id/96162003/de/foto/elegante-frau-in-nachtclub.jpg?s=1024x1024&w=is&k=20&c=i4ummdlB8QV1CQDmhEB_0S1upJD_g9ucDItS_fUffj8=")
# recommendation22  = Recommendation.new(description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
#   body_part: "Core",
#   function: "Enhance Shape",
#   item: "Belted Coat",
#   exchangeable: trans2
#   )
# recommendation22.photo.attach(io: file, filename: "h", content_type: "image/png")
# recommendation22.save


# file23 = URI.open("https://media.istockphoto.com/id/499904294/de/foto/sch%C3%B6ne-frau.jpg?s=1024x1024&w=is&k=20&c=D9uxPhdhjZC2BUjAFVoX-juWmZORznaTqjFyWt0gJ6E=")
# recommendation23  = Recommendation.new(description: "This belted coat is perfect for enhancing the natural lines of your rectangle silhouette. By cinching at the waist with a belt, it helps to create an illusion of curves, optimizing your core from shoulders to thighs. This creates a more defined waistline and adds structure to your overall look.",
#   body_part: "Core",
#   function: "Enhance Shape",
#   item: "Belted Coat",
#   exchangeable: trans3
# )
# recommendation23.photo.attach(io: file, filename: "h", content_type: "image/png")
# recommendation23.save



# file24 = URI.open("https://images.pexels.com/photos/1007018/pexels-photo-1007018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
# recommendation24  = Recommendation.new(
#   description: "Emphasize your waist with a stylish high-waisted skirt. The raised waistline draws the eye upward, creating the appearance of a narrower waist and providing a flattering division between your upper and lower body. Choose a skirt with subtle pleating or a flare to add volume and balance to your rectangle silhouette.",
#   body_part: "Waist",
#   function: "Accentuate",
#   item: "High-waisted Skirt",
#   exchangeable: rectangle
#  )
# recommendation24.photo.attach(io: file, filename: "h", content_type: "image/png")
# recommendation24.save

# file25 = URI.open("https://images.pexels.com/photos/908991/pexels-photo-908991.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
# recommendation25  = Recommendation.new(
#   description: "Emphasize your waist with a stylish high-waisted skirt. The raised waistline draws the eye upward, creating the appearance of a narrower waist and providing a flattering division between your upper and lower body. Choose a skirt with subtle pleating or a flare to add volume and balance to your rectangle silhouette.",
#   body_part: "Waist",
#   function: "Accentuate",
#   item: "low-waisted Skirt",
#   exchangeable: rectangle
#  )
# recommendation25.photo.attach(io: file, filename: "h", content_type: "image/png")
# recommendation25.save

# file26 = URI.open("https://images.pexels.com/photos/2073638/pexels-photo-2073638.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
# recommendation26  = Recommendation.new(
#   description: "Enhance your rectangle silhouette by adding some volume to your hips with a peplum top. The flared ruffle at the waist creates a more pronounced hip area, balancing your silhouette and giving the illusion of curves. This top is particularly effective for creating a more feminine shape, ideal for those with a more linear body type like the rectangle silhouette.",
#   body_part: "Hips",
#   function: "Add Volume",
#   item: "Peplum Top",
#   exchangeable: rectangle
#  )
# recommendation26.photo.attach(io: file, filename: "h", content_type: "image/png")
# recommendation26.save

file = URI.open("https://images.pexels.com/photos/1898733/pexels-photo-1898733.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
recommendation27  = Recommendation.new(
  description: "Round the shoulders in a chemise-style dress",
  body_part: "Shoulders",
  function: "Ovalize",
  item: "Chemise-style dress",
  exchangeable: trans1
)
recommendation27.photo.attach(io: file, filename: "h", content_type: "image/png")
recommendation27.save

file = URI.open("https://images.pexels.com/photos/2395921/pexels-photo-2395921.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
recommendation28  = Recommendation.new(
  description: "second",
  body_part: "Shoulders",
  function: "Ovalize",
  item: "Floral ress",
  exchangeable: trans2
)
recommendation28.photo.attach(io: file, filename: "h", content_type: "image/png")
recommendation28.save

file = URI.open("https://images.pexels.com/photos/3952091/pexels-photo-3952091.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
recommendation29  = Recommendation.new(
  description: "Drop straigth seams from the shoulders to the hem. Don't accent waist",
  body_part: "Waist",
  function: "Add volume",
  item: "Dress",
  exchangeable: trans3
)
recommendation29.photo.attach(io: file, filename: "h", content_type: "image/png")
recommendation29.save
 # Recommendations to transition silhouette


# Transitions

puts "Database updated successfully!"
