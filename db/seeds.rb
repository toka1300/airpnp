require 'open-uri'
bathrooms = %w[https://c8.alamy.com/comp/B43KKN/furnishing-bathroom-1970s-70s-B43KKN.jpg
  https://assets.hgtv.ca/wp-content/uploads/2021/12/Simpsons-Makeover-Bathroom-1.jpg
  https://cdn.vox-cdn.com/thumbor/5Pb64L7wo29KCJUmmhRTkdGD1cA=/0x0:3024x2016/1200x800/filters:focal(1271x767:1753x1249)/cdn.vox-cdn.com/uploads/chorus_image/image/65895351/12_2014ba_bath_0505_oldhouse_0310.7.jpg
  https://www.build-review.com/wp-content/uploads/2021/02/modern-bathroom-2.jpg
  https://usagainstthehouse.files.wordpress.com/2018/08/img_1985-1.jpg?w=1100
  https://loveincorporated.blob.core.windows.net/contentimages/gallery/99b085ff-00ba-45ca-a9dc-121386d3fd73-gold-bathroom.jpg
  https://www.mydomaine.com/thmb/ak1nhpTFDwZI1WnEly6uv-drubI=/4096x2734/filters:no_upscale():max_bytes(150000):strip_icc()/unnamed-2-cfd97c57375745ceaa0bfa89c07d1e8b.jpg
  https://i.insider.com/5ea885b4e61f344041672da9?width=700
]
users = %w[https://www.nme.com/wp-content/uploads/2016/09/anchormanpress040810-1.jpg
  https://upload.wikimedia.org/wikipedia/en/thumb/d/de/Barney_Gumble.png/220px-Barney_Gumble.png
  https://faroutmagazine.co.uk/static/uploads/2021/01/Julia-Louis-Dreyfus-as-Elaine.jpg
  https://www.biography.com/.image/t_share/MTgxMDEyMDQ4NzE5NjUxOTI4/gettyimages-471835002.jpg
  https://assets.mycast.io/actor_images/actor-harry-dunne-279020_small.jpg?1633201684
  https://m.media-amazon.com/images/I/71AN6849XNL._AC_SX466_.jpg
  https://static.wikia.nocookie.net/comedybangbang/images/d/d1/Fielder.jpeg/revision/latest?cb=20130508171903
  https://upload.wikimedia.org/wikipedia/en/thumb/d/dc/MichaelScott.png/220px-MichaelScott.png
]
emails = %w[will@ferrell.com
  barney@gumble.com
  elaine@bennis.com
  hussain@bolt.com
  harry@dunn.com
  donald@trump.com
  nathana@summitice.com
  michael@dundermifflin.com
  ]

first_names = %w[Ron
  Barney
  Elaine
  Hussain
  Harry
  Donald
  Nathan
  Michael
  ]

last_names = %w[Burgundy
  Gumble
  Bennis
  Hussain
  Dunn
  Trump
  Fielder
  Scott
  ]

descriptions = ["KVWN-TV news station's bathroom. Step back in time to the glorious 1970s, where the shag carpet is plush, the wood paneling is knotty, and complimentary 'Jazz' cologne, soap and shampoo",
"Step right up folks, and get ready for the bathroom experience of a lifetime! I haven't had a job in six years, hoping this will pay the bills!",
"Introducing the ultimate bathroom experience, brought to you by the one and only Elaine Bennis. This bathroom is a work of art and has soothing music by The Eagles - Desperado. Oh and - I CAN spare a square, if you need",
"Lightning-fast bathroom, where speed and precision reign supreme. Indulge in high-tech toilets and lightning-fast hand dryers",
"Very well equipped washroom, you will have no issues, includes a bidet.",
"The BEST bathroom, HUUUGE toilet, people are saying it is the biggest ever",
"Introducing the ultimate luxury bathroom experience, brought to you by none other than Nathan Fielder. This one-of-a-kind bathroom is fully equipped with a state-of-the-art toilet, a sink that dispenses complimentary seltzer water, and a shower with a built-in 'surprise' feature. The decor is a unique blend of minimalism and absurdity, and the ambiance is second to none. But the real kicker? A fully stocked mini fridge filled with Nathan's favorite snacks. Don't miss out on this unforgettable opportunity to answer nature's call in style! Is this the next season of 'The Rehearsal'? Book the bathroom to find out!",
"People say I am the best boss and have the best bathroom. Come to Dunder Mifflin's bathroom - where paper meets people. Includes high-powered hand dryer.",
]


address = ["10 Sherbrooke St W, Montreal",
  "304 Rue de Bellechasse, Montreal",
  "6409 Rue Louis-Hémon, Montreal",
  "1108 Rue Gilford, Montreal",
  "5 Place Desjardins, Montreal",
  "4407 Rue Marquette, Montreal",
  "138 Atwater Ave, Montreal",
  "5417 Rue Saint-Urbain, Montreal",
]

# Seed users
puts "Destroying bathrooms..."
Bathroom.destroy_all
puts "Destroy users..."
User.destroy_all
puts "Creating users..."
counter = 0
users.each_with_index do |value, index|
  user = User.new(
    email: emails[counter],
    first_name: first_names[counter],
    last_name: last_names[counter],
    phone_number: Faker::PhoneNumber.phone_number,
    password: "123456"
    )
    file = URI.open(users[counter])
    user.photo.attach(io: file, filename: "nes.jpg", content_type: "image/png")
    user.save!
    puts "Created user #{index}"

    puts "Creating bathrooms..."
    bathroom = Bathroom.new(
      price: rand(3..15),
      address: address[counter],
      description: descriptions[counter]
  )
    bathroom.user = user
    file = URI.open(bathrooms[counter])
    bathroom.photo.attach(io: file, filename: "nes.jpg", content_type: "image/png")
    bathroom.save!
    puts "Created Bathroom #{index}"
    counter += 1
end

puts "Finished!"
