# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require "open-uri"
require "yaml"

puts "destroying cratesong"
CrateSong.destroy_all
puts "destorying CRATE"
Crate.destroy_all
puts "destorying song"
puts "destroying sources"
Source.destroy_all

puts "destroying sources"
Source.destroy_all
puts "destroying cratesong"
CrateSong.destroy_all
puts "destorying song"

Song.destroy_all
puts "destorying USER"
User.destroy_all
puts "destorying CRATE"
Crate.destroy_all
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sample_artists = ["ElectroBeetle",
  "DJ PancakeFlip",
  "Funky Monocle",
  "Glitter Gator",
  "Disco Pigeon",
  "Captain Kazzoo",
  "Neon Narwhal",
  "Rhythm Raptor",
  "Pixel Pixie",
  "Groove Grizzly",
  "Synth Snail",
  "Jazz Cactus",
  "Velvet Unicorn",
  "Techno T-Rex",
  "Salsa Sloth",
  "Popcorn Parrot",
  "Maracas Moose",
  "Funk Ferret",
  "Harmonica Heathen",
  "Electric Stardust",
  "Velvet Echoes",
  "Neon Serenade",
  "Lunar Groove",
  "Synthwave Voyager",
  "Dreambound Echo"]

sample_bio = [
  "Hey there! I'm all about those cosmic vibes and electric beats. When I'm not lost in space, you'll find me creating music that'll make you groove. Retro meets futuristic in my tunes, and I'm here to take your ears on a wild ride through the stars.",
  "Yo, I'm that musical enigma in the house. My jams are like whispers in the night - soulful, haunting, and totally unpredictable. I sing about love, loss, and all the crazy stuff in between. Get ready to feel all the feels.",
  "What's up, party people? I'm the neon warrior, bringing you high-energy anthems with a major dose of retro-futuristic awesomeness. My sound is all about neon colors, electrifying beats, and a whole lot of dancing.",
  "Hey, moonchild! I'm all about those chill moonlit vibes. My music's like a cosmic hammock, letting you escape the chaos and float in dreamy soundscapes. Downtempo rhythms and dreamy melodies are my jam.",
  "Hey, city slickers! I'm the brain behind those heart-pounding electronic symphonies. My beats mirror the rhythm of the urban jungle, and my music's your soundtrack for surviving the daily grind.",
  "What's crackin'? I'm all about those mirage-like tunes that transport you to a whole new dimension. My vocals and sounds are like a dream you never want to wake up from. Dive in and let's get lost in the sound.",
  "Yo, music fam! I'm the genre-bending artist who's all about mixing things up. I love experimenting with sounds from different galaxies. Get ready for a wild sonic ride you won't forget.",
  "Hey, wanderers! I'm your guide on a sonic odyssey. My tunes are like uncharted territories waiting for you to explore. From heart-pounding beats to soothing melodies, my music's your passport to sonic adventures.",
  "Hey, peace-seekers! I craft gentle melodies that wrap you in a cosmic hug. My music's your escape from the chaos - a warm, soothing bath for your soul. Come on in and let the tranquility wash over you.",
  "What's poppin'? I'm all about those vibrant beats that'll make your feet move before you even realize it. My tunes radiate positivity and energy, turning any place into a dance floor.",
]
puts "Creating users..."
sample_artists.each do |artist_name|
  User.create!(
    email: Faker::Internet.email,
    password: "123123",
    name: Faker::Name.first_name,
    artist_name: artist_name,
    bio: sample_bio.sample
  )
end

puts "Creating us..."
devi = User.create(name: "Devi Putri", artist_name: "DJ Navi", email:"devi.putri@live.com", password: "123123", bio: "...")
jovon = User.create(name: "Jovon Miller", artist_name: "Monsieur Jovoni", email:"millerjovon1@gmail.com", password: "123123", bio: "...")
gabi = User.create(name: "Gabi Smer", artist_name: "Gabigabou", email:"gabriellesmer@gmail.com",password:"123123", bio: "...")
lili = User.create(name: "Lili Banks", artist_name: "Busy Banks", email:"lili88banks@icloud.com", password:"123123", bio: "..." )

file = File.open("app/assets/images/real_lush.wav")
# song = Song.new(title: "Lisa Ono")

puts "Creating songs..."
5.times do
  title = Faker::BossaNova.song
  base = Song.create!(
    title: title,
    genre: Faker::Music.genre,
    bpm: rand(50..200),
    instruments: Faker::Music.instrument,
    user: User.all.sample
  )
  puts "uploading audio...ç"
  base.audio_file.attach(io: file, filename: "audio.wav", content_type: "audio/wav")
  base.save
  1.times do |index|
    remix = Song.create!(
      title: "#{title}: the remix #{index + 1}",
      genre: Faker::Music.genre,
      bpm: rand(50..200),
      instruments: Faker::Music.instrument,
      user: User.all.sample

    )
    puts "uploading audio...ç"
    remix.audio_file.attach(io: file, filename: "audio.wav", content_type: "audio/wav")
    remix.save


    Source.create(remix: remix,
      base: base
    )
  end
end



puts "creating crates..."
10.times do
  Crate.create!(
    user: User.all.sample,
    name: Faker::Music.genre
  )
end

300.times do
  CrateSong.create!(
    crate: Crate.all.sample,
    song: Song.all.sample
  )
end
