# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'open-uri'

#file = open('https://res.cloudinary.com/woddi/image/upload/v1581782638/Showtime/woman-beard-transgender-lgbt-mtf-avatar-512_sdrnd1.png')

# user.image.attach(io: file, filename: 'user-image.jpg')

# url = 'https://res.cloudinary.com/woddi/image/upload/v1581782638/Showtime/woman-beard-transgender-lgbt-mtf-avatar-512_sdrnd1.png'

file = URI.open('https://res.cloudinary.com/woddi/image/upload/v1581782638/Showtime/woman-beard-transgender-lgbt-mtf-avatar-512_sdrnd1.png')
# filename = File.basename(URI.parse(url).path)

puts "Destroying models"

User.destroy_all
Cinema.destroy_all
Movie.destroy_all
MovieSession.destroy_all
Review.destroy_all
Booking.destroy_all

puts "DB cleaned"

booking_status = ["active", "cancelled", "redeemed"]

puts 'Creating 10 random users...'

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Date.today-25.years,
    email: Faker::Internet.email,
    password: "123456"
  )
  #user.avatar.attach(io: file, filename: 'user-image.jpg')

  # user.avatar.attach(io: file, filename: filename)

  user.save!
end

cinema_colombo = Cinema.create(user: User.all.sample, address: 'Avenida Lusíada', name: 'Colombo')
cinema_amoreiras = Cinema.create(address: 'Av Engenheiro Duarte Pacheco', user: User.all.sample, name: 'Amoreiras')
cinema_uci = Cinema.create(address: 'São Sebastião', user: User.all.sample, name: 'El Corte Inglês')
cinema_cascais = Cinema.create(address: 'Cascais', user: User.all.sample, name: 'Cascais Shopping')
cinema_almada = Cinema.create(address: 'Pragal, Almada', user: User.all.sample, name: 'Almada Fórum')
cinema_montijo = Cinema.create(address: 'Montijo', user: User.all.sample, name: 'Fórum Montijo')

