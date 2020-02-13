# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating 10 random users...'

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Date.today-25.years,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    avatar: Faker::Avatar.image
  )
  user.save!
end

cinema_colombo = Cinema.create(user: User.all.sample(1), address: 'Avenida Lusíada', name: 'Colombo')
cinema_amoreiras = Cinema.create(address: 'Av Engenheiro Duarte Pacheco', user: User.all.sample(1), name: 'Amoreiras')
cinema_uci = Cinema.create(address: 'São Sebastião', user: User.all.sample(1), name: 'El Corte Inglês')
cinema_cascais = Cinema.create(address: 'Cascais', user: User.all.sample(1), name: 'Cascais Shopping')
cinema_almada = Cinema.create(address: 'Pragal, Almada', user: User.all.sample(1), name: 'Almada Fórum')
cinema_montijo = Cinema.create(address: 'Montijo', user: User.all.sample(1), name: 'Fórum Montijo')

movie_1917 = Movie.create(title: '1917', synopsis: 'lorem', genre: 'drama', duration: '120 minutes', poster: 'https://media-cache.cinematerial.com/p/500x/haeorwgk/1917-british-movie-poster.jpg?v=1579166770', age_limit: 16, imdb_url: 'https://www.imdb.com/title/tt8579674/', cinema: Cinema.all.sample(1))
movie_parasite = Movie.create(title: 'Parasite', synopsis: 'lorem', genre: 'comedy', duration: '90 minutes', poster: 'https://fleurcinema.com/filesystem/fleur-cinema/Movies/2019/November/parasite.png', age_limit: 18, imdb_url: 'https://www.imdb.com/title/tt6751668/', cinema: Cinema.all.sample(1))
movie_judy = Movie.create(title: 'Judy', synopsis: 'lorem', genre: 'musical', duration: '110 minutes', poster: 'https://m.media-amazon.com/images/M/MV5BYmE0OTE5NWItMGYyZi00MzUxLWFjN2QtYzBkZGRjZGVmMGFmXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY999_SX648_AL_.jpg', age_limit: 14, imdb_url: 'https://www.imdb.com/title/tt7549996/', cinema: Cinema.all.sample(1))

puts 'Creating movie_sessions...'

10.times do
  movie_session = Movie_session.new(
    start_date_time: Faker::Number.decimal(l_digits: 2).between(from: '00:00', to: '24:00'),
    end_date_time: Faker::Number.decimal(l_digits: 2).between(from: '00:00', to: '24:00'),
    movie_id: Movie.all.sample(1),
    capacity: Faker::Number
  )
  movie_session.save!
end

puts 'Creating 10 random bookings...'

10.times do
  booking = Booking.new(
    user: User.all.sample(1),
    status: Faker::Boolean.boolean,
    movie_session_id: Movie_session.all.sample(1)
  )
  booking.save!
end

puts 'Creating 10 random reviews...'

10.times do
  review = Review.new(
    user: User.all.sample(1),
    date: Faker::Date,
    description: Faker::Lorem.paragraph,
    rating: Faker::Number.between(from: 0, to: 10),
    booking_id: Booking.all.sample(1)
  )
  review.save!
end
