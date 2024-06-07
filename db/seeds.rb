require "open-uri"

Favorite.destroy_all
MemeTag.destroy_all
Tag.destroy_all
Meme.destroy_all
User.destroy_all

# Create users
antoine = User.create!(email: "antoine@gmail.com", nickname: "Brissux", password: "123456")
julien = User.create!(email: "julien@gmail.com", nickname: "Julien", password: "password")
anais = User.create!(email: "anais@gmail.com", nickname: "Anaïs", password: "password")
amin = User.create!(email: "amin@gmail.com", nickname: "Amin", password: "password")

# Create memes with images
meme1 = Meme.create!(title: "Alien Theory explication", public: true, user: antoine)
meme1.image.attach(io: URI.open("https://i.imgflip.com/26am.jpg"), filename: 'alien_theory.jpg')

meme2 = Meme.create!(title: "Bouton stress", public: true, user: julien)
meme2.image.attach(io: URI.open("https://i.imgflip.com/1g8my4.jpg"), filename: 'bouton_stress.jpg')

meme3 = Meme.create!(title: "Hide the pain", public: true, user: julien)
meme3.image.attach(io: URI.open("https://content.imageresizer.com/images/memes/Hide-the-pain-Harold-large-meme-8.jpg"), filename: 'hide_the_pain.jpg')

meme4 = Meme.create!(title: "Cerveau Explosion", public: false, user: anais)
meme4.image.attach(io: URI.open("https://i.imgflip.com/1jwhww.jpg"), filename: 'cerveau_explos.jpg')

meme5 = Meme.create!(title: "Drake Dance", public: true, user: amin)
meme5.image.attach(io: URI.open("https://i.imgflip.com/30b1gx.jpg"), filename: 'drake_dance.jpg')

meme6 = Meme.create!(title: "Distracted Boyfriend", public: true, user: amin)
meme6.image.attach(io: URI.open("https://media.wired.com/photos/59a459d1e5238d59ce11404f/master/w_2240,c_limit/MemeLoveTriangle_297886754.jpg"), filename: 'distracted_boyfriend.jpg')

meme7 = Meme.create!(title: "Spiderman Glasses", public: true, user: antoine)
meme7.image.attach(io: URI.open("https://i.kym-cdn.com/photos/images/newsfeed/002/102/993/5c6.png"), filename: 'spiderman_glasses.png')

meme8 = Meme.create!(title: "Disaster Girl", public: true, user: anais)
meme8.image.attach(io: URI.open("https://images-prod.dazeddigital.com/900/azure/dazed-prod/1300/6/1306998.jpeg"), filename: 'disaster_girl.jpeg')

meme9 = Meme.create!(title: "a refaire", public: true, user: amin)
meme9.image.attach(io: URI.open("https://images3.memedroid.com/images/UPLOADED26/665ed3e73a291.webp"), filename: 'foucault_meteo.webp')

meme10 = Meme.create!(title: "a refaire", public: true, user: julien)
meme10.image.attach(io: URI.open("https://images3.memedroid.com/images/UPLOADED782/666035d9645cd.webp"), filename: 'chance_vie.webp')

meme11 = Meme.create!(title: "a refaire", public: true, user: julien)
meme11.image.attach(io: URI.open("https://images7.memedroid.com/images/UPLOADED765/665ed3da34938.webp"), filename: 'architecte_escalier.webp')

meme12 = Meme.create!(title: "a refaire", public: true, user: anais)
meme12.image.attach(io: URI.open("https://images7.memedroid.com/images/UPLOADED621/6656ecba89bd8.webp"), filename: 'playlist_pizza.webp')

meme13 = Meme.create!(title: "a refaire", public: true, user: antoine)
meme13.image.attach(io: URI.open("https://images3.memedroid.com/images/UPLOADED460/6655c4386364f.webp"), filename: 'tennis_france.webp')

meme14 = Meme.create!(title: "a refaire", public: true, user: julien)
meme14.image.attach(io: URI.open("https://images3.memedroid.com/images/UPLOADED954/66545147bc814.webp"), filename: 'voiture_copine.webp')

meme15 = Meme.create!(title: "a refaire", public: true, user: antoine)
meme15.image.attach(io: URI.open("https://images3.memedroid.com/images/UPLOADED198/6651f34478a2b.webp"), filename: 'mecanicien_chut.webp')

meme16 = Meme.create!(title: "a refaire", public: true, user: anais)
meme16.image.attach(io: URI.open("https://images7.memedroid.com/images/UPLOADED319/665033ef87a68.webp"), filename: 'metro_after.webp')

meme16 = Meme.create!(title: "a refaire", public: true, user: anais)
meme16.image.attach(io: URI.open("https://images7.memedroid.com/images/UPLOADED319/665033ef87a68.webp"), filename: 'metro_after.webp')

# Create tags
tag_alien_theory = Tag.create!(name: "alien theory")
tag_bouton = Tag.create!(name: "bouton")
tag_hide_the_pain = Tag.create!(name: "pain")
tag_cerveau = Tag.create!(name: "cerveau")
tag_drake = Tag.create!(name: "drake")
tag_funny = Tag.create!(name: "funny") # Common tag
tag_reaction = Tag.create!(name: "reaction") # Common tag

# Create meme_tags
MemeTag.create!(meme: meme1, tag: tag_alien_theory) # Alien Theory explication - alien theory
MemeTag.create!(meme: meme2, tag: tag_bouton) # Bouton stress - bouton
MemeTag.create!(meme: meme2, tag: tag_hide_the_pain) # Hide the pain - pain
MemeTag.create!(meme: meme3, tag: tag_cerveau) # Cerveau Explosion - cerveau
MemeTag.create!(meme: meme4, tag: tag_drake) # Drake Dance - drake

# Associate common tags with memes
MemeTag.create!(meme: meme1, tag: tag_funny) # Alien Theory explication - funny (common tag)
MemeTag.create!(meme: meme2, tag: tag_reaction) # Bouton stress - reaction (common tag)
MemeTag.create!(meme: meme2, tag: tag_hide_the_pain) # Bouton stress - reaction (common tag)
MemeTag.create!(meme: meme3, tag: tag_funny) # Cerveau Explosion - funny (common tag)
MemeTag.create!(meme: meme4, tag: tag_reaction) # Drake Dance - reaction (common tag)


# Create favorites
Favorite.create!(user: antoine, meme: meme2) # Antoine likes Bouton stress
Favorite.create!(user: julien, meme: meme1) # Julien likes Alien Theory explication
Favorite.create!(user: anais, meme: meme4) # Anaïs likes Drake Dance
Favorite.create!(user: amin, meme: meme3) # Amin likes Cerveau Explosion

puts "Seeding completed!"
