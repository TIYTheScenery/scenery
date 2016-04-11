g = Genre.create!(category: "Theatre")
Genre.create!(category: "Improv")
Genre.create!(category: "Dance")
Genre.create!(category: "Film")

User.create!(email: "littlegreenpig@gmail.com", display_name: "Jay Oberski", password: "monkey", is_professional: true, facebook_link: "jay.com", twitter_link: "jaybird", description: "Creates stuff", youtube_link: "youtube.link")

company = Company.create!(name: "Little Green Pig", description: "We create stuff", youtube_link: "youtube@link", facebook_link: "facebook_link", instagram_link: "instagram_link", twitter_link: "twitter_link", address: "", city: "Durham", state: "NC", zip_code: "")

show = Performance.create!(owner_id: 1, name: "THE PIANO HAS BEEN DRINKING: A TOM WAITS CABARET", description: "A benefit fundraiser for Little Green Pig. Two nights only, $20 suggested donation at the door. Featuring Germain Choffart, Hugh Crumley, Jessica Flemming, Trevor Johnson, Jessi Knight, Louis Landry, Anastasia Maddox, Dana Marks, Bart Matthews, Jaybird O'Berski, Liam O'Neill, Madeleine Pabis, Samantha Rahn, Rob Sharer & Tim Smith)")
show2 = Performance.create!(owner_id: 1, name: "THE NEW COLOSSUS", description: "An original adaption of Anton Chekhov’s The Sea Gull by Tamara Kissane")
show3 = Performance.create!(owner_id: 1, name: "Grounded, by George Brant", description: "From the award-winning playwright of Elephant's Graveyard, George Brant, comes the story of an ace fighter pilot whose career in the sky is ended early due to an unexpected pregnancy. Reassigned to operate military drones from a windowless trailer outside Las Vegas, she hunts terrorists by day and returns to her family each night. As the pressure to track a high-profile target mounts, the boundaries begin to blur between the desert in which she lives and the one she patrols half a world away.")
show4 = Performance.create!(owner_id: 1, name: "Master Harold ...and the boys", description: "Set in South Africa, Master Harold tells the story of a white teen who has grown up in the affectionate company of the two black waiters who work in his family's tea room. Hally learns that his viciously racist alcoholic father is on his way home from the hospital and an ensuing rage unwittingly triggers his inevitable passage into the culture of hatred fostered by apartheid.")
show5 = Performance.create!(owner_id: 1, name: "The Real Americans", description: "Armed with only a van and a tape recorder, Dan Hoyle traveled across our country in search of what’s at the heart of the heartland. In addition to downhome hospitality, he witnessed angry populism among the citizens who have been called “the real Americans.” With brilliant documentary storytelling that’s been compared to the work of Studs Terkel and Charles Kuralt, Dan helps us better understand the divide between big city and small town America.")
show6 = Performance.create!(owner_id: 1, name: "Sweeney Todd", description: "The brilliant tale of obsession and revenge, Sweeney Todd combines melodrama, murder – and “the worst pies in London” – with a sumptuous score by the incomparable Stephen Sondheim. Join the murderous barber and his culinary accomplice Mrs. Lovett for a spellbinding evening of comic turns and thrilling drama.")

company.performances << show
company.performances << show2
company.performances << show3
company.performances << show4
company.performances << show5
company.performances << show6

show.genres << g
show2.genres << g
show3.genres << g
show4.genres << g
show5.genres << g
show6.genres << g
st= ShowTime.create!(begin_time: Time.now, show_date: DateTime.new(2016,4,21), address: "33 south st.", city: "Durham", state: "NC", zip_code: "27703")
st1= ShowTime.create!(begin_time: Time.now, show_date: DateTime.new(2016,4,22), address: "33 south st.", city: "Durham", state: "NC", zip_code: "27703")
st3= ShowTime.create!(begin_time: Time.now, show_date: DateTime.new(2016,4,23), address: "33 north Ave.", city: "Raliegh", state: "NC", zip_code: "27703")
st4 = ShowTime.create!(begin_time: Time.now, show_date: DateTime.new(2016,4,3), address: "33 west Ave.", city: "Chapel Hill", state: "NC", zip_code: "27703")
st5 = ShowTime.create!(begin_time: Time.now, show_date: DateTime.new(2016,4,2), address: "33 west Ave.", city: "Chapel Hill", state: "NC", zip_code: "27703")
st6 = ShowTime.create!(begin_time: Time.now, show_date: DateTime.new(2016,4,1), address: "33 west Ave.", city: "Chapel Hill", state: "NC", zip_code: "27703")
show.show_times << st
show.show_times << st
show2.show_times << st1
show3.show_times << st3
show4.show_times << st3
show5.show_times << st5
show6.show_times << st6

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
    temp.show_times << ShowTime.create!( begin_time: Faker::Time.forward(23, :evening), address: Faker::Address.street_address, city: Faker::Address.city, state: "NC", zip_code: Faker::Address.zip_code, show_date: Faker::Date.forward(23))
  end
end