movie_1917 = Movie.create(title: '1917', synopsis: "At the height of the First World War, two young British soldiers, Schofield (Captain Fantastic's George MacKay) and Blake (Game of Thrones' Dean-Charles Chapman) are given a seemingly impossible mission. In a race against time, they must cross enemy territory and deliver a message that will stop a deadly attack on hundreds of soldiers— Blake's own brother among them.", genre: 'Drama', duration: 120, poster: 'https://media-cache.cinematerial.com/p/500x/haeorwgk/1917-british-movie-poster.jpg?v=1579166770', age_limit: 16, imdb_url: 'https://www.imdb.com/title/tt8579674/', cinema: Cinema.all.sample)
movie_parasite = Movie.create(title: 'Parasite', synopsis: "A poor family, the Kims, con their way into becoming the servants of a rich family, the Parks. But their easy life gets complicated when their deception is threatened with exposure.", genre: 'Comedy', duration: 90, poster: 'https://fleurcinema.com/filesystem/fleur-cinema/Movies/2019/November/parasite.png', age_limit: 18, imdb_url: 'https://www.imdb.com/title/tt6751668/', cinema: Cinema.all.sample)
movie_judy = Movie.create(title: 'Judy', synopsis: "Legendary performer Judy Garland (Renée Zellweger) arrives in London in the winter of 1968 to perform a series of sold-out concerts.", genre: 'Musical', duration: 110, poster: 'https://m.media-amazon.com/images/M/MV5BYmE0OTE5NWItMGYyZi00MzUxLWFjN2QtYzBkZGRjZGVmMGFmXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY999_SX648_AL_.jpg', age_limit: 14, imdb_url: 'https://www.imdb.com/title/tt7549996/', cinema: Cinema.all.sample)
movie_gentlemen = Movie.create(title: 'The Gentlemen', synopsis: "An American expat tries to sell off his highly profitable marijuana empire in London, triggering plots, schemes, bribery and blackmail in an attempt to steal his domain out from under him.", genre: 'Action, Crime', duration: 113, poster: 'https://m.media-amazon.com/images/M/MV5BMTlkMmVmYjktYTc2NC00ZGZjLWEyOWUtMjc2MDMwMjQwOTA5XkEyXkFqcGdeQXVyNTI4MzE4MDU@._V1_SY1000_SX675_AL_.jpg', age_limit: 16, imdb_url: 'https://www.imdb.com/title/tt8367814/', cinema: Cinema.all.sample)
movie_wildrose = Movie.create(title: 'Wild Rose', synopsis: "A troubled young Glaswegian woman dreams of becoming a Nashville country star.", genre: 'Comedy, Drama, Music', duration: 101, poster: 'https://m.media-amazon.com/images/M/MV5BYjBkOTZlNmYtN2NjOS00YWM2LTk0MzMtOTEwMmIyNWIwMDA5XkEyXkFqcGdeQXVyNjg3MDMxNzU@._V1_SY1000_CR0,0,675,1000_AL_.jpg', age_limit: 14, imdb_url: 'https://www.imdb.com/title/tt5117428/', cinema: Cinema.all.sample)
movie_littlewomen = Movie.create(title: 'Little Women', synopsis: "Jo March reflects back and forth on her life, telling the beloved story of the March sisters - four young women each determined to live life on their own terms.", genre: 'Drama, Romance', duration: 135, poster: 'https://m.media-amazon.com/images/M/MV5BY2QzYTQyYzItMzAwYi00YjZlLThjNTUtNzMyMDdkYzJiNWM4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg', age_limit: 12, imdb_url: 'https://www.imdb.com/title/tt3281548/', cinema: Cinema.all.sample)
movie_badboys = Movie.create(title: 'Bad Boys For Life', synopsis: "The Bad Boys Mike Lowrey and Marcus Burnett are back together for one last ride in the highly anticipated Bad Boys for Life.", genre: 'Action, Comedy, Drama', duration: 124, poster: 'https://m.media-amazon.com/images/M/MV5BMWU0MGYwZWQtMzcwYS00NWVhLTlkZTAtYWVjOTYwZTBhZTBiXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg', age_limit: 14, imdb_url: 'https://www.imdb.com/title/tt1502397/', cinema: Cinema.all.sample)
movie_birdsofprey = Movie.create(title: 'Birds of Prey', synopsis: "After splitting with the Joker, Harley Quinn joins superheroes Black Canary, Huntress and Renee Montoya to save a young girl from an evil crime lord.", genre: 'Action, Adventure, Crime', duration: 109, poster: 'https://m.media-amazon.com/images/M/MV5BMzQ3NTQxMjItODBjYi00YzUzLWE1NzQtZTBlY2Y2NjZlNzkyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', age_limit: 16, imdb_url: 'https://www.imdb.com/title/tt7713068/?ref_=nv_sr_srsg_0', cinema: Cinema.all.sample)
movie_jojorabbit = Movie.create(title: 'Jojo Rabbit', synopsis: "A young boy in Hitler's army finds out his mother is hiding a Jewish girl in their home.", genre: 'Comedy, Drama, War', duration: 108, poster: 'https://m.media-amazon.com/images/M/MV5BZjU0Yzk2MzEtMjAzYy00MzY0LTg2YmItM2RkNzdkY2ZhN2JkXkEyXkFqcGdeQXVyNDg4NjY5OTQ@._V1_SY1000_SX667_AL_.jpg', age_limit: 12, imdb_url: 'https://www.imdb.com/title/tt2584384/?ref_=nv_sr_srsg_0', cinema: Cinema.all.sample)
movie_fantasyisland = Movie.create(title: 'Fantasy Island', synopsis: "A horror adaptation of the popular '70s TV show about a magical island resort.", genre: 'Adventure, Comedy, Horror', duration: 109, poster: 'https://m.media-amazon.com/images/M/MV5BOWE2ODZhYWYtNTFiYy00MjdmLWIzZGEtNTkyOTc1NDIwMjk4XkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SY1000_CR0,0,674,1000_AL_.jpg', age_limit: 14, imdb_url: 'https://www.imdb.com/title/tt0983946/?ref_=nv_sr_srsg_0', cinema: Cinema.all.sample)
movie_callofwild = Movie.create(title: 'The Call of the Wild', synopsis: "A sled dog struggles for survival in the wilds of the Yukon.", genre: 'Adventure, Drama, Family', duration: 110, poster: 'https://m.media-amazon.com/images/M/MV5BNWI1YzQwMDQtNzczMC00YWQ2LThmNjMtMThkMTFhNjBmMmQ3XkEyXkFqcGdeQXVyNDg4NjY5OTQ@._V1_SY1000_CR0,0,630,1000_AL_.jpg', age_limit: 12, imdb_url: 'https://www.imdb.com/title/tt7504726/?ref_=nv_sr_srsg_0', cinema: Cinema.all.sample)
movie_likeaboss = Movie.create(title: 'Like a Boss', synopsis: "Two friends with very different ideals start a beauty company together. One is more practical while the other wants to earn her fortune and live a lavish lifestyle.", genre: 'Comedy', duration: 83, poster: 'https://m.media-amazon.com/images/M/MV5BNjAyZDRjMjQtODE3MC00ODI2LTgxODktZThjYTgzZDE5NTc4XkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg', age_limit: 14, imdb_url: 'https://www.imdb.com/title/tt7545266/?ref_=nv_sr_srsg_0', cinema: Cinema.all.sample)


puts 'Creating movie_sessions...'

Movie.all.each do |movie|
  10.times do
    start_day_hour = Faker::Time.between(from: DateTime.now, to: DateTime.now + 7)
    movie_session = MovieSession.new(
      start_date: start_day_hour,
      start_time: start_day_hour.strftime("%H:%M"),
      end_date: start_day_hour + (movie.duration*60),
      movie_id: movie.id,
      capacity: rand(80..200),
      status: true,
      price: 7
    )
    movie_session.save!
  end
end

puts 'Creating bookings...'

booking_one = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_two = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_three = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_four = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_five = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_six = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_seven = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_eight = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_nine = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)
booking_ten = Booking.create(user: User.all.sample, status: booking_status.sample, movie_session: MovieSession.all.sample, price: 7, seats: 1)

# puts 'Creating 10 random bookings...'

# 10.times do
#   booking = Booking.new(
#     user: User.all.sample,
#     status: Faker::Boolean.boolean,
#     movie_session_id: MovieSession.all.sample
#   )
#   booking.save!
# end

# puts 'Creating 10 random reviews...'

# 10.times do
#   review = Review.new(
#     user: User.all.sample,
#     date: Faker::Date,
#     description: Faker::Lorem.paragraph,
#     rating: Faker::Number.between(from: 0, to: 10),
#     booking_id: Booking.all.sample
#   )
#   review.save!
# end
