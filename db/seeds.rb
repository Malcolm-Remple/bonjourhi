
# USER SEEDS
puts "Destroying user languages, vocab lists, reviews, meetups, chats, users..."

# because of the pb with dependent destroy, we first need to destroy joint tables
UserLanguage.destroy_all
VocabList.destroy_all
Chat.destroy_all
Review.destroy_all
Meetup.destroy_all
User.destroy_all
Language.destroy_all


puts "Creating users..."

malcolm = User.create!(
  first_name: "Malcolm",
  last_name: "Remple",
  email: "malcolm@example.com",
  password: "aaaaaa",
  city: "Montreal",
  photo: "https://res.cloudinary.com/dgxkozw6v/image/upload/v1575053052/malcolm_h1tacj.png",
  bio: "Full-stack developer",
  num_of_past_meetups: rand(4..44),
  availibility: "M-F after 18:00"
  )

lea = User.create!(
  first_name: "Lea",
  last_name: "Grelou",
  email: "lea@example.com",
  password: "aaaaaa",
  city: "Montreal",
  photo: "https://res.cloudinary.com/dgxkozw6v/image/upload/v1575053048/lea_r4vfxi.png",
  bio: "heya!",
  num_of_past_meetups: rand(4..44),
  availibility: "M-F after 18:00"
  )

lynn = User.create!(
  first_name: "Lynn",
  last_name: "Qi",
  email: "lynn@example.com",
  password: "aaaaaa",
  city: "Montreal",
  photo: "https://res.cloudinary.com/dgxkozw6v/image/upload/v1575053050/lynn_xz1mor.png",
  bio: "Yoooooo!",
  num_of_past_meetups: rand(4..44),
  availibility: "M-F after 18:00"
  )

claire = User.create!(
  first_name: "Claire",
  last_name: "Froelich",
  email: "claire@example.com",
  password: "aaaaaa",
  city: "Montreal",
  photo: "https://res.cloudinary.com/dgxkozw6v/image/upload/v1575053296/face-shot2_j2vpog.jpg",
  bio: "Hi!!!!!!!!",
  num_of_past_meetups: rand(4..44),
  availibility: "M-F after 18:00"
  )

# DEMO USERS
blair = User.create!(
  first_name: "Blair",
  last_name: "Winterstone",
  email: "blair@example.com",
  password: "aaaaaa",
  city: "Montreal",
  photo: 'https://res.cloudinary.com/dgxkozw6v/image/upload/v1575053044/claire_uhozmk.png',
  bio: "Hi! I just moved to Montreal after traveling in South America for a year. I like to collect dead butterflies.",
  num_of_past_meetups: 26,
  availibility: "M-F after 18:00"
  )

antoine = User.create!(
  first_name: "Antoine",
  last_name: "Bisset",
  email: "antoine@example.com",
  password: "aaaaaa",
  city: "Montreal",
  photo: 'https://images.unsplash.com/photo-1511546395756-590dffdcdbd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
  bio: "Salut! I'm looking for persons to practice English with me. I just want to talk about rugby, nothing else.",
  num_of_past_meetups: 5,
  availibility: "M-F after 17:30, Saturdays"
  )
isabelle = User.create!(
  first_name: "Isabelle",
  last_name: "Pelletier",
  email: "isabelle@example.com",
  password: "aaaaaa",
  city: "Montreal",
  photo: 'https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  bio: "Allo! I love catepillars and travelling, let's have a chat (and not cat)!",
  num_of_past_meetups: 28,
  availibility: "Mon-Fri after 18:00"
  )

counter = 7000
70.times do
  first_name = Faker::Name.first_name
  counter += 1
  User.create!(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(name: "#{first_name}"),
    password: "aaaaaa",
    city: "Montreal",
    bio: "Hi, I'm looking forward to meeting you! I love talking foreign languages.",
    photo: "https://source.unsplash.com/random/120x120/?portrait&#{counter}",
    num_of_past_meetups: rand(4..44),
    availibility: "M-F after 17:30, Saturdays"
    )
end

# LANGUAGE SEEDS
en = Language.create!(name: "English", code: "EN", iso_code: 'en-GB')
fr = Language.create!(name: "French", code: "FR",iso_code:'fr-FR')
de = Language.create!(name: "German", code: "DE",iso_code:'de-DE')
cn = Language.create!(name: "Chinese", code: "CN",iso_code:'zh-CN')
es = Language.create!(name: "Spanish", code: "ES",iso_code:'ja-JP')
it = Language.create!(name: "Italian", code: "IT", iso_code:'it-IT')
jp = Language.create!(name: "Japanese", code: "JP", iso_code:'ja-JP')
ko = Language.create!(name: "Korean", code: "KR", iso_code:'ko-KR')
ru = Language.create!(name: "Russian", code: "RU", iso_code:'ru-RU')
pt = Language.create!(name: "Portuguese", code: "PT", iso_code:'pt-BR')

