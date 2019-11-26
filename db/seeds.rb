# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destorying users.."
UserLanguage.destroy_all
User.destroy_all
puts "creating users.."

malcolm = User.create!(
  first_name: "Malcolm",
  last_name: "Remple",
  email: "malcolm@example.com",
  password: "aaaaaa",
  city: "Montreal"
  )

lea = User.create!(
  first_name: "Lea",
  last_name: "Grelou",
  email: "lea@example.com",
  password: "aaaaaa",
  city: "Montreal"
  )

lynn = User.create!(
  first_name: "Lynn",
  last_name: "Qi",
  email: "lynn@example.com",
  password: "aaaaaa",
  city: "Montreal"
  )

claire = User.create!(
  first_name: "Claire",
  last_name: "Froelich",
  email: "claire@example.com",
  password: "aaaaaa",
  city: "Montreal"
  )

en = Language.create!(name: "English (US)", code: "en-US")
fr = Language.create!(name: "French", code: "fr")
de = Language.create!(name: "German", code: "de")
cn = Language.create!(name: "Chinese", code: "zh")

UserLanguage.create!(user: malcolm, language: en, proficiency: 5, seeking: false, sharing: true)
UserLanguage.create!(user: malcolm, language: fr, proficiency: 2, seeking: true, sharing: false)
UserLanguage.create!(user: lynn, language: cn, proficiency: 5, seeking: false, sharing: true)
UserLanguage.create!(user: lynn, language: en, proficiency: 3, seeking: true, sharing: false)
UserLanguage.create!(user: lea, language: fr, proficiency: 5, seeking: false, sharing: true)
UserLanguage.create!(user: lea, language: en, proficiency: 4, seeking: true, sharing: false)
UserLanguage.create!(user: claire, language: en, proficiency: 4, seeking: false, sharing: true)
UserLanguage.create!(user: claire, language: fr, proficiency: 2, seeking: true, sharing: false)

puts "destorying meetups.."
Meetup.destroy_all
puts "creating meetups.."

Meetup.create!(
  date: Date.parse("Tue, 10 Aug 2019 01:20:19 -0400 (EDT)"),
  start_time: Time.now,
  duration: 60,
  location: "5333 Ave Casgrain",
  sender: malcolm,
  recipient: lea,
  confirmed: false,
  greeting: "Yooooo let's meet"
  )
