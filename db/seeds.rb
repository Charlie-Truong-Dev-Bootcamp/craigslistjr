require 'faker'

module Seeder
  def self.category_populate
    10.times{Category.create(name: Faker::Lorem.word)}
  end

  def self.post_populate
    100.times{Post.create(title: Faker::Lorem.sentence,
      description: Faker::Lorem.sentences, category_id: rand(1..10),
      email: Faker::Internet.email, status: "open", key: rand(1..1000),
      price: rand(1.00..1000.00).round(2)
      )}
  end
end

# Seeder.category_populate
Seeder.post_populate