bh_languages = [en,fr,de,cn,es,it,jp,ko,ru,pt]

# USER LANGUAGE SEEDS

# for random users
User.all.each do |user|
  user_language_seeking = UserLanguage.new(
    proficiency: rand(1..3),
    seeking: true,
    sharing: false
    )
  # user_language_seeking.language = Language.find(Language.pluck(:id).sample)
  user_language_seeking.language = en
  user_language_seeking.user = user
  user_language_seeking.save!

  user_language_sharing = UserLanguage.new(
    proficiency: rand(4..5),
    seeking: false,
    sharing: true
    )
  # user_language_sharing.language = Language.get_sharing_lang(user_language_seeking.language)
  user_language_sharing.language = (bh_languages - [en]).sample
  user_language_sharing.user = user
  user_language_sharing.save!
end

# update custom users
# fab four
malcolm.user_languages.where(seeking: true).first.update(language: fr, proficiency: 3)
malcolm.user_languages.where(sharing: true).first.update(language: en, proficiency: 5)
lea.user_languages.where(seeking: true).first.update(language: en, proficiency: 4)
lea.user_languages.where(sharing: true).first.update(language: fr, proficiency: 5)
lynn.user_languages.where(seeking: true).first.update(language: fr, proficiency: 4)
lynn.user_languages.where(sharing: true).first.update(language: cn, proficiency: 5)
claire.user_languages.where(seeking: true).first.update(language: fr, proficiency: 1)
claire.user_languages.where(sharing: true).first.update(language: en, proficiency: 5)

# demo
blair.user_languages.where(seeking: true).first.update(language: fr, proficiency: 1)
blair.user_languages.where(sharing: true).first.update(language: en, proficiency: 5)

antoine.user_languages.where(seeking: true).first.update(language: en, proficiency: 3)
antoine.user_languages.where(sharing: true).first.update(language: fr, proficiency: 5)

isabelle.user_languages.where(seeking: true).first.update(language: en, proficiency: 4)
isabelle.user_languages.where(sharing: true).first.update(language: fr, proficiency: 5)

# MEETUP SEEDS


puts "Creating meetups..."

duration = [30, 60, 90, 120]

# blair past meet ups
26.times do
  Meetup.create!(
  date: Faker::Date.backward(days: 300),
  sender: blair,
  start_time: Time.now,
  duration: duration.sample,
  location: Faker::Time.backward(days: 2),
  confirmed: true,
  greeting: "can't wait to meet you!",
  recipient: User.last,
  sharing_lang: en,
  seeking_lang: fr
  )
end



# User.all.each do |user|
#   3.times do
#     meetup = Meetup.new(
#       date: Faker::Date.backward(days: 300),
#       start_time: Time.now,
#       duration: duration.sample,
#       location: "5333 avenue Casgrain, Montreal",
#       confirmed: false,
#       greeting: "Yooooo let's meet",
#       )
#     meetup.sender = user
#     meetup.recipient = User.where.not(id: user.id).sample
#     meetup.seeking_lang = user.user_languages.where(seeking: true).sample.language
#     meetup.sharing_lang = user.user_languages.where(sharing: true).sample.language
#     meetup.save!
#   end
# end


# REVIEW SEEDS

puts "Creating reviews..."

# antoine bad reviews
Review.create!(
  date: Faker::Date.backward(days: 300),
  content: "Antoine never showed up...." ,
  author: User.last,
  user: antoine
  )
Review.create!(
  date: Faker::Date.backward(days: 300),
  content: "No show and no contact!" ,
  author: User.last(2).first,
  user: antoine
  )
Review.create!(
  date: Faker::Date.backward(days: 300),
  content: "nice guy, showed up a bit late though",
  author: User.last(3).first,
  user: antoine
  )


# isabelle reviews
Review.create!(
  date: Faker::Date.backward(days: 300),
  content: "Isabelle is a delight! She sure knows a lot about catepillars. Danke!" ,
  author: User.last,
  user: isabelle
  )
Review.create!(
  date: Faker::Date.backward(days: 300),
  content: "Merci for everything! Great conversationalist" ,
  author: User.last(2).first,
  user: isabelle
  )
Review.create!(
  date: Faker::Date.backward(days: 300),
  content: "Isabelle est très cool!!!!!",
  author: User.last(3).first,
  user: isabelle
  )
Review.create!(
  date: Faker::Date.backward(days: 300),
  content: "She's very patient and helpped correct my english",
  author: User.last(4).first,
  user: isabelle
  )





# qualities = %w(punctual patient outgoing fun curious chatty)

# User.all.each do |user|
#   3.times do
#     review = Review.new(
#       date: Faker::Date.backward(days: 300),
#       content: Faker::Lorem.sentence(word_count: 18),
#       main_quality: qualities.sample
#       )
#     review.user = user
#     review.author = User.where.not(id: user.id).sample
#     review.save!
#   end
# end

puts "Seeding is done!"
