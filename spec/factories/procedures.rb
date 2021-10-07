# frozen_string_literal: true

FactoryBot.define do
  factory :procedure do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
