# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
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

# Create memes
meme1 = Meme.create!(title: "my first meme", public: true, user: antoine)
meme2 = Meme.create!(title: "funny cat", public: true, user: julien)
meme3 = Meme.create!(title: "coding meme", public: false, user: anais)
meme4 = Meme.create!(title: "weekend vibes", public: true, user: amin)

# Create tags
tag_fun = Tag.create!(name: "fun")
tag_cat = Tag.create!(name: "cat")
tag_coding = Tag.create!(name: "coding")
tag_weekend = Tag.create!(name: "weekend")

# Create meme_tags
MemeTag.create!(meme: meme1, tag: tag_fun) # my first meme - fun
MemeTag.create!(meme: meme2, tag: tag_cat) # funny cat - cat
MemeTag.create!(meme: meme3, tag: tag_coding) # coding meme - coding
MemeTag.create!(meme: meme4, tag: tag_weekend) # weekend vibes - weekend
MemeTag.create!(meme: meme1, tag: tag_cat) # my first meme - cat (additional tag)
MemeTag.create!(meme: meme2, tag: tag_fun) # funny cat - fun (additional tag)

# Create favorites
Favorite.create!(user: antoine, meme: meme2) # Antoine likes funny cat
Favorite.create!(user: julien, meme: meme1) # Julien likes my first meme
Favorite.create!(user: anais, meme: meme4) # Anaïs likes weekend vibes
Favorite.create!(user: amin, meme: meme3) # Amin likes coding meme

puts "Seeding completed!"
