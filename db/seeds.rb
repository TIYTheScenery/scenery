g = Genre.create!(category: "Theatre")
Genre.create!(category: "Improv")
Genre.create!(category: "Dance")
Genre.create!(category: "Film")


10.times do |u|
  User.create!(email: Faker::Internet.email, password: "monkey", display_name: Faker::Name.name)
end

10.times do |t|
  temp = Performance.create!(owner_id: t + 1, company_id: rand(1..100), name: Faker::Book.title, description: Faker::Hipster.paragraph, trailer_link: "www.youtube.com", ticket_link: "www.eventbrite.com")
  temp.genres << g
end
temp = Performance.create!(owner_id: 1, company_id: rand(1..100), name: Faker::Book.title, description: Faker::Hipster.paragraph, trailer_link: "www.youtube.com", ticket_link: "www.eventbrite.com")

5.times do |s|
  temp.show_times << ShowTime.create!( begin_time: Faker::Time.forward(23, :evening), address: Faker::Address.street_address, city: Faker::Address.city, state: "NC", zip_code: Faker::Address.zip_code, date: Faker::Date.forward(23))
end
