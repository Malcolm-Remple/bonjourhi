
# USER SEEDS
puts "Destroying users..."

# because of the pb with dependent destroy, we first need to destroy joint tables
UserLanguage.destroy_all
Review.destroy_all
Meetup.destroy_all
User.destroy_all
Language.destroy_all

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
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(name: "#{first_name}"),
    password: "aaaaaa",
    city: "Montreal",
    bio: "Hi, I'm looking forward to meeting you! I love talking foreign languages.",
    photo: "https://source.unsplash.com/random/120x120/?portrait&#{counter}",
    num_of_past_meetups: rand(4..44)
    )
end

# LANGUAGE SEEDS
en = Language.create!(name: "English (US)", code: "EN")
fr = Language.create!(name: "French", code: "FR")
de = Language.create!(name: "German", code: "DE")
cn = Language.create!(name: "Chinese", code: "ZH")
es = Language.create!(name: "Spanish", code: "ES")


# USER LANGUAGE SEEDS
UserLanguage.create!(user: malcolm, language: en, proficiency: 5, seeking: false, sharing: true)
UserLanguage.create!(user: malcolm, language: fr, proficiency: 2, seeking: true, sharing: false)
UserLanguage.create!(user: lynn, language: cn, proficiency: 5, seeking: false, sharing: true)
UserLanguage.create!(user: lynn, language: en, proficiency: 3, seeking: true, sharing: false)
UserLanguage.create!(user: lea, language: fr, proficiency: 5, seeking: false, sharing: true)
UserLanguage.create!(user: lea, language: en, proficiency: 4, seeking: true, sharing: false)
UserLanguage.create!(user: claire, language: en, proficiency: 4, seeking: false, sharing: true)
UserLanguage.create!(user: claire, language: fr, proficiency: 2, seeking: true, sharing: false)


User.all.each do |user|
  user_language_seeking = UserLanguage.new(
    proficiency: rand(1..3),
    seeking: true,
    sharing: false
    )
  user_language_seeking.language = Language.find(Language.pluck(:id).sample)
  user_language_seeking.user = user
  user_language_seeking.save!

  user_language_sharing = UserLanguage.new(
    proficiency: rand(4..5),
    seeking: false,
    sharing: true
    )
  user_language_sharing.language = Language.get_sharing_lang(user_language_seeking.language)
  user_language_sharing.user = user
  user_language_sharing.save!
end

# MEETUP SEEDS

puts "Destorying meetups..."
puts "Creating meetups..."

duration = [30, 60, 90, 120]

User.all.each do |user|
  3.times do
    meetup = Meetup.new(
      date: Faker::Date.backward(days: 300),
      start_time: Time.now,
      duration: duration.sample,
      location: "5333 avenue Casgrain, Montreal",
      confirmed: false,
      greeting: "Yooooo let's meet",
      )
    meetup.sender = user
    meetup.recipient = User.where.not(id: user.id).sample
    meetup.seeking_lang = user.user_languages.where(seeking: true).sample.language
    meetup.sharing_lang = user.user_languages.where(sharing: true).sample.language
    meetup.save!
  end
end
# no need to put longitude & latitude here, it is does automatically

# REVIEW SEEDS
puts "Destroying reviews.."
puts "Creating reviews..."

qualities = %w(punctual patient outgoing fun curious chatty)

User.all.each do |user|
  3.times do
    review = Review.new(
      date: Faker::Date.backward(days: 300),
      content: Faker::Lorem.sentence(word_count: 18),
      main_quality: qualities.sample
      )
    review.user = user
    review.author = User.where.not(id: user.id).sample
    review.save!
  end
end

puts "Seeding is done!"
