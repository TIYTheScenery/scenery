g = Genre.create!(category: "Theatre")
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

Performance.create!(owner_id: "", company_id: "", name: "Master Harold…and the boys by Athol Fugard", description: "Presented by Mortall Coile Theatre Company. Directed by Jesse Gephart. Featuring Gil Faison, George Hill, and Ben Pluska", trailer_link: "", ticket_link: "")

ShowTime.create!( begin_time: (8:00 PM), address: 209 Oberlin Rd, city: Raleigh, state: "NC", zip_code: 27605, date: April 14 2016)

Performance.create!(name: "Annie Jr The Musical", description: "The Musical.  Presented by CheerUp Productions")

ShowTime.create!( begin_time: (8:00 PM), address: 209 Oberlin Rd, city: Raleigh, state: "NC", zip_code: 27605, date: May 13 2016)

Performance.create!(name: "Anne of Green Gables", description: "Presented by the students of Sonorous Road")

ShowTime.create!( begin_time: (8:00 PM), address: 209 Oberlin Rd, city: Raleigh, state: "NC", zip_code: 27605, date: May 20 2016)

Performance.create!(name: "City Life", description: "Transactors Improv wraps up its main-stage season with City Life, a show about thriving and surviving in a major urban area. Featuring improvised songs, the two-act performance is based on audience suggestions and divided into five slice-of-life episodes.Over the years we Transactors have done lots of shows about small-town life but this is our first that focuses on the challenges and rewards of the big city. Strange and wonderful things happen to people when you cram a lot of them into a relatively small space.Of course we’ve done a lot of improvised music over the years and this show gives us a chance to continue the work we pioneered in this region. We’re very fortunate to have pianist Glenn Mehrbach as our accompanist.The company welcomes longtime member Steven Warnock (2001-14) back into the fold for City Life. He is joined in the cast by Anoo Brod, director Greg Hohn, Juliet Kaplan, Bart Hubbard, Steve Scott, and Jane Allen Wilson. Mike Beard is in charge of lights and sound.")

ShowTime.create!( begin_time: (8:00 PM), address: 300-G E Main St, city: Carrboro, state: "NC", zip_code: 27510, date: April 16 2016)

Performance.create!(name: "City Life", description: "Transactors Improv: For Families!")

ShowTime.create!( begin_time: (6:00 PM), address: 300-G E Main St, city: Carrboro, state: "NC", zip_code: 27510, date: April 21 2016)

Performance.create!(name: "Third Date Improv Spring Show", description: "Third Date returns to Common Ground Theatre for our Spring show. J, Nancy, Jenny and Dan will create an hour long improvised piece based on one suggestion. Third Date shows are a comic and sometimes bittersweet exploration of relationships with friends, family, partners and coworkers. They reflect the joys, surprises and everyday frustrations of life in our weird, wonderful world.")

ShowTime.create!( begin_time: (8:00 PM), address: 4815B Hillsborough Rd, city: Durham, state: "NC", zip_code: 27705, date: April 16 2016)
