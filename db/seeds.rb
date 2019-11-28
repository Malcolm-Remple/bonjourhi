# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# USER // LANGUAGE // USER_LANGUAGE SEEDS

puts "Destroying users..."

# because of the pb with dependent destroy, we first need to destroy joint tables
UserLanguage.destroy_all
Review.destroy_all
Meetup.destroy_all
User.destroy_all

puts "Creating users..."

malcolm = User.create!(first_name: "Malcolm", last_name: "Remple", email: "malcolm@example.com", password: "aaaaaa", city: "Montreal")

lea = User.create!(first_name: "Lea", last_name: "Grelou", email: "lea@example.com", password: "aaaaaa", city: "Montreal")

lynn = User.create!(first_name: "Lynn", last_name: "Qi", email: "lynn@example.com", password: "aaaaaa", city: "Montreal")

claire = User.create!(first_name: "Claire", last_name: "Froelich", email: "claire@example.com", password: "aaaaaa", city: "Montreal")

counter = 7000
20.times do
  first_name = Faker::Name.first_name
  counter += 1
  User.create!(
    first_name: first_name
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(name: "#{first_name}", domain: 'email')
    password: "aaaaaa",
    city: "Montreal",
    bio: "Hi, I'm looking forward to meeting you! I love talking foreign languages.",
    photo: "https://source.unsplash.com/random/120x120/?portrait&#{counter}",
    num_of_past_meetups: rand(4..44)
    )
end

# en = Language.create!(name: "English (US)", code: "en-US")
# fr = Language.create!(name: "French", code: "fr")
# de = Language.create!(name: "German", code: "de")
# cn = Language.create!(name: "Chinese", code: "zh")
# es = Language.create!(name: "Spanish", code: "es")

# UserLanguage.create!(user: malcolm, language: en, proficiency: 5, seeking: false, sharing: true)
# UserLanguage.create!(user: malcolm, language: fr, proficiency: 2, seeking: true, sharing: false)
# UserLanguage.create!(user: lynn, language: cn, proficiency: 5, seeking: false, sharing: true)
# UserLanguage.create!(user: lynn, language: en, proficiency: 3, seeking: true, sharing: false)
# UserLanguage.create!(user: lea, language: fr, proficiency: 5, seeking: false, sharing: true)
# UserLanguage.create!(user: lea, language: en, proficiency: 4, seeking: true, sharing: false)
# UserLanguage.create!(user: claire, language: en, proficiency: 4, seeking: false, sharing: true)
# UserLanguage.create!(user: claire, language: fr, proficiency: 2, seeking: true, sharing: false)


# # MEETUP SEEDS

# puts "Destorying meetups..."
# # destroy is on the top because of the dependent destroy thing
# puts "Creating meetups..."

# 300.times do
#   Meetup.create!(
#     date: Date.parse("Tue, 10 Aug 2019 01:20:19 -0400 (EDT)"),
#     start_time: Time.now,
#     duration: 60,
#     location: "5333 Ave Casgrain",
#     sender: malcolm,
#     recipient: lea,
#     confirmed: false,
#     greeting: "Yooooo let's meet"
#     seeking_lang:
#     sharing_lang:
#     )
# end
# no need to put longitude & latitude here, it is does automatically

# REVIEW SEEDS
# puts "Destroying reviews.."
# # destroy is on the top because of the dependent destroy thing
# puts "Creating reviews..."

# qualities = %w(punctual patient outgoing fun curious chatty)

# User.all.each do |user|
#   3.times do
#     review = Review.new(
#       # reviewed_user: rand(1..300),
#       # author: rand (1..300),
#       date: Faker::Date.backward(days: 300),
#       content: Faker::Lorem.sentence(word_count: 18),
#       main_quality: qualities.sample
#       )
#     review.user = user
#     review.author = User.where.not(id: user.id).sample
#     review.save!
#   end
# end

# puts "Seeding is done!"
