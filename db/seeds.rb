10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    username: Faker::Name.first_name,
    location: Faker::Address.city,
    description: Faker::Lorem.paragraph,
    dancing_styles: ["Salsa", "Hip-Hop", "Tango", "Kizomba"].sample,
    level: ["Débutant", "Intermédiaire", "Avancé"].sample
  )
end
