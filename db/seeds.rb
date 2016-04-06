if if Rails.env.development?
  10.times do |u|
    User.create!(id: rand(1..100), email: Faker::Internet.email, password: "monkey", display_name: Faker::Name.name)
  end

  10.times do |p|
    Performance.create!(owner_id: rand(1..100), company_id: rand(1..100), name: Faker::Book.title, description: Faker::Hipster.paragraph, trailer_link: "www.youtube.com", ticket_link: "www.eventbrite.com")
  end
end

Genre.create!(category: "Theatre")
Genre.create!(category: "Improv")
Genre.create!(category: "Dance")
Genre.create!(category: "Film")
