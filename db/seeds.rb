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

<<<<<<< Updated upstream
# Create memes without images
meme1 = Meme.new(title: "Alien Theory explication", public: true, user: antoine)
meme2 = Meme.new(title: "Bouton stress", public: true, user: julien)
meme3 = Meme.new(title: "Cerveau Explosion", public: false, user: anais)
meme4 = Meme.new(title: "Drake Dance", public: true, user: amin)

# Attach images
meme1.image.attach(io: URI.open("https://i.imgflip.com/26am.jpg"), filename: 'alien_theory.jpg')
meme2.image.attach(io: URI.open("https://i.imgflip.com/1g8my4.jpg"), filename: 'bouton_stress.jpg')
meme3.image.attach(io: URI.open("https://i.imgflip.com/1jwhww.jpg"), filename: 'cerveau_explos.jpg')
=======
# Create memes with images
meme1 = Meme.new(title: "Alien Theory explication", public: true, user: antoine)
meme1.image.attach(io: URI.open("https://i.imgflip.com/26am.jpg"), filename: 'alien_theory.jpg')
meme1.save

meme2 = Meme.new(title: "Bouton stress", public: true, user: julien)
meme2.image.attach(io: URI.open("https://i.imgflip.com/1g8my4.jpg"), filename: 'bouton_stress.jpg')
meme2.save

meme3 = Meme.new(title: "Cerveau Explosion", public: false, user: anais)
meme3.image.attach(io: URI.open("https://i.imgflip.com/1jwhww.jpg"), filename: 'cerveau_explos.jpg')
meme3.save

meme4 = Meme.new(title: "Drake Dance", public: true, user: amin)
>>>>>>> Stashed changes
meme4.image.attach(io: URI.open("https://i.imgflip.com/30b1gx.jpg"), filename: 'drake_dance.jpg')
meme4.save

# Save memes with images attached
meme1.save!
meme2.save!
meme3.save!
meme4.save!

# Create tags
tag_alien_theory = Tag.create!(name: "alien theory")
tag_bouton = Tag.create!(name: "bouton")
tag_cerveau = Tag.create!(name: "cerveau")
tag_drake = Tag.create!(name: "drake")
tag_funny = Tag.create!(name: "funny") # Common tag
tag_reaction = Tag.create!(name: "reaction") # Common tag

# Create meme_tags
MemeTag.create!(meme: meme1, tag: tag_alien_theory) # Alien Theory explication - alien theory
MemeTag.create!(meme: meme2, tag: tag_bouton) # Bouton stress - bouton
MemeTag.create!(meme: meme3, tag: tag_cerveau) # Cerveau Explosion - cerveau
MemeTag.create!(meme: meme4, tag: tag_drake) # Drake Dance - drake

# Associate common tags with memes
MemeTag.create!(meme: meme1, tag: tag_funny) # Alien Theory explication - funny (common tag)
MemeTag.create!(meme: meme2, tag: tag_reaction) # Bouton stress - reaction (common tag)
MemeTag.create!(meme: meme3, tag: tag_funny) # Cerveau Explosion - funny (common tag)
MemeTag.create!(meme: meme4, tag: tag_reaction) # Drake Dance - reaction (common tag)

# Create favorites
Favorite.create!(user: antoine, meme: meme2) # Antoine likes Bouton stress
Favorite.create!(user: julien, meme: meme1) # Julien likes Alien Theory explication
Favorite.create!(user: anais, meme: meme4) # Anaïs likes Drake Dance
Favorite.create!(user: amin, meme: meme3) # Amin likes Cerveau Explosion

puts "Seeding completed!"
