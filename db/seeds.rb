if Rails.env.development?
  10.times do |u|
    User.create!(id: u +1, email: Faker::Internet.email, password: "monkey", display_name: Faker::Name.name)
  end

  10.times do |p|
    Performance.create!(owner_id: p+1, company_id: p+1, name: Faker::Book.title, description: Faker::Hipster.paragraph, trailer_link: "www.youtube.com", ticket_link: "www.eventbrite.com")
  end
end

Genre.create!(category: "Theatre")
Genre.create!(category: "Improv")
Genre.create!(category: "Dance")
Genre.create!(category: "Film")
