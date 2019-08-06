# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning articles data...'
Article.destroy_all

puts 'Creating articles'

10.times do
  title = Faker::Lorem.sentence

  content = "#{Faker::Lorem.paragraph(sentence_count: 5)}

  ![](#{Faker::LoremPixel.image(size: '800x300')})

  ## #{Faker::Lorem.words(number: 4).join(' ')}

  #{Faker::Lorem.sentences(number: 4).join}

  #{Faker::Lorem.sentences(number: 3).join}

  **#{Faker::Lorem.word}** #{Faker::Lorem.sentences(number: 3).join}

  ## #{Faker::Lorem.words(number: 3).join(' ')}

  #{Faker::Lorem.sentences(number: 3).join} [#{Faker::Lorem.words(number: 3).join(' ')}](#{Faker::Internet.url}) #{Faker::Lorem.sentences(number: 3).join}

  #{Faker::Lorem.paragraph(sentence_count: rand(4..8))}

  #{Faker::Lorem.paragraph(sentence_count: rand(4..8))}

  #{Faker::Lorem.paragraph(sentence_count: rand(4..8))}"

  new_article = Article.new(title: title, content: content)
  new_article.save
end

puts 'Finished articles seeds creation ...'
