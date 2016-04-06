Genre.create!(category: "Theatre")
Genre.create!(category: "Improv")
Genre.create!(category: "Dance")
Genre.create!(category: "Film")

User.create!(email: "littlegreenpig@gmail.com", display_name: "Jay Oberski", password: "monkey")
show = Performance.create!(owner_id: 1, name: "THE PIANO HAS BEEN DRINKING: A TOM WAITS CABARET", description: "A benefit fundraiser for Little Green Pig. Two nights only, $20 suggested donation at the door. Featuring Germain Choffart, Hugh Crumley, Jessica Flemming, Trevor Johnson, Jessi Knight, Louis Landry, Anastasia Maddox, Dana Marks, Bart Matthews, Jaybird O'Berski, Liam O'Neill, Madeleine Pabis, Samantha Rahn, Rob Sharer & Tim Smith)")
show2 = Performance.create!(owner_id: 1, name: "THE NEW COLOSSUS", description: "An original adaption of Anton Chekhov’s The Sea Gull by Tamara Kissane")
show.genres << g
show2.genres << g
st= ShowTime.create!(begin_time: Time.now, date: Date.new, address: "33 south st.", city: "Durham", state: "NC", zip_code: "27703")
st1= ShowTime.create!(begin_time: Time.now, date: Date.new, address: "33 south st.", city: "Durham", state: "NC", zip_code: "27703")
show.show_times << st
show2.show_times << st1

if Rails.env.development?
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
end
